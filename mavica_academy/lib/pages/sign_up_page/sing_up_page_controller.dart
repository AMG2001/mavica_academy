import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class SignUpPageController extends GetxController {
  SignUpPageController() {
    eyeIcon = FaIcon(
      FontAwesomeIcons.eyeSlash,
      color: eyeIconColor,
    );
  }
  bool securePassword = true;
  FaIcon eyeIcon = FaIcon(FontAwesomeIcons.eyeSlash);
  Color eyeIconColor = Colors.grey;
  void changeShowPasswordValue() {
    securePassword = !securePassword;
    if (securePassword == true) {
      eyeIconColor = Colors.grey;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eyeSlash,
        color: eyeIconColor,
      );
    } else {
      eyeIconColor = DefaultColors.defaultRed;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eye,
        color: eyeIconColor,
      );
    }

    update();
  }
}
