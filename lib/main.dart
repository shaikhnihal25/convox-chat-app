import 'package:convox/screens/calls.dart';
import 'package:convox/screens/chat.dart';
import 'package:convox/screens/home.dart';
import 'package:convox/screens/login.dart';
import 'package:convox/screens/profile.dart';
import 'package:convox/screens/signup.dart';
import 'package:convox/screens/splash.dart';
import 'package:convox/screens/status.dart';
import 'package:convox/utils/router.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/theme_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: "6LdOBTchAAAAACvFk2t1qXlcEOfva9LZ07XDbsxv");

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
      ? false
      : prefs.getBool('isLoggedIn');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
            FirebaseAuth auth = FirebaseAuth.instance;

            return MaterialApp(
                title: 'Flutter Demo',
                theme:
                    themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
                debugShowCheckedModeBanner: false,
                home: SplashScreen());
          },
        ));
  }
}
