import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreyShiftSlider extends StatelessWidget {
  const GreyShiftSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
      width: Get.width * .1,
      height: Get.height * .005,
    );
  }
}
