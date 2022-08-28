import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/first_launch.dart';
import 'package:mavica_academy/pages/animated_splach_screen/animated_splach_screen_controller.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen.dart';
import 'package:mavica_academy/pages/login_page/login_page.dart';
import 'package:page_transition/page_transition.dart';

class AnimatedSplachPage extends StatelessWidget {
  const AnimatedSplachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("value from First launch = ${FirstLaunch.firstLaunchDone()}");
    return GetBuilder<AnimatedSplashScreenController>(
        init: AnimatedSplashScreenController(),
        builder: (context) {
          return AnimatedSplashScreen(
            splash: 'assets/application/mavica_icon.png',
            animationDuration: const Duration(seconds: 1),
            splashIconSize: 350,
            nextScreen: FirstLaunch.firstLaunchDone()
                ? const LoginScreen()
                : IntroductionScreen(),
            pageTransitionType: PageTransitionType.leftToRight,
          );
        });
  }
}
