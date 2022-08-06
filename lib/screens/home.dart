// ignore_for_file: prefer_const_constructors

import 'package:convox/screens/calls.dart';
import 'package:convox/screens/profile.dart';
import 'package:convox/screens/status.dart';
import 'package:convox/services/streamService/stream_services.dart';
import 'package:convox/utils/iColors.dart';
import 'package:convox/utils/theme_model.dart';
import 'package:convox/widgets/chatList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:bottom_bar/bottom_bar.dart';

import '../services/server/server_config.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  var _currentIndex = 0;
  List<BottomBarItem> items = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page.round() != _currentIndex) {
        setState(() {
          _currentIndex = controller.page.round();
        });
      }
    });
    StreamServices().initialize();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: IColors.background,
        body: PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ChatList(),
              CallListScreen(),
              StatusScreen(),
              ProfileScreen()
            ]),
        bottomNavigationBar: BottomBar(
            backgroundColor:
                themeNotifier.isDark ? IColors.title : IColors.background,
            selectedIndex: _currentIndex,
            onTap: (page) {
              if (page != _currentIndex) {
                setState(() {
                  _currentIndex = page;
                  controller.animateToPage(page,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic);
                });
              }
            },
            items: [
              BottomBarItem(
                icon: Icon(Iconsax.home_1),
                title: Text('Home'),
                activeColor: themeNotifier.isDark
                    ? IColors.placeholderText
                    : Colors.grey.shade600,
              ),
              BottomBarItem(
                icon: Icon(Iconsax.call),
                title: Text('Calls'),
                activeColor: themeNotifier.isDark
                    ? IColors.placeholderText
                    : Colors.grey.shade600,
              ),
              BottomBarItem(
                icon: Icon(Iconsax.status),
                title: Text('Messages'),
                activeColor: themeNotifier.isDark
                    ? IColors.placeholderText
                    : Colors.grey.shade600,
              ),
              BottomBarItem(
                icon: Icon(Iconsax.user),
                title: Text('Profile'),
                activeColor: themeNotifier.isDark
                    ? IColors.placeholderText
                    : Colors.grey.shade600,
              ),
            ]),

        //------------------------------------------//
        // bottomNavigationBar: Container(
        //   padding: const EdgeInsets.only(bottom: 30, right: 32, left: 32),
        //   child: BottomBarFloating(
        //     items: items,
        //     backgroundColor: Colors.green,
        //     color: Colors.white,
        //     colorSelected: Colors.orange,
        //     indexSelected: _currentIndex,
        //     paddingVertical: 24,
        //     onTap: (page) {
        //       if (page != _currentIndex) {
        //         setState(() {
        //           _currentIndex = page;
        //           controller.animateToPage(page,
        //               duration: Duration(milliseconds: 500),
        //               curve: Curves.easeInOutCubic);
        //         });
        //       }
        //     },
        //   ),
        // ),
      );
    });
  }
}
