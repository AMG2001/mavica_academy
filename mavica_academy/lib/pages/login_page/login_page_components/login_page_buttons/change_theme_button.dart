import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/theme/theme_controller.dart';

class ChangeAppThemeButton extends StatelessWidget {
  final themeController = Get.lazyPut<ApplicationThemeController>(
      () => ApplicationThemeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(builder: (controller) {
      if (controller.isDark == true) {
        /**
         * Icon in dark mode 
         */
        return IconButton(
          onPressed: () async {
            await controller.changeApplicationTheme(!controller.isDark);
          },
          icon: FaIcon(FontAwesomeIcons.sun,color: Colors.white,),
        );
      } else {
        /**
         * icon in light mode .
         */
        return IconButton(
          onPressed: () async {
            await controller.changeApplicationTheme(!controller.isDark);
          },
          icon: FaIcon(FontAwesomeIcons.moon,color: Colors.black,),
        );
      }
    });
  }
}
