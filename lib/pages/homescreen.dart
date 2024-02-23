import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduction '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/potato-farming.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Potatoes (Solanum tuberosum) are the world’s most important vegetable crop. Due to the vast diversity in types and high consumer consumption, potatoes are a good enterprise option for many growers. Around 130 and 95 developing nations grow potatoes, the world’s fourth most important staple food. The output of potatoes worldwide has been steadily increasing over the past year, including in emerging nations. However, it is also estimated that over 32% of potatoes are lost annually due to illnesses and pests” [1].',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space between cards
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/imageFarming.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Potato farmers in Bangladesh lose at least Tk 2,500 crore every year due to unsold surplus production and postharvest losses” [2]. In order to help our framer, we have proposed a model based on convolutional neural network to classify potato leaf disease',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space between cards
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/potato-diseases.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Potato farming dominates as an occupation within the agriculture domain in additional than 125 countries. However, even these crops are subjected to infections and diseases, primarily categorized into two grades: (i) Early blight and (ii) Late blight. Moreover, these diseases cause damage the crop and reduce its production. In fact, potatoes have a more favorable overall nutrient-to-price ratio than many other fruits and vegetables and are an affordable source of nutrition worldwide” [3]. Late blight damages leave, stems, and tubers. The leaves affected by this disease appear blistered and dry out.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space between cards

              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/potato-blight.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'When drying out, leaves turn brown or black in color. The remedy to the matter is high humidity, cold, and leaf wetness. The primary blight could also be a specific disease occurring on the foliage at any stage of the expansion, causing characteristic leaf spots and blight. The primary blight is first observed on the plants as small black lesions totally on the older foliage. Lesions on the stems are quite like those on leaves, sometimes girdling the plant if they occur near the soil line. The remedy to the problem is warm, rainy, and wet weather” [4].',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space between cards

              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/potato-farming.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Identifying diseases in potato plants quickly and accurately is important to chop back the impact of diseases on plants. Manual monitoring activities dispensed by farmers become difficult and impractical because it takes an extended time and in-depth knowledge. Identification of plants diseases types that are slow will trigger the spread of diseases in plants uncontrollably. Besides, farmers generally identify diseases in plants in some way that’s approximately and assumptions that allow inaccurate identification results because the symptoms on the leaves appear to possess similarities that are difficult to elucidate at a glance”. [5] “Farmers use the results of personal identification without expert advice within the sector of plant diseases as a reference for preventing plants infected with the disease. As a result, preventive measures taken by farmers could even be ineffective and will damage crops thanks to inadequate knowledge and misinterpretation of disease intensity, excessive dosage, or lack of dosage” [5]. This problem is that the inspiration of the proposed research is to facilitate farmers in identifying and classifying diseases in potato plants that are fast and accurate.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space between cards

              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/preventing.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' “Farmers use the results of personal identification without expert advice within the sector of plant diseases as a reference for preventing plants infected with the disease. As a result, preventive measures taken by farmers could even be ineffective and will damage crops thanks to inadequate knowledge and misinterpretation of disease intensity, excessive dosage, or lack of dosage” [5]. This problem is that the inspiration of the proposed research is to facilitate farmers in identifying and classifying diseases in potato plants that are fast and accurate.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Add space between cards
              // Add more Card widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
