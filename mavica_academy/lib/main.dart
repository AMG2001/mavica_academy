import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/config/application_configs/application_theme_shared_prefs.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_name.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme_cubit/application_theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/application_configs/theme/application_theme_cubit/application_theme_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MavicaAcademyApp());
  ApplicationThemeSharedPref.initializeDarkModeSharedPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MavicaAcademyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print("application in dark theme = $applicationInDark");
    /**
     * BlocProvider from ApplicationThemeCubit .. to stream on cahnge of theme 
     */
    return BlocProvider<ApplicationThemeCubit>(
      create: (context) => ApplicationThemeCubit(),
      child: BlocBuilder<ApplicationThemeCubit, ApplicationThemeState>(
        builder: (context, state) {
          return MaterialApp(
            /**
                       * check state of dark theme swith in settings page .. 
                       * if dark theme == true .. show dark theme
                       * else .. show light theme 
                       */
            theme: BlocProvider.of<ApplicationThemeCubit>(context).currentTheme,
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
        },
      ),
    );
  }
}
