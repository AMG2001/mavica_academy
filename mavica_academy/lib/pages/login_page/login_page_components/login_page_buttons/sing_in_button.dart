import 'package:flutter/material.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape:
            MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(28))),
        backgroundColor:
            MaterialStateProperty.all<Color>(
                DefaultColors.defaultRed),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
