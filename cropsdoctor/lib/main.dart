import 'dart:collection';

import 'package:cropsdoctor/Screen/imagechooser.dart';
import 'package:cropsdoctor/Screen/location_screen.dart';
import 'package:cropsdoctor/Screen/select_crops_screen.dart';
import 'package:cropsdoctor/Screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cropsdoctor/Screen/splashscreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // initialRoute: '/',
      routes: {
        '/ImageChooserScreen': (context) => ImageChooserScreen(),
        '/queryScreen':(context) => const SelectCropsScreen(),
        '/accessLocationScreen':(context) => AccessLocationScreen(),
        // '/resultScreen':(context) => ResultScreen()
      },
      title: 'Rova-23',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}