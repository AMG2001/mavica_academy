import 'package:flutter/material.dart';

class GreyShiftSlider extends StatelessWidget {
  const GreyShiftSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
      width: MediaQuery.of(context).size.width * .1,
      height: MediaQuery.of(context).size.height * .005,
    );
  }
}
