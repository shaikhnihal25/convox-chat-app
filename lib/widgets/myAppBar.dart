import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../screens/login.dart';
import '../utils/iColors.dart';
import '../utils/theme_model.dart';

class MyAppBar extends StatefulWidget {
  String title;
  List<Widget> action;
  MyAppBar({Key key, this.title, this.action}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Padding(
        padding: EdgeInsets.only(top: height / 30, left: width / 18),
        child: Row(children: [
          Text(
            widget.title,
            style: TextStyle(
                // fontFamily: GoogleFonts.mavenPro().fontFamily,
                color:
                    themeNotifier.isDark ? IColors.background : IColors.title,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
          //-----------------------//
          SizedBox(
            width: width / 1.750,
          ),
          //------------------------//
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                          padding: EdgeInsets.only(top: height / 1.250),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  themeNotifier.isDark
                                      ? themeNotifier.isDark = false
                                      : themeNotifier.isDark = true;
                                },
                                child: Container(
                                  height: height / 15,
                                  width: width / 1.1,
                                  decoration: BoxDecoration(
                                      color: IColors.yellow,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      "Change Theme",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: IColors.title,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  await auth.signOut();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              LoginScreen())));
                                },
                                child: Container(
                                  height: height / 15,
                                  width: width / 1.1,
                                  decoration: BoxDecoration(
                                      color: IColors.red,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      "Logout?",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: IColors.title,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ));
                    });
              },
              icon: Icon(
                Iconsax.setting,
                color:
                    themeNotifier.isDark ? IColors.background : IColors.title,
              ))
        ]),
      );
    });
  }
}
