// ignore: file_names
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:potato_disease_classification/pages/homescreen.dart';
import 'procerdure_page.dart';
import 'about_dev.dart';
import 'camera_widget.dart';
import 'about_app.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<Homepage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(75.0), // Set your desired height here
        child: AppBar(
          title: const Text(
            "Potato Disease Classification",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: const Color.fromARGB(96, 105, 255, 36),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.android_rounded,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.photo_camera,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.info,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.person_3_sharp,
            size: 30,
            color: Colors.black,
          ),
        ],
        color: const Color.fromARGB(96, 105, 255, 36),
        buttonBackgroundColor: const Color.fromARGB(255, 105, 255, 36),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: getPage(_page),
    );
  }

  Widget getPage(int page) {
    switch (page) {
      case 0:
        return const HomeWidget();
      case 1:
        return const SafetyWidget();
      case 2:
        return const CameraWidget();
      case 3:
        return const AnalyticsWidget();
      case 4:
        return const ChatWidget();
      default:
        return Container(); // Default page, you can replace it with another widget.
    }
  }
}
//