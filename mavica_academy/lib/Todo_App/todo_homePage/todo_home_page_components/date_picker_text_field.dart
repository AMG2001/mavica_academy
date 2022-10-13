import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerTextField extends StatelessWidget {
  TextEditingController taskDateController;
  String labelText;
  double textFieldWidth;
  Icon prefixIcon;
  DatePickerTextField(
      {required this.taskDateController,
      required this.labelText,
      required this.prefixIcon,
      required this.textFieldWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: textFieldWidth,
      padding: EdgeInsets.all(16),
      child: TextFormField(
        /**
         *  Validator
         */
        validator: (value) {
          if (value == null || value == "") {
            return "You can't leave this field empty !!";
          }
        },
        /**
         * On tap 
         */
        onTap: () async {
          DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100));
          /**
               * ********************** Assign controller to getted value from Date Picker .
               */
          taskDateController.text = DateFormat.yMMMMd('en_US').format(date!);
        },
        /**
         * ******************************* Controller *************************
         */
        controller: taskDateController,
        /**
         * ****************************** Decoration *************************
         */
        decoration: InputDecoration(
          /**
           * ***************************** Label Text ***************************
           */
          labelText: labelText,
          /**
           * ***************************** Prefix Icon **************************
           */
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
