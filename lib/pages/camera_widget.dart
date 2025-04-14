import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
    final output = [
      List<double>.filled(4, 0)
    ]; // Adjust based on your model's output
    interpreter!.run(input, output);

    final result = output.first;
    final index = result
        .indexOf(result.reduce((curr, next) => curr > next ? curr : next));
    final confidence = result[index];
    return {'index': index, 'confidence': confidence};
  }

  // Function to launch URLs
Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  debugPrint('Attempting to launch URL: $url');

  if (await canLaunchUrl(uri)) {
    final bool launched = await launchUrl(uri);
    if (launched) {
      debugPrint('URL launched successfully');
    } else {
      debugPrint('Failed to launch $url');
    }
  } else {
    debugPrint('Could not launch $url');
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture/Upload Potato Leaf'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Container
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'Your image appears here',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
              const SizedBox(height: 20),

              // Buttons Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.image),
                        label: const Text('Pick Image'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: _captureImage,
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Capture Image'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (_image == null) {
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
                        label: const Text("Run Inference"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Results Card
              if (resultIndex != -1)
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "RESULTS:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),

                        // Recommendation for Early Blight
                        if (labels[resultIndex]
                            .toLowerCase()
                            .contains('early blight'))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Recommendation:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Pesticide:\n"
                                "- Amistar Top pesticide: at a rate of 50 cm³ / 100 liters of water.\n"
                                "- Pellez pesticide: at a rate of 50 g / 100 liters of water.\n"
                                "- Score pesticide: at a rate of 50 g / 100 liters of water.\n"
                                "- Avoid overhead watering to prevent spreading.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Links:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _launchURL(
                                    'https://www.youtube.com/watch?v=ld9-5D2l3qA&t=31s'),
                                child: const Text(
                                  "Watch YouTube Video on Early Blight",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _launchURL(
                                    'https://learn.agrogatemasr.com/early-symposium-in-potatoes/'),
                                child: const Text(
                                  "Learn More About Early Blight",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        // Recommendation for Early Blight
                        if (labels[resultIndex]
                            .toLowerCase()
                            .contains('undefined'))
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recommendation:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Not A Potato Leaf:\n"
                                "- Be sure that the image is a potato leaf.\n"
                                "- Provide a clear image/subject.\n"
                                "- Undefined.\n"
                                "- Take another image",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),

                        // Recommendation for Late Blight
                        if (labels[resultIndex]
                            .toLowerCase()
                            .contains('late blight'))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Recommendation:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Pesticide:\n"
                                "-Copper aerobatics:- 46% at a rate of 250 gm/100 liters of water.\n"
                                "-Amistar:- 25% at a rate of 50 cm/100 liters of water.\n"
                                "-Rivas:- 25% at a rate of 50 cm/100 liters of water.\n"
                                "-Belize:- 75 mg/100 liters of water.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Links:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _launchURL(
                                    'https://www.youtube.com/watch?v=S-svsEU3aco&t=7s'),
                                child: const Text(
                                  "Watch YouTube Video on Late Blight",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _launchURL(
                                    'https://learn.agrogatemasr.com/potato-late-blight-disease/'),
                                child: const Text(
                                  "Learn More About Late Blight",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
