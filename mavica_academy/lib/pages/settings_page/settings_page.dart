import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/config/application_configs/application_shared_prefs.dart';
import 'package:mavica_academy/config/application_configs/theme/application_theme_cubit/application_theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          BlocProvider<ApplicationThemeCubit>(
            create: (context) => ApplicationThemeCubit(),
            child: Row(
              children: [
                Text("Dark Mode"),
                StatefulBuilder(builder: (context, setState) {
                  return Switch(
                    value: _isDark,
                    onChanged: (val) {
                      /**
                       * after clicking on the switch .. change it's shape and also 
                       * change theme SharedPref value in application theme cubit
                       */
                      setState(() {
                        print("Switch $val");
                        BlocProvider.of<ApplicationThemeCubit>(context)
                            .setDarkModeValue(val);
                        _isDark = val;
                      });
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
