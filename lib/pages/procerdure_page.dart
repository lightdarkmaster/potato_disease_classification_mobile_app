import 'package:flutter/material.dart';

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Use this App'),
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
                      'assets/images/ai4.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '1. Install App in your device',
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
                      'assets/images/ai5.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '2. Open App in your phone',
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
                      'assets/images/ai6.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '3. Navigate to camera icon in the navigation bar below.',
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
                      'assets/images/ai7.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '4. Upload potato image file or capture image of potato leaf.',
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
                      'assets/images/ai8.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '5. Or Take a photo of the potato leaf',
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
                      'assets/images/ai9.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '6. Press "Run Inference"  Button to see results',
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
                      'assets/images/ai10.jpeg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '7. See Results from the app',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Add space between cards
              // Add more Card widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
