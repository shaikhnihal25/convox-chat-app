import 'package:convox/screens/home.dart';
import 'package:convox/screens/signup.dart';
import 'package:convox/services/auth_services.dart';
import 'package:convox/utils/iColors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utils/theme_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isValid = true;
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? IColors.title : IColors.background,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height / 10,
                ),
                child: Text(
                  "Convox",
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
                height: height / 10,
              ),
              //---------Form--------//
              Container(
                height: height / 2.2,
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
                      padding: EdgeInsets.only(
                          top: height / 30, right: width / 1.850),
                      child: Text(
                        "Email",
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
                            if (!email.text.contains("@") ||
                                email.text.length > 16) {
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
                          EdgeInsets.only(top: height / 30, right: width / 2.2),
                      child: Text(
                        "Password",
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
                    //----------Submit-Button-------------//
                    SizedBox(
                      height: height / 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (email.text.isEmpty || password.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "All fields are required 🤖",
                            textColor: IColors.red,
                            backgroundColor: themeNotifier.isDark
                                ? IColors.background
                                : IColors.title,
                          );
                        } else {
                          // login(username.text, password.text);
                          AuthServices()
                              .login(context, email.text, password.text);
                        }
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
                            "Login",
                            style: TextStyle(
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
                      "forgot password?",
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
                height: height / 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SignUpScreen())));
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
