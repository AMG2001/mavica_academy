import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedSplashScreen(
          centered: true,
          splash: Container(
            width: MediaQuery.of(context).size.width*.4,
            height: MediaQuery.of(context).size.height*.40,
            child: Image(
              image: AssetImage('assets/application/mavica_icon.png'),
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.white,
          nextScreen: IntroductionScreen(),
          splashTransition: SplashTransition.rotationTransition,
          animationDuration: Duration(seconds: 2),
          duration: 2000,
        ),
      ),
    );
  }
}
