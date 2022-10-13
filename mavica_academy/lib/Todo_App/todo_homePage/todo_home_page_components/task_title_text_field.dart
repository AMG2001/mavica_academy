import 'package:flutter/material.dart';

class TaskTitleTextField extends StatelessWidget {
  double width;
  TextEditingController controller;
  String title;
  Icon prefixIcon;
  TaskTitleTextField(
      {required this.controller,
      required this.width,
      required this.prefixIcon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16),
      child: TextFormField(
        validator: (value) {
          if (value == null || value == "") {
            return "You can't leave this field empty !!";
          }
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
