import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../utils/iColors.dart';
import '../utils/theme_model.dart';
import '../widgets/myAppBar.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      return Scaffold(
        // appBar: AppBar(
        //     elevation: 0.0,
        //     backgroundColor:
        //         themeNotifier.isDark ? IColors.title : IColors.background,
        //     title: Text(
        //       "Profile",
        //       style: TextStyle(
        //           // fontFamily: GoogleFonts.mavenPro().fontFamily,
        //           color:
        //               themeNotifier.isDark ? IColors.background : IColors.title,
        //           fontSize: 34,
        //           fontWeight: FontWeight.bold),
        //     ),
        //     actions: [
        //       IconButton(
        //           onPressed: () {},
        //           icon: Icon(
        //             Icons.more_vert,
        //             color: themeNotifier.isDark
        //                 ? IColors.background
        //                 : IColors.title,
        //           ))
        //     ]),
        backgroundColor:
            themeNotifier.isDark ? IColors.title : IColors.background,
        body: Column(children: [
          //-------------------//
          MyAppBar(title: "Profile"),
          //-----------------------//
          Padding(
            padding: EdgeInsets.only(top: height / 3),
            child: Text(
              "No Calls",
              style: TextStyle(
                  color: IColors.placeholderText,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      );
    });
  }
}
