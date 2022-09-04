import 'package:flutter/material.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class ApplicationTheme {
  /**
   ####################### Application dark theme property ##############################
   */
  static ThemeData applicationDarkTheme = ThemeData(
    primaryColor: DefaultColors.defaultRed,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 24),
      headline1: TextStyle(color: Colors.white, fontSize: 32),
      headline2: TextStyle(color: Colors.white, fontSize: 28),
      bodyText2: TextStyle(color: Colors.white, fontSize: 16),
      subtitle1: TextStyle(color: Colors.white, fontSize: 8),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: DefaultColors.defaultRed,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  /**
   * ############################# Application light theme property ###########################
   */
  static ThemeData applicationLightTheme = ThemeData.light().copyWith(
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: DefaultColors.defaultRed,
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: AppBarTheme(backgroundColor: DefaultColors.defaultRed),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */
      primaryTextTheme: const TextTheme(
        button: TextStyle(color: Colors.black, fontSize: 18),
        headline1: TextStyle(color: Colors.black, fontSize: 72),
        headline2: TextStyle(color: Colors.black, fontSize: 56),
        headline3: TextStyle(color: Colors.black, fontSize: 48),
        headline4: TextStyle(color: Colors.black, fontSize: 32),
        headline5: TextStyle(color: Colors.black, fontSize: 24),
        headline6: TextStyle(color: Colors.black, fontSize: 16),
        bodyText2: TextStyle(color: Colors.black, fontSize: 16),
        subtitle1: TextStyle(color: Colors.black, fontSize: 8),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: ButtonThemeData(
        buttonColor: DefaultColors.defaultRed,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: DefaultColors.defaultRed,
          side: BorderSide(color: DefaultColors.defaultRed, width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: DefaultColors.defaultRed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: DefaultColors.defaultRed,
        foregroundColor: Colors.white,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: DefaultColors.defaultRed,
        focusedBorder: OutlineInputBorder(
          
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: DefaultColors.defaultRed)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: DefaultColors.defaultRed),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: DefaultColors.defaultRed),
          /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: IconThemeData(color: DefaultColors.defaultRed));
}
