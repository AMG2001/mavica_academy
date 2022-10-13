import 'package:get/get.dart';
import 'package:mavica_academy/pages/about_us/about_us_page.dart';
import 'package:mavica_academy/pages/account_page/account_page.dart';
import 'package:mavica_academy/pages/animated_splach_screen/animated_splach_screen.dart';
import 'package:mavica_academy/pages/courses_page/courses_page.dart';
import 'package:mavica_academy/pages/home_page/home_page.dart';
import 'package:mavica_academy/pages/introduction_screen/introduction_screen.dart';
import 'package:mavica_academy/pages/login_page/login_page.dart';
import 'package:mavica_academy/pages/notifications_page/notifications_page.dart';
import 'package:mavica_academy/pages/posts_page/posts_page.dart';
import 'package:mavica_academy/pages/settings_page/settings_page.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page.dart';

class PagesNames {
  static String introductionScreenName = "/IntroductionScreen";
  static String loginScreenName = "/LoginScreen";
  static String homePageScreenName = "/HomePageScreen";
  static String coursesPage = "/coursesPage";
  static String postsPage = "/postsPage";
  static String notificationsPage = "/notificationsPage";
  static String settingsPage = "/settingsPage";
  static String accountPage = "/accountPage";
  static String aboutUsPage = "/aboutUsPage";
  static String introductionPage = "/introductionPage";
  static String splachPage = "/splachPage";
  static String signUpPage = "/signUpPage";
  static String todoPage = "/todoPage";

  static List<GetPage> listOfPages = [
    GetPage(
        name: coursesPage,
        page: () => CoursesPage(),
        transition: Transition.leftToRight),
    GetPage(
        name: homePageScreenName,
        page: () => HomePage(),
        transition: Transition.leftToRight),
    GetPage(
        name: postsPage,
        page: () => PostsPage(),
        transition: Transition.leftToRight),
    GetPage(
        name: notificationsPage,
        page: () => NotificationsPage(),
        transition: Transition.leftToRight),
    GetPage(
        name: settingsPage,
        page: () => SettingsPage(),
        transition: Transition.leftToRight),
    GetPage(
        name: accountPage,
        page: () => AccountPage(),
        transition: Transition.leftToRight),
    GetPage(
        name: aboutUsPage,
        page: () => AboutUsPage(),
        transition: Transition.leftToRight),
    GetPage(
        name: loginScreenName,
        page: () => LoginScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: introductionScreenName,
        page: () => IntroductionScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: splachPage,
        page: () => AnimatedSplachPage(),
        transition: Transition.fade),
    GetPage(
        name: signUpPage,
        page: () => SignUpPage(),
        transition: Transition.leftToRight),
         GetPage(
        name: todoPage,
        page: () => CoursesPage(),
        transition: Transition.fade),
  ];
}
