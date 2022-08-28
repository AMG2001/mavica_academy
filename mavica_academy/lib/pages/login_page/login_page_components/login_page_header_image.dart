import 'package:flutter/material.dart';

class LoginPageHeaderImage extends StatelessWidget {
  const LoginPageHeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .28,
      child: Image(
        image: (AssetImage("assets/login/login_background.png")),
      ),
    );
  }
}
