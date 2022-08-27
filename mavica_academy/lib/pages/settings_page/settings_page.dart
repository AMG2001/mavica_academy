import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/theme/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  final ApplicationThemeController themeController =
      Get.put(ApplicationThemeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GetBuilder<ApplicationThemeController>(
                  builder: ((controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          child: FaIcon(FontAwesomeIcons.moon),
                        ),
                        const Text("Dark Mode"),
                        Text(themeController.isDark == true ? "on" : "off"),
                        Switch(
                          value: controller.isDark,
                          onChanged: (value) async {
                            controller.changeApplicationTheme(value);
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
