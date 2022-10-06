import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class Alerts{
  Future<void> showToast(String message)async{
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: DefaultColors.defaultRed,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}