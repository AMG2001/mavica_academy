import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/introduction_images/5.jpg"),
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
              "\" Together we can success 🎓 .. show us your story Champ \"",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
