import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_components/bottom_slider.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_components/page_view_section.dart';

class IntroductionScreen extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageViewSection(pageController: pageController),
          /**
           * Back Button
           */
          BottomSlider(pageController: pageController),
        ],
      ),
    );
  }
}
