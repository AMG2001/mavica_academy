import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_name.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mavica_academy/config/application_configs/theme_controller.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /**
   * Application Theme controller Obj
   */
  final ApplicationThemeController applicationThemeController =
      Get.put(ApplicationThemeController(), permanent: true);
  /**
       * get application stored theme
       */
  applicationThemeController.init();
  /**
   * Firebase launching await .
   */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /**
   * runApp method
   */
  runApp(MavicaAcademyApp());
}

class MavicaAcademyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print("application in dark theme = $applicationInDark");
    /**
     * BlocProvider from ApplicationThemeCubit .. to stream on cahnge of theme 
     */
    return GetBuilder<ApplicationThemeController>(builder: (controller) {
      return GetMaterialApp(
        /**
                       * check state of dark theme swith in settings page .. 
                       * if dark theme == true .. show dark theme
                       * else .. show light theme 
                       */
        theme: controller.currentTheme,
        /**
                           * applicaition routes .. routes are Stored in PagesNames Class 
                           */
        routes: PagesNames.pagesNamesMap,
        /**
                       * remove debug banner
                       */
        debugShowCheckedModeBanner: false,
        /**
                       * Application title
                       */
        title: 'Mavica Academy',
        /**
                       * initial Route
                       */
        initialRoute: ConstantPagesName.homePageScreenName,
      );
    });
  }
}
