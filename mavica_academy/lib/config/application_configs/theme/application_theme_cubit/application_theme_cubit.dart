import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme_cubit/application_theme_state.dart';

class ApplicationThemeCubit extends Cubit<ApplicationThemeState> {
  /**
   * class Constructor
   */
  ApplicationThemeCubit() : super(ApplicationThemeCubitInitialState()) {
    currentTheme = ApplicationTheme.applicationLightTheme;
  }

  ThemeData? currentTheme;

  void changeApplicationTheme(bool isDark) {
    if (isDark == true) {
      currentTheme = ApplicationTheme.applicationDarkTheme;
      print("App Changed to Dark Mode");
      emit(ApplicationDarkThemeState());
    } else {
      currentTheme = ApplicationTheme.applicationLightTheme;
      print("App Changed to Light Mode");
      emit(ApplicationLightThemeState());
    }
  }
}
