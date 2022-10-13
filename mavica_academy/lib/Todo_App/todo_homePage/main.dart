import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_app/services/database.dart';

void main() async {
  final tasksScreenController = Get.put(TasksScreenController());
    await TodoDatabaseClass.createDatabase();
  tasksScreenController.tasks = await TodoDatabaseClass.showDatabaseRecordes();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Todo App", debugShowCheckedModeBanner: false, home: TodoHomePage());
  }
}
