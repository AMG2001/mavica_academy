import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/Todo_App/services/database.dart';
import 'package:mavica_academy/Todo_App/services/toast.dart';

class TasksScreenController extends GetxController {
  List<Map<String, dynamic>> tasks = [];

  Future<void> insertNewTask({
    required TextEditingController taskTitleController,
    required TextEditingController taskDateController,
    required TextEditingController taskTimeController,
  }) async {
    // TODO insert task into database
    await TodoDatabaseClass.insertIntoDatabase(
        title: taskTitleController.text,
        date: taskDateController.text,
        time: taskTimeController.text,
        status: TodoDatabaseClass.notFinishedState);
    await refreshTasksList();
    update();
  }

  Future<void> refreshTasksList() async {
    tasks = await TodoDatabaseClass.showNotFinishedTasks();
  }

  Future<void> changedToDoneState({required int id}) async {
    await TodoDatabaseClass.changeStateToDone(id);
    await refreshTasksList();
    update();
    CustomToast.showToast("Task marked done successfully ✔");
  }

  Future<void> deleteTask({required int id}) async {
    await TodoDatabaseClass.deleteTaskFormDatabase(id);
    await refreshTasksList();
    update();
  }
}
