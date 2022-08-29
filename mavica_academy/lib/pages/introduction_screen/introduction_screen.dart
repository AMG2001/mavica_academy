import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_components/bottom_slider.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen_components/page_view_section.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final pageController = PageController();

  late AssetImage image1;
  late AssetImage image2;
  late AssetImage image3;
  late AssetImage image4;
  late AssetImage image5;
  @override
  void initState() {
    super.initState();
    image1 = const AssetImage('assets/introduction_images/1_light.jpg');
    image2 = const AssetImage('assets/introduction_images/2_light.jpg');
    image3 = const AssetImage('assets/introduction_images/3_light.jpg');
    image4 = const AssetImage('assets/introduction_images/4_light.jpg');
    image5 = const AssetImage('assets/introduction_images/5_light.jpg');
    print("Images preloaded !!");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1, context);
    precacheImage(image2, context);
    precacheImage(image3, context);
    precacheImage(image4, context);
    precacheImage(image5, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageViewSection(
            pageController: pageController,
            images: [image1, image2, image3, image4, image5],
          ),
          /**
           * Back Button
           */
          BottomSlider(pageController: pageController),
        ],
      ),
    );
  }
}
