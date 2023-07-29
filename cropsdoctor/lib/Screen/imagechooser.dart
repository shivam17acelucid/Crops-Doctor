// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:cropsdoctor/Screen/result_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ImageChooserScreen extends StatefulWidget {
//   @override
//   State<ImageChooserScreen> createState() => _ImageChooserScreenState();
// }

// class _ImageChooserScreenState extends State<ImageChooserScreen> {
//   String imagepath = "";
//   bool showLoder = true;

//   Future getImageFromGallery() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       final imageTemporary = image.path;
//       setState(() {
//         this.imagepath = imageTemporary;
//         _storeUserData();
//         // Navigator.of(context)
//         // .push(MaterialPageRoute(builder: (_) => ResultScreen(image: image)));
//       });
//     }
//   }

//   Future getImageFromCamera() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image != null) {
//       final imageTemporary = image.path;
//       setState(() {
//         this.imagepath = imageTemporary;
//         _storeUserData();
//       });
//     }
//   }

//   _storeUserData() async {
//     File imagefile = File(imagepath); //convert Path to File
//     Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
//     String base64string =
//         base64.encode(imagebytes); //convert bytes to base64 string
//     print(base64string);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() {
//         showLoder = false;
//       });
//     });
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: null,
//       body: showLoder == true
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               padding: const EdgeInsets.all(10),
//               color: Colors.white,
//               child: SafeArea(
//                   left: true,
//                   top: true,
//                   right: true,
//                   bottom: true,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Center(
//                               child: Container(
//                                 width: 335,
//                                 height: 150,
//                                 margin: const EdgeInsets.only(top: 120),
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(20),
//                                       bottomRight: Radius.circular(20)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       blurRadius: 20.0, // Soften the shaodw
//                                       spreadRadius: 3.0,
//                                       offset: Offset(0.0, 0.0),
//                                     )
//                                   ],
//                                 ),
//                                 child: Center(
//                                     child: Container(
//                                         width: 120,
//                                         height: 120,
//                                         padding: const EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                             color: Colors.red.shade50,
//                                             width: 1.5,
//                                           ),
//                                           boxShadow: const [
//                                             BoxShadow(
//                                               color: Colors.white,
//                                               blurRadius:
//                                                   10.0, // Soften the shaodw
//                                               spreadRadius: 3.0,
//                                               offset: Offset(0.0, 0.0),
//                                             )
//                                           ],
//                                           borderRadius: const BorderRadius.all(
//                                               Radius.circular(60)),
//                                         ),
//                                         child: imagepath != ""
//                                             ? CircleAvatar(
//                                                 backgroundImage:
//                                                     FileImage(File(imagepath)),
//                                                 radius: 65.0,
//                                               )
//                                             : const Image(
//                                                 image: NetworkImage(
//                                                     'https://static.vecteezy.com/system/resources/previews/008/442/086/original/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg'),
//                                                 fit: BoxFit.contain,
//                                               ))),
//                               ),
//                             ),
//                             Center(
//                               child: Container(
//                                   width: 335,
//                                   height: 270,
//                                   margin:
//                                       const EdgeInsets.only(top: 8, bottom: 10),
//                                   padding: const EdgeInsets.all(15),
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(20),
//                                         bottomLeft: Radius.circular(20)),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 20.0, // Soften the shaodw
//                                         spreadRadius: 3.0,
//                                         offset: Offset(0.0, 0.0),
//                                       )
//                                     ],
//                                   ),
//                                   child: Center(
//                                       child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         'Take a Image of Crop',
//                                         style: GoogleFonts.merriweather(
//                                           color: Color(0xFF3D1766),
//                                           letterSpacing: 0.3,
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Show us the image of leaf of crops',
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.merriweather(
//                                           color: const Color(0xFF3D1766),
//                                           letterSpacing: 0.3,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       Container(
//                                         width: 260,
//                                         height: 45,
//                                         margin: const EdgeInsets.only(
//                                             top: 20, bottom: 10),
//                                         child: ElevatedButton(
//                                             onPressed: () {
//                                               getImageFromCamera();
//                                             },
//                                             child: const Text(
//                                               'TAKE PHOTO',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: 'Poppins',
//                                                   letterSpacing: 0.4,
//                                                   fontSize: 16),
//                                             )),
//                                       ),
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Text(
//                                           'OR',
//                                           style: GoogleFonts.merriweather(
//                                             color: const Color(0xFF3D1766),
//                                             letterSpacing: 0.3,
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         width: 260,
//                                         height: 45,
//                                         margin: const EdgeInsets.only(
//                                           top: 20,
//                                         ),
//                                         child: ElevatedButton(
//                                             onPressed: () {
//                                               getImageFromGallery();
//                                             },
//                                             child: const Text(
//                                               'ACCESS GALLERY',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: 'Poppins',
//                                                   letterSpacing: 0.4,
//                                                   fontSize: 16),
//                                             )),
//                                       ),
//                                     ],
//                                   ))),
//                             )
//                           ],
//                         ),
//                         Container(
//                           width: 260,
//                           height: 45,
//                           margin: const EdgeInsets.only(
//                             top: 130,
//                           ),
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         ResultScreen(imagepath: imagepath),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 'Next',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Poppins',
//                                     letterSpacing: 0.4,
//                                     fontSize: 16),
//                               )),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:cropsdoctor/Screen/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageChooserScreen extends StatefulWidget {
  const ImageChooserScreen({super.key});

  @override
  State<ImageChooserScreen> createState() => _ImageChooserScreenState();
}

class _ImageChooserScreenState extends State<ImageChooserScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool showLoder = true;
  String imagepath = "";

  Future getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageTemporary = image.path;
      setState(() {
        imagepath = imageTemporary;
        print(image);

        Timer(const Duration(seconds: 3), (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultScreen(data: imageTemporary);
          }));
        }));
      });
    }
  }

  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageTemporary = image.path;
      setState(() {
        imagepath = imageTemporary;
        Timer(const Duration(seconds: 3), (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultScreen(data: imageTemporary);
          }));
        }));
      });
    }
  }

  _storeUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userImg', imagepath);
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
                    child: Column(
                      children: [
                        Container(
                          width: 260,
                          height: 260,
                          margin: const EdgeInsets.only(top: 100),
                          child: imagepath != ""
                              ? new CircleAvatar(
                                  backgroundImage:
                                      new FileImage(File(imagepath)),
                                  radius: 65.0,
                                )
                              : Image.asset(
                                  'assets/images/camera.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Container(
                          width: 260,
                          height: 45,
                          margin: const EdgeInsets.only(top: 80, bottom: 10),
                          child: ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //   primary: Colors.yellow,
                              //   onPrimary: Colors.black, // Background color
                              // ),
                              onPressed: () {
                                getImageFromCamera();
                              },
                              child: const Text(
                                'TAKE PHOTO',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.4,
                                    fontSize: 16),
                              )),
                        ),
                        Container(
                          width: 260,
                          height: 45,
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                getImageFromGallery();
                              },
                              child: const Text(
                                'ACCESS GALLERY',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.4,
                                    fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
