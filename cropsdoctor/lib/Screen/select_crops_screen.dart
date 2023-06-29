import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/select_crops_model.dart';

class SelectCropsScreen extends StatefulWidget {
  const SelectCropsScreen({super.key});

  @override
  State<SelectCropsScreen> createState() => _SelectCropsScreen();
}

class _SelectCropsScreen extends State<SelectCropsScreen> {
  bool showLoder = true;

  @override
  void initState() {
    super.initState();
  }

  List<int> selectedItems = [];

  static List<SelectCropModel> main_selectCropList = [
    SelectCropModel('Apple', 'assets/images/apple.png'),
    SelectCropModel('Banana', 'assets/images/banana.png'),
    SelectCropModel('Bean', 'assets/images/beans.png'),
    SelectCropModel('Brinjal', 'assets/images/brinjal.png'),
    SelectCropModel('Cabbage', 'assets/images/cabbage.png'),
    SelectCropModel('Capsicum & Chilli', 'assets/images/capsicum.png'),
    SelectCropModel('Chickpea & Gram', 'assets/images/chickpea.png'),
    SelectCropModel('Cotton', 'assets/images/cotton.png'),
    SelectCropModel('Cucumber', 'assets/images/cucumber.png'),
    SelectCropModel('Ginger', 'assets/images/ginger.png'),
    SelectCropModel('Mango', 'assets/images/mango.png'),
  ];

  List<SelectCropModel> display_selectCropList = List.from(main_selectCropList);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF1F1F1),
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showLoder = false;
      });
    });
    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        body: showLoder == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: SafeArea(
                      left: true,
                      top: true,
                      right: true,
                      bottom: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            color: const Color(0xFFF1F1F1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Select crops',
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.3,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Select up to multiple crops you are interested in',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.3,
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          '${selectedItems.length}/${main_selectCropList.length}',
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.3,
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text(
                                      'You can always change it later.',
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          color: Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
                            child: Container(
                              // padding: const EdgeInsets.all(5),
                              // margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: display_selectCropList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  final isSelected =
                                      selectedItems.contains(index);
                                  return InkWell(
                                    onTap: () {
                                      // Toggle selection
                                      if (isSelected) {
                                        selectedItems.remove(index);
                                      } else {
                                        selectedItems.add(index);
                                      }
                                      print(selectedItems);
                                      // Refresh UI
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 80,
                                              height: 80,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: isSelected
                                                        ? const Color.fromARGB(
                                                            255, 1, 39, 70)
                                                        : Colors.white,
                                                    width: 1,
                                                  ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(40))),
                                              child: Image.asset(
                                                '${display_selectCropList[index].crop_image}',
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                              )),
                                          Container(
                                            height: 40,
                                            width: 100,
                                            margin: const EdgeInsets.only(top: 5),
                                            child: Text(
                                              '${display_selectCropList[index].crop_name}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xFF3D1766),
                                                  fontSize: 16,
                                                  letterSpacing: 0.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                            height: 45,
                            margin: EdgeInsets.only(left: 10, right: 10, top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/ImageChooserScreen');
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.4,
                                      fontSize: 16,
                                      ),
                                ))
                                ),
                                Container(
                                  child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/ImageChooserScreen');
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.4,
                                      fontSize: 16,
                                      ),
                                ))
                                )
                              ],
                            )
                            // child: ElevatedButton(
                            //   style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                            //     onPressed: () {
                            //       Navigator.pushNamed(context, '/ImageChooserScreen');
                            //     },
                            //     child: const Text(
                            //       'Next',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontFamily: 'Poppins',
                            //           letterSpacing: 0.4,
                            //           fontSize: 16,
                            //           ),
                            //     )),
                                                  ),
                          )
                        ],
                      )),
                ),
            ));
  }
}
