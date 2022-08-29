import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/home_page/home_page.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen.dart';
import 'package:mavica_academy/pages/login_page/login_page.dart';

class AnimatedSplashScreenController extends GetxController {
  Widget nextPage(bool firstLaunchDone, bool logged) {
    if (firstLaunchDone == true && logged == true)
      return HomePage();
    else if (firstLaunchDone == true && logged == false)
      return LoginScreen();
    else
      return IntroductionScreen();
  }
}
