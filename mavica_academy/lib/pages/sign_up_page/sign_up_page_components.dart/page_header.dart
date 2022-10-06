import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.center,
            child: Lottie.asset(
                "assets/animated_vectors/sign_up_animation.json",
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .4)),
        /**
                         * Welcome message
                         */
        Align(
          alignment: Alignment.center,
          child: Text(
            "Welcome Between GoLearn Family",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        /**
                         * Sign up now message
                         */
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Text(
          "Sign up ",
          style: TextStyle(fontSize: 24, color: DefaultColors.defaultRed),
        ),

        /**
                             * Row of first and last name
                             */
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
      ],
    );
  }
}
