import 'package:flutter/material.dart';

class TimePickerTextField extends StatelessWidget {
  TextEditingController taskTimeController;
  double textFieldWidth;
  String labelText;
  Icon icon;
  TimePickerTextField(
      {required this.taskTimeController,
      required this.textFieldWidth,
      required this.labelText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      /**
     * width of TextField
     */
      width: textFieldWidth,
      /***
     * padding for inner space
     */
      padding: EdgeInsets.all(16),
      /**
     * *************************** Text Field ********************************
     */
      child: TextFormField(
        validator: (value) {
          if (value == null || value == "") {
            return "You can't leave this field empty !!";
          }
        },
        /**
       * onTap () -> to open TimePicker
       */
        onTap: () async {
          var time = await showTimePicker(
              context: context, initialTime: TimeOfDay.now());
          /**
             * Assign timeController with value that choosen from TimePicker
             */
          taskTimeController.text = time!.format(context);
        },
        controller: taskTimeController,
        /**
       * Decoration of Text Field
       */
        decoration: InputDecoration(
          /**
           * ************************** Label Text ***************************
           */
          labelText: labelText,
          /**
           * *************************** Text Field Icon ************************
           */
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
