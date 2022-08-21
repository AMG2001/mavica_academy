import 'package:flutter/material.dart';
import 'package:mavica_academy/models/constants/constant_colors.dart';

class ApplicationTheme {
  static ThemeData applicationDarkTheme = ThemeData(
    primaryColor: ConstantColors.primaryColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.black38),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 24),
      headline1: TextStyle(color: Colors.black, fontSize: 32),
      headline2: TextStyle(color: Colors.black, fontSize: 28),
      bodyText2: TextStyle(color: Colors.black, fontSize: 16),
      subtitle1: TextStyle(color: Colors.black, fontSize: 8),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ConstantColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static ThemeData applicationLightTheme = ThemeData(
    primaryColor: ConstantColors.primaryColor,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 24),
      headline1: TextStyle(color: Colors.white, fontSize: 32),
      headline2: TextStyle(color: Colors.white, fontSize: 28),
      bodyText2: TextStyle(color: Colors.white, fontSize: 16),
      subtitle1: TextStyle(color: Colors.white, fontSize: 8),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ConstantColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
