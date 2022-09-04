import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
 String _bullet = "\u2022 ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              Row(
                children: [
                  Text(_bullet),
                  Text("")
                  
                ],
              )
            ],)
          ),
        ));
  }
}
