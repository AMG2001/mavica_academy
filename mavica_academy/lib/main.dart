import 'package:flutter/material.dart';
import 'package:mavica_academy/models/constants/pages_names.dart';
import 'package:mavica_academy/pages/about_us/about_us_page.dart';
import 'package:mavica_academy/pages/account_page/account_page.dart';
import 'package:mavica_academy/pages/courses_page/courses_page.dart';
import 'package:mavica_academy/pages/home_page/home_page.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen.dart';
import 'package:mavica_academy/pages/login_page/login_page.dart';
import 'package:mavica_academy/pages/notifications_page/notifications_page.dart';
import 'package:mavica_academy/pages/posts_page/posts_page.dart';
import 'package:mavica_academy/pages/settings_page/settings_page.dart';


void main() {
  /**
   * For Firebase
   */

  /**
   * Run App Method ->
   */
  runApp(MavicaAcademyApp());
}

class MavicaAcademyApp extends StatefulWidget {
  @override
  State<MavicaAcademyApp> createState() => _MavicaAcademyAppState();
}

class _MavicaAcademyAppState extends State<MavicaAcademyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ConstantPagesName.homePageScreenName: (context) => HomePage(),
        ConstantPagesName.coursesPage: (context) => CoursesPage(),
        ConstantPagesName.postsPage: (context) => PostsPage(),
        ConstantPagesName.notificationsPage: (context) => NotificationsPage(),
        ConstantPagesName.settingsPage: (context) => SettingsPage(),
        ConstantPagesName.accountPage: (context) => AccountPage(),
        ConstantPagesName.aboutUsPage: (context) => AboutUsPage(),
        ConstantPagesName.loginScreenName: (context) => LoginScreen(),
        ConstantPagesName.introductionScreenName: (context) =>
            IntroductionScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Mavica Academy',
      initialRoute: ConstantPagesName.homePageScreenName,
    );
  }
}
