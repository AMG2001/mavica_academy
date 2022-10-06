import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/header_image.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_buttons/change_theme_button.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_buttons/exit_button.dart';

class LoginPageHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .28,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                /**
                 * Exit app Button .
                 */
                 ExitAppButton(),
                /**
                 * Change Application Theme.
                 */
                ChangeAppThemeButton(),
              ],
            ),
          ),
          HeaderImageLoginPage(),
        ],
      ),
    );
  }
}
