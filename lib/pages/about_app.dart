import 'package:flutter/material.dart';

class SafetyWidget extends StatelessWidget {
  const SafetyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This Application'),
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
                      'assets/images/ai.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' AI and agriculture in the same sentence may have seemed like a strange combination. After all, agriculture has been the backbone of human civilization for millennia, providing sustenance as well as contributing to economic development, while even the most primitive AI only emerged several decades ago. Nevertheless, innovative ideas are being introduced in every industry, and agriculture is no exception.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/pic11.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Introducing Potato Scan, A Groundbreaking mobile application at the intersection of agriculture and cutting-edge technology. Developed using the Flutter framework and Dart programming language, Potato Scan leverages the power of Convolutional Neural Networks (CNN) and Artificial Intelligence (AI) to revolutionize crop management practices. Through seamless integration with Python, the app utilizes a meticulously trained CNN model to analyze images of crop diseases captured by farmers in real-time.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ai12.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' By harnessing the collective expertise of agronomy and machine learning, Potato Scan empowers farmers with instantaneous and accurate diagnoses, enabling proactive responses to threats and ultimately optimizing crop yields. With its intuitive interface and advanced AI capabilities, Potato Scan stands as a testament to innovation, offering a transformative solution to the challenges facing modern agriculture.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/potato-scan.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Introducing a groundbreaking mobile app designed to revolutionize potato disease classification through cutting-edge technology. Powered by Convolutional Neural Networks (CNN), this app employs state-of-the-art image recognition algorithms to swiftly identify and classify various diseases affecting potato crops with unparalleled accuracy. By simply capturing an image of the affected foliage, users can receive instant diagnoses and actionable insights, empowering farmers to swiftly respond to potential threats, optimize crop management strategies, and ultimately safeguard their yields. With its intuitive interface and advanced machine learning capabilities, this app stands as a game-changer in modern agriculture, offering a seamless solution to enhance productivity and mitigate crop losses.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/ai3.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'The potato disease classification mobile app utilizing CNN technology represents a pivotal advancement in agricultural innovation. By harnessing the power of artificial intelligence and image recognition, it not only streamlines disease identification processes but also empowers farmers to make informed decisions promptly, ultimately contributing to improved crop health, increased yields, and sustainable farming practices. With its potential to revolutionize the way potato diseases are managed, this app holds promise for transforming the agricultural landscape and addressing pressing challenges in food security worldwide.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
