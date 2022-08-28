import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/introduction_images/5_light.jpg"),
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
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "\" Together we can success 🎓 .. show us your story Champ \"",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(),
          Text(
            "GoLearn is one of Mavica Tech's products",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text(
            "All Copyrights Recieved .",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .12,
          )
        ],
      ),
    );
  }
}
