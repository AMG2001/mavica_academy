import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/first_launch.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_name.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mavica_academy/config/application_configs/theme/theme_controller.dart';
import 'package:mavica_academy/config/user_logs/user_info.dart';
import 'package:mavica_academy/config/user_logs/user_logged_controller.dart';

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
  await applicationThemeController.init();
  /**
   * Check if it first time launch .. show intro screen
   * else  .. see if login or not .. 
   * login go to main page.
   * else go to login or sign up page .
   */
  await FirstLaunch.init();
/**
 * User Logged Shared Pref .. if user Logged in :
 * move Directly to home page , 
 * else .. move to login page.
 */
  await UserLoggedController.init();
/**
 * Obj that will store Username , email and photo Url
 */
  await UserInfo.init();
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
        initialRoute: ConstantPagesName.splachPage,
      );
    });
  }
}
