import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/config/application_configs/application_shared_prefs.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_name.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme_cubit/application_theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MavicaAcademyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MavicaAcademyApp extends StatelessWidget {
  bool? applicationInDark;
  @override
  void initState() async {}

  @override
  Widget build(BuildContext context) {
    print("application in dark theme = $applicationInDark");
    /**
     * BlocProvider from ApplicationThemeCubit .. to stream on cahnge of theme 
     */
    return BlocProvider(
      create: (context) => ApplicationThemeCubit(),
      /**
       * bloc Builder to change with changing theme state in ApplicationThemeCubit
       */
      child: BlocBuilder<ApplicationThemeCubit, ApplicationThemeState>(
        builder: (context, state) {
          /**
           * Application MaterialApp Widget ->
           */
          return MaterialApp(
            /**
             * check state of dark theme swith in settings page .. 
             * if dark theme == true .. show dark theme
             * else .. show light theme 
             */
            theme: BlocProvider.of<ApplicationThemeCubit>(context)
                        .getDarkModeValue() ==
                    false
                ? ApplicationTheme.applicationLightMode
                : ApplicationTheme.applicationDarkMode,
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
