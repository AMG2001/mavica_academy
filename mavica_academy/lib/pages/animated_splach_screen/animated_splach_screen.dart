import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/first_launch.dart';
import 'package:mavica_academy/config/user_logs/user_logged_controller.dart';
import 'package:mavica_academy/pages/animated_splach_screen/animated_splach_screen_controller.dart';
import 'package:page_transition/page_transition.dart';

class AnimatedSplachPage extends StatelessWidget {
  const AnimatedSplachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("value from First launch Done = ${FirstLaunch.firstLaunchDone()}");
    return GetBuilder<AnimatedSplashScreenController>(
        init: AnimatedSplashScreenController(),
        builder: (controller) {
          return AnimatedSplashScreen(
            duration: 2000,
            splash: Image(
              image:
                  AssetImage('assets/application/spalsh_screen_background.png'),
              fit: BoxFit.cover,
              height: Get.height,
              width: Get.width,
            ),
            centered: true,
            splashIconSize: MediaQuery.of(context).size.height,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: const Duration(seconds: 1),
            nextScreen: controller.nextPage(FirstLaunch.firstLaunchDone(),
                UserLoggedController.userLoggedBool),
            pageTransitionType: PageTransitionType.fade,
          );
        });
  }
}
