import 'package:flutter/material.dart';
import 'package:mavica_academy/models/constants/pages_names.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen.dart';
import 'package:mavica_academy/pages/login_page/login_page.dart';
import 'package:mavica_academy/pages/splach_screen/splach_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MavicaAcademyApp());
}

class MavicaAcademyApp extends StatefulWidget {
  // late SharedPreferences prefs;
  @override
  State<MavicaAcademyApp> createState() => _MavicaAcademyAppState();
}

class _MavicaAcademyAppState extends State<MavicaAcademyApp> {
  // Obtain shared preferences.

  // @override
  // void initState() {
  //   createPrefObj();
  //   if (widget.prefs.getBool("showIntroductionScreen") == null) {
  //     widget.prefs.setBool("showIntroductionScreen", true);
  //   } else {
  //     widget.prefs.setBool("showIntroductionScreen", false);
  //   }
  // }

  // void createPrefObj() async {
  //   widget.prefs = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ConstantPagesName.splashScreenName: (context) => SplashScreen(),
        ConstantPagesName.loginScreenName: (context) => LoginScreen(),
        ConstantPagesName.introductionScreenName: (context) =>
            IntroductionScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Mavica Academy',
      initialRoute: ConstantPagesName.splashScreenName,
    );
  }
}
