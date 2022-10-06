import 'package:flutter/material.dart';

class HeaderImageLoginPage extends StatelessWidget {
  const HeaderImageLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Image(
        image: (AssetImage("assets/login/login_background.png")),
      ),
    );
  }
}

