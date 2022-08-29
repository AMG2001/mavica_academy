import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class PasswordTFController extends GetxController {
  Color pLabelColor = Colors.grey[350]!;

  void changeLabelColorToFocus() {
    pLabelColor = DefaultColors.defaultRed;
    update();
  }

  void changeLabelColorToLeave() {
     pLabelColor = Colors.grey[350]!;
     update();
  }
}
