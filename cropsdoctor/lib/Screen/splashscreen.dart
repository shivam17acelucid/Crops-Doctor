import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/queryScreen');
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Rova-logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}