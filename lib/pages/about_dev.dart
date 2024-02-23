import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Developer'),
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
                      'assets/images/Chan.jpg', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Meet Christian Barbosa, a Bachelor in Science in Information Technology (BSIT) student in Leyte Normal University (LNU), driven by his passion for both technology and agriculture. With a background in Information Technology and a deep-rooted connection to his familys farming heritage, Christian embarked on a mission to bridge the gap between these seemingly disparate fields. Drawing inspiration from his childhood spent tending to potato crops alongside his grandparents, he embarked on the creation of a groundbreaking potato disease application.',
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
                      'assets/images/ChanFbBG.png', // Path to local image asset
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Combining his expertise in programming with his intimate knowledge of agricultural challenges, Christian meticulously developed an intuitive mobile app powered by Convolutional Neural Networks (CNN). Through tireless dedication and innovation, he successfully crafted a transformative tool that not only simplifies disease classification for farmers but also promises to revolutionize crop management practices worldwide. Christian"s unwavering commitment to merging technology with agriculture highlights her as a pioneering force driving positive change in both industries.',
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
