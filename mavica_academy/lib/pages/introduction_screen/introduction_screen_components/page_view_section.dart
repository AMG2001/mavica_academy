import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_controller.dart';
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
    return GetBuilder<IntroductionScreenController>(
        init: IntroductionScreenController(),
        builder: (controller) {
          return Container(
            child: PageView(
                onPageChanged: (value) {
                  if (value > controller.index) {
                    print("page value = ${value}");
                    print("index before increase ${controller.index}");
                    controller.increaseIndex();
                    print("index after increase ${controller.index}");
                  } else {
                    print("page value = ${value}");
                    print("index before decrease ${controller.index}");
                    controller.decreaseIndex();
                    print("index after decrease ${controller.index}");
                  }
                },
                controller: pageController,
                children: const [Page1(), Page2(), Page3(), Page4(), Page5()]),
          );
        });
  }
}
