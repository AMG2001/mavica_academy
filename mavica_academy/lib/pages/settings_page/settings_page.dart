import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/config/application_configs/application_theme_shared_prefs.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme_cubit/application_theme_cubit.dart';

import '../../config/application_configs/theme/application_theme_cubit/application_theme_state.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: BlocProvider<ApplicationThemeCubit>(
          create: (context) => ApplicationThemeCubit(),
          child: BlocBuilder<ApplicationThemeCubit, ApplicationThemeState>(
            builder: (context, state) {
              return SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dark Mode"),
                          Switch(
                            /**
                             * Get it's value from ApplicationThemeSharedPrefs class 
                             */
                            value:
                                ApplicationThemeSharedPref.getDarkModeValue(),
                            onChanged: (val) async {
                              await ApplicationThemeSharedPref.saveDarkModeValue(val).then((value) => print("Setting Theme Value Done !!"));
                              setState(() {
                                _isDark = val;
                                BlocProvider.of<ApplicationThemeCubit>(context)
                                    .changeApplicationTheme(val);
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
