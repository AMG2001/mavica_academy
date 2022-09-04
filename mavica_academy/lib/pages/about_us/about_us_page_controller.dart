import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/about_us/founder_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class aboutUsPageController extends GetxController {
  static late SharedPreferences _firstTimeOpened;
  static String _bullet = "\u2022 ";
  static late Widget currentUI;

  static Future<void> init() async {
    _firstTimeOpened = await SharedPreferences.getInstance();
    if (_firstTimeOpened.getBool("firstTimeOpened") == null) {
      await _firstTimeOpened.setBool('firstTimeOpened', true);
      currentUI = Center(
        child: AnimatedTextKit(
          onFinished: firstTimeDone,
          isRepeatingAnimation: false,
          repeatForever: false,
          animatedTexts: [
            FadeAnimatedText(
              'Behind Every',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            FadeAnimatedText(
              'Success',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            FadeAnimatedText(
              'There is Champoins',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            FadeAnimatedText(
              'Thanks for your Efforts ',
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
      print('initialized successfully !!');
    } else {
      currentUI = ListView(
        children: [Text("${_bullet} Our Champions"), FounderCard()],
      );
    }
  }

  static Future<void> firstTimeDone() async {
    if (_firstTimeOpened.getBool('firstTimeOpened') == true)
      await _firstTimeOpened.setBool('firstTimeOpened', false);
  }
}
