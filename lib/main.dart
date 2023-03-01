// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaamkaaz/api/Connection.dart';
import 'package:kaamkaaz/api/SharedServices1.dart';
import 'package:kaamkaaz/view/Bookmarks.dart';

import 'package:kaamkaaz/view/Home.dart';
import 'package:kaamkaaz/view/JobDescription.dart';
import 'package:kaamkaaz/view/Login.dart';
import 'package:kaamkaaz/view/MoreScreens.dart';
import 'package:kaamkaaz/view/Register.dart';
import 'package:kaamkaaz/view/SelectJobCategory.dart';
import 'package:kaamkaaz/view/applied.dart';
// ignore: depend_on_referenced_packages
import 'package:wakelock/wakelock.dart';

import 'api/JobCategory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
    Wakelock.enable();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    sharedPref.setislogged();
    sharedPref.setislogged();

    sharedPref.getUserid();
    Connection.setConncetion();
    APiJObCategory.getjobs();
    sharedPref.getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KaamKaaz',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/Home',
      routes: {
        '/Home': (context) => const Home(),
        '/Login': (context) => const Login(),
        '/Register': (context) => const Register(),
        '/Bookmarks': (context) => const BookMarks(),
        '/Applied': (context) => const Applied(),
      },
    );
  }
}
