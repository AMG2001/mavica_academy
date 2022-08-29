import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class UserNameTFController extends GetxController {
  Color labelColor = Colors.grey[350]!;

  void changeLabelColorToFocus() {
    labelColor = DefaultColors.defaultRed;
    update();
  }

  void changeLabelColorToLeave() {
     labelColor = Colors.grey[350]!;
     update();
  }
}
