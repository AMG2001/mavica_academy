import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Lottie.asset("assets/animated_vectors/under_construction.json"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                  "We are Working as fast as we can to provide you the best experience."),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "🔥 Stay Tuned !!🔥",
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ),
    );
  }
}
