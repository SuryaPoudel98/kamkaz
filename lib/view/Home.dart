// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaamkaaz/view/MoreScreens.dart';
import 'package:kaamkaaz/view/Profile.dart';
import 'package:kaamkaaz/view/SelectJobCategory.dart';
import 'package:kaamkaaz/view/homes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int currentindex = 0;
  final tabs = [const Homes(), const Profile(), const MoreScreens()];
  @override
  Widget build(BuildContext context) {
    save.saved = [];
    // ignore: prefer_const_constructors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[currentindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BottomNavigationBar(
            currentIndex: currentindex,
            unselectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
            selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_outlined), label: 'More'),
            ],
            backgroundColor: const Color(0xffB38851),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
