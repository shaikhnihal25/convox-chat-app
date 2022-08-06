import 'package:convox/utils/iColors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../utils/theme_model.dart';
import '../widgets/myAppBar.dart';

class StatusScreen extends StatefulWidget {
  StatusScreen({Key key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
        //       "Status",
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
          MyAppBar(title: "Status"),
          //-----------------------//
          Padding(
            padding: EdgeInsets.only(top: height / 3),
            child: Text(
              "No Status",
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
