import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  AssetImage image;
  Page4({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/introduction_images/4_light.jpg"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.4), BlendMode.darken),
              fit: BoxFit.cover,
              alignment: Alignment.center)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "Behind every success , There's a dream, always chase your dreams and bring them to real world.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
