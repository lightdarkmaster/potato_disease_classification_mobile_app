// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CameraWidget> {
  File? _image;
  Interpreter? interpreter;
  List<String> labels = [];
  int resultIndex = -1;
  double confidence = 0;
  List<List<List<num>>> imageMatrixF = [];

  @override
  void initState() {
    super.initState();
    _loadModel();
    _loadLabels();
  }

  Future _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 100);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      imageMatrixF = await convertImageToMatrix(_image!);
      //print(imageMatrixF.shape);
    } else {
      debugPrint('No image selected.');
    }
    setState(() {});
  }

  Future _captureImage() async {
    final picker = ImagePicker();
    final capturedImage = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 100);

    if (capturedImage != null) {
      _image = File(capturedImage.path);
      imageMatrixF = await convertImageToMatrix(_image!);
      //print(imageMatrixF.shape);
    } else {
      debugPrint('No image captured.');
    }
    setState(() {});
  }

  Future<List<List<List<num>>>> convertImageToMatrix(File imageFile) async {
    final image = img.decodeImage(await imageFile.readAsBytes())!;

    List<List<List<num>>> imageMatrix = [];

    for (int y = 0; y < image.height; y++) {
      List<List<num>> row = [];
      for (int x = 0; x < image.width; x++) {
        var pixelColor = image.getPixel(x, y);

        int red = pixelColor.r.toInt();
        int green = pixelColor.g.toInt();
        int blue = pixelColor.b.toInt();

        row.add([red, green, blue]);
      }
      imageMatrix.add(row);
    }
    debugPrint(imageMatrix.length.toString());
    return imageMatrix;
  }

  Future<void> _loadModel() async {
    final options = InterpreterOptions();
    const modelPath = 'assets/model_MobileNetv3L_finetuned.tflite';
    interpreter = await Interpreter.fromAsset(modelPath, options: options);
  }

  Future<void> _loadLabels() async {
    final labelTxt = await rootBundle.loadString("assets/123labels.txt");
    labels = labelTxt.split('\n');
  }

  Future<Map<String, dynamic>> runInference(
      List<List<List<num>>> imageMatrix) async {
    final input = [imageMatrix];
    final output = [List<double>.filled(4, 0)]; //culprit
    //print("shapes:");
    //print(input.shape);
    //print(output.shape);
    interpreter!.run(input, output);

    final result = output.first;
    final index = result
        .indexOf(result.reduce((curr, next) => curr > next ? curr : next));
    final confidence = result[index];
    //print(labels[index]);
    return {'index': index, 'confidence': confidence};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture/Upload Potato Leaf'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: _image != null
                  ? Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text('Your image appears here'),
                    ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 350, // Adjust width as needed
              height: 200, // Adjust height as needed
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.image),
                        label: const Text('Pick Image'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: _captureImage,
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Capture Image'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (_image == null) {
                            debugPrint('No image selected.');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No image selected.'),
                              ),
                            );
                            return;
                          }

                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          final inferenceResult =
                              await runInference(imageMatrixF);
                          resultIndex = inferenceResult['index'];
                          confidence = inferenceResult['confidence'];

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                          setState(() {});
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text(
                            "Run Inference"), // Empty string as label
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            if (resultIndex != -1)
              SizedBox(
                width: 350, // Adjust width as needed
                height: 150, // Adjust height as needed
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        const Text(
                          "RESULTS:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Label: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: labels[resultIndex],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Confidence: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${(confidence * 100).toStringAsFixed(2)}%',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
