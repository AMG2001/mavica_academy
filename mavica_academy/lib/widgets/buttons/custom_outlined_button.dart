import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class CustomOutlinedButton extends StatelessWidget {
  Function() buttonFunction;
  String buttonText;
  IconData? buttonIcon;
  CustomOutlinedButton(this.buttonText, this.buttonFunction, [this.buttonIcon]);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: buttonFunction,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonText,
              style: TextStyle(color: DefaultColors.defaultRed),
            ),
            SizedBox(
              width: 10,
            ),
            buttonIcon == null
                ? Text("")
                : FaIcon(
                    buttonIcon,
                    size: 14,
                    color: DefaultColors.defaultRed,
                  )
          ],
        ));
  }
}
