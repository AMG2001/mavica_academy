import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/introduction_screen/page1.dart';
import 'package:mavica_academy/pages/introduction_screen/page2.dart';
import 'package:mavica_academy/pages/introduction_screen/page3.dart';
import 'package:mavica_academy/pages/introduction_screen/page4.dart';
import 'package:mavica_academy/pages/introduction_screen/page5.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: PageView(
                controller: pageController,
                children: [Page1(), Page2(), Page3(), Page4(), Page5()]),
          ),
          /**
           * Back Button
           */
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          "back",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                      /**
                       * PageIndicator
                       */
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: SlideEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.white),
                      ),
                      /**
                   * Next Button
                   */
                      OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(color: Colors.white, width: 2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          "next",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
