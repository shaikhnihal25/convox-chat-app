import 'dart:io';

import 'package:convox/screens/login.dart';
import 'package:convox/services/auth_services.dart';
import 'package:convox/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../utils/iColors.dart';
import '../utils/theme_model.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File _imageFile;
  final picker = ImagePicker();
  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      Fluttertoast.showToast(msg: "Image is not selected");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => SignUpScreen())));
    } else {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPAssword = TextEditingController();

  bool isValid = true;
  bool isObsecure = true;
  bool isObsecureConfirm = true;
  bool isValidConfirm = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? IColors.title : IColors.background,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height / 20,
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 48,
                      color: themeNotifier.isDark
                          ? IColors.background
                          : IColors.title,
                      fontFamily: GoogleFonts.mavenPro().fontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              //---------Form--------//
              Container(
                height: height / 1.4,
                width: width / 1.2,
                decoration: BoxDecoration(
                    color: themeNotifier.isDark
                        ? IColors.background
                        : IColors.title,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    //----------Username------------//
                    //------------------------------//
                    //----------Label-01------------//
                    Padding(
                      padding:
                          EdgeInsets.only(top: height / 30, right: width / 2.2),
                      child: Text(
                        "Full Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.mavenPro().fontFamily,
                            color: IColors.placeholderText),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    //-------------------//
                    //------Input--------//
                    Container(
                      height: height / 18,
                      width: width / 1.5,
                      decoration: BoxDecoration(
                          color: IColors.placeholder,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 30),
                        child: TextField(
                          controller: name,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              fontFamily: GoogleFonts.mavenPro().fontFamily,
                              color: IColors.title,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "eg: Elon Musk",
                              hintStyle: TextStyle(
                                  fontFamily: GoogleFonts.mavenPro().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: IColors.placeholderText),
                              suffixIcon: Icon(
                                Icons.person,
                                color: IColors.placeholderText,
                              )),
                        ),
                      ),
                    ),
                    //-------------------//
                    //-----------------Email--------------------//
                    //----------Username------------//
                    //------------------------------//
                    //----------Label-01------------//
                    Padding(
                      padding:
                          EdgeInsets.only(top: height / 30, right: width / 2.8),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.mavenPro().fontFamily,
                            color: IColors.placeholderText),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    //-------------------//
                    //------Input--------//
                    Container(
                      height: height / 18,
                      width: width / 1.5,
                      decoration: BoxDecoration(
                          color: IColors.placeholder,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 30),
                        child: TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: GoogleFonts.mavenPro().fontFamily,
                              color: IColors.title,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "elon@musk.com",
                              hintStyle: TextStyle(
                                  fontFamily: GoogleFonts.mavenPro().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: IColors.placeholderText),
                              suffixIcon: Icon(
                                Icons.person,
                                color: IColors.placeholderText,
                              )),
                          onEditingComplete: () {
                            if (!email.text.contains("@")) {
                              Fluttertoast.showToast(msg: "Email is not valid");
                            }
                          },
                        ),
                      ),
                    ),
                    //-------------------//
                    //----------------Password------------------//
                    Padding(
                      padding:
                          EdgeInsets.only(top: height / 30, right: width / 3.2),
                      child: Text(
                        "Create Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.mavenPro().fontFamily,
                            color: IColors.placeholderText),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    //-------------------//
                    //------Input--------//
                    Container(
                      height: height / 18,
                      width: width / 1.5,
                      decoration: BoxDecoration(
                          color: IColors.placeholder,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 30),
                        child: TextField(
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObsecure,
                          style: TextStyle(
                              color: IColors.title,
                              fontFamily: GoogleFonts.mavenPro().fontFamily,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "XXXXXXX",
                              hintStyle: TextStyle(
                                  fontFamily: GoogleFonts.mavenPro().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: IColors.placeholderText),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObsecure = !isObsecure;
                                  });
                                },
                                icon: Icon(
                                    isObsecure ? Icons.lock : Icons.lock_open),
                                color: isValid
                                    ? IColors.placeholderText
                                    : IColors.green,
                              )),
                          onEditingComplete: () {
                            if (password.text.length < 8) {
                              Fluttertoast.showToast(
                                  msg: "Password is not valid");
                            }
                          },
                          onChanged: (value) {
                            if (password.text.length > 8) {
                              setState(() {
                                isValid = false;
                              });
                            } else {
                              setState(() {
                                isValid = true;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    //--------------------------------//
                    //-----------Confirm Password-----------------//
                    //----------------Password------------------//
                    Padding(
                      padding:
                          EdgeInsets.only(top: height / 30, right: width / 3.6),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.mavenPro().fontFamily,
                            color: IColors.placeholderText),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    //-------------------//
                    //------Input--------//
                    Container(
                      height: height / 18,
                      width: width / 1.5,
                      decoration: BoxDecoration(
                          color: IColors.placeholder,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 30),
                        child: TextField(
                          controller: confirmPAssword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObsecureConfirm,
                          style: TextStyle(
                              color: IColors.title,
                              fontFamily: GoogleFonts.mavenPro().fontFamily,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "XXXXXXX",
                              hintStyle: TextStyle(
                                  fontFamily: GoogleFonts.mavenPro().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: IColors.placeholderText),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObsecureConfirm = !isObsecureConfirm;
                                  });
                                },
                                icon: Icon(isObsecureConfirm
                                    ? Icons.lock
                                    : Icons.lock_open),
                                color: isValidConfirm
                                    ? IColors.placeholderText
                                    : IColors.green,
                              )),
                          onEditingComplete: () {
                            if (confirmPAssword.text != password.text) {
                              Fluttertoast.showToast(
                                  msg: "Password not matched!");
                            }
                          },
                          onChanged: (value) {
                            if (confirmPAssword.text == password.text) {
                              setState(() {
                                isValidConfirm = false;
                              });
                            } else {
                              setState(() {
                                isValidConfirm = true;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    //--------------------------------//
                    //----------Submit-Button-------------//
                    SizedBox(
                      height: height / 15,
                    ),
                    //----------Image-Picker-----------//

                    //------------------------------//
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        height: height / 18,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                            color: themeNotifier.isDark
                                ? IColors.title
                                : IColors.background,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            _imageFile == null ? "Pick Image" : "Selected",
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: GoogleFonts.mavenPro().fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: themeNotifier.isDark
                                  ? IColors.background
                                  : IColors.title,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-----------------------------//
                    //---------forgot-password-------------------//
                    SizedBox(
                      height: height / 25,
                    ),
                    Text(
                      "already have an account?",
                      style: TextStyle(
                          color: IColors.placeholderText,
                          fontSize: 12,
                          fontFamily: GoogleFonts.mavenPro().fontFamily,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              //------------------------------------//
              //-------------Sign-Up-------------------//
              SizedBox(
                height: height / 30,
              ),
              GestureDetector(
                onTap: () async {
                  if (name.text.isEmpty ||
                      email.text.isEmpty ||
                      password.text.isEmpty ||
                      confirmPAssword.text.isEmpty ||
                      _imageFile == null) {
                    Fluttertoast.showToast(
                      msg: "All fields are required 🤖",
                      textColor: IColors.red,
                      backgroundColor: themeNotifier.isDark
                          ? IColors.background
                          : IColors.title,
                    );
                  } else {
                    // login(username.text, password.text);

                    await AuthServices().register(
                        context, name.text, email.text, password.text);
                    DatabaseServices()
                        .uploadImageToFirebase(context, _imageFile);
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 1.2,
                  child: Container(
                    height: height / 18,
                    width: width / 1.5,
                    decoration: BoxDecoration(
                        color: themeNotifier.isDark
                            ? IColors.background
                            : IColors.title,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: GoogleFonts.mavenPro().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: themeNotifier.isDark
                              ? IColors.title
                              : IColors.background,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //-----------------------------//
              //------------problem---------------//
              Padding(
                padding: EdgeInsets.only(top: height / 12, left: width / 3.2),
                child: Row(
                  children: [
                    Text(
                      "got a problem? ",
                      style: TextStyle(
                          color: IColors.placeholderText,
                          fontSize: 12,
                          fontFamily: GoogleFonts.mavenPro().fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "complaint us",
                      style: TextStyle(
                          color: themeNotifier.isDark
                              ? IColors.background
                              : IColors.title,
                          fontSize: 12,
                          fontFamily: GoogleFonts.mavenPro().fontFamily,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
