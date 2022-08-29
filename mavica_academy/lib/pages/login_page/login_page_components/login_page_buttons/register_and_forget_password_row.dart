import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class RegisterAndForgetPasswordRow extends StatelessWidget {
  const RegisterAndForgetPasswordRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                      color: DefaultColors.defaultRed)),
              shape:
                  MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          side: BorderSide(
                              color:
                                  DefaultColors.defaultRed),
                          borderRadius:
                              BorderRadius.circular(28))),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register    ",
                  style: TextStyle(
                      color: Colors.black, fontSize: 14),
                ),
                FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  color: DefaultColors.defaultRed,
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
