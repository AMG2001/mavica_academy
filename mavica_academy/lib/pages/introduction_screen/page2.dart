import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/introduction_images/2.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          Text(
            "Welcome in GoLearn",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300),
          ),
          Spacer(),
         
        ],
      ),
    );
  
  }
}