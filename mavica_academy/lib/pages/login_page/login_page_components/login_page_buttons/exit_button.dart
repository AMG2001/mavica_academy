import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/theme/theme_controller.dart';

class ExitAppButton extends StatelessWidget {
  final themeController = Get.lazyPut<ApplicationThemeController>(
      () => ApplicationThemeController());
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isAndroid) {
          exit(0);
        }
      },
      icon: GetBuilder<ApplicationThemeController>(builder: (controller) {
        return RotatedBox(
          quarterTurns: 2,
          child: FaIcon(
            FontAwesomeIcons.arrowRightFromBracket,
            color: controller.isDark ? Colors.white : Colors.black,
          ),
        );
      }),
    );
  }
}
