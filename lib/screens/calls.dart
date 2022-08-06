import 'package:convox/widgets/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../utils/iColors.dart';
import '../utils/theme_model.dart';

class CallListScreen extends StatefulWidget {
  CallListScreen({Key key}) : super(key: key);

  @override
  State<CallListScreen> createState() => _CallListScreenState();
}

class _CallListScreenState extends State<CallListScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? IColors.title : IColors.background,
        // appBar: AppBar(
        //     elevation: 0.0,
        //     backgroundColor:
        //         themeNotifier.isDark ? IColors.title : IColors.background,
        //     title: Text(
        //       "Calls",
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
        body: Column(children: [
          //-------------------//
          MyAppBar(title: "Calls"),
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
        floatingActionButton: InkWell(
          onTap: () {
            Fluttertoast.showToast(msg: "Tapped");
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: IColors.blue,
            child: Icon(
              Iconsax.call5,
              color: IColors.background,
            ),
          ),
        ),
      );
    });
  }
}
