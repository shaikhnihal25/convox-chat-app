import 'package:convox/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utils/iColors.dart';
import '../utils/theme_model.dart';

class AddChatField extends StatefulWidget {
  AddChatField({Key key}) : super(key: key);

  @override
  State<AddChatField> createState() => _AddChatFieldState();
}

class _AddChatFieldState extends State<AddChatField> {
  TextEditingController email = TextEditingController();
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
          child: Padding(
            padding: EdgeInsets.only(left: width / 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------Label-01------------//
                Padding(
                  padding: EdgeInsets.only(top: height / 4, left: width / 30),
                  child: Text(
                    "Enter Email To Add",
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
                        if (!email.text.contains("@")) {
                          Fluttertoast.showToast(msg: "Email is not valid");
                        }
                      },
                    ),
                  ),
                ),
                //-------------------//
                //-------------Submit-------------------//
                SizedBox(
                  height: height / 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (email.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Please enter email address");
                    } else if (!email.text.contains('@')) {
                      Fluttertoast.showToast(msg: "Please enter a valid email");
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomeScreen())));
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
                          "Submit",
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
