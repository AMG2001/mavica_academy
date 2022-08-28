import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_pages/page1.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_pages/page2.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_pages/page3.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_pages/page4.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_pages/page5.dart';

class PageViewSection extends StatelessWidget {
  PageController pageController = PageController();
  PageViewSection({required this.pageController});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageController,
          children: const [ Page1(), Page2(), Page3(), Page4(), Page5()]),
    );
  }
}
