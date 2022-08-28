import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  int index = 1;
  String nextButtonName = "next";
  void increaseIndex() {
    index != 5 ? index++ : 5;
    if (index == 5) {
      nextButtonName = "start";
      update();
    }
    print("index is ${index}");
  }

  void decreaseIndex() {
    index != 1 ? index -= 1 : 1;
    print("index is ${index}");
    nextButtonName = "next";
    update();
  }
}
