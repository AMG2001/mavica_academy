import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mavica_academy/pages/courses_page/courses_page_components/course_card.dart';
class CoursesPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>(); // Create a key
  CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              CourseCard(),
              CourseCard(),
              CourseCard(),
              CourseCard(),
              CourseCard(),
            ],
          ),
        ),
      ),
    );
  }
}
