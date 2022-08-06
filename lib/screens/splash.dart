import 'dart:async';

import 'package:convox/screens/home.dart';
import 'package:convox/services/server/server_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/iColors.dart';
import '../utils/theme_model.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateTO();
  }

  void navigateTO() {
    Timer(
        Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor:
            themeNotifier.isDark ? Colors.black : IColors.background,
        body: Center(
          child: themeNotifier.isDark
              ? Image.asset('images/Animated-Splash-Dark.gif')
              : Image.asset('images/Animated-Splash-Light.gif'),
        ),
      );
    });
  }
}
