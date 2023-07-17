import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<ResultScreen> createState() => _ResultScreen();
  final imagepath;
  ResultScreen({required this.imagepath});
}

class _ResultScreen extends State<ResultScreen> {
  bool showLoder = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showLoder = false;
      });
    });
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: showLoder == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: SafeArea(
                  left: true,
                  top: true,
                  right: true,
                  bottom: true,
                  child: SingleChildScrollView(
                    // child: Image.file(imagepath)
                  )
                )
            )
    );
  }
}
