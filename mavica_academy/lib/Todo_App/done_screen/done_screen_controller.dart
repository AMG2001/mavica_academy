
import 'package:get/get.dart';

class DoneScreenController extends GetxController {
  List<Map<String, dynamic>> doneTasks = [];

  // Future<void> insertNewTask({
  //   required TextEditingController taskTitleController,
  //   required TextEditingController taskDateController,
  //   required TextEditingController taskTimeController,
  // }) async {
  //   // TODO insert task into database
  //   await TodoDatabaseClass.insertIntoDatabase(
  //       title: taskTitleController.text,
  //       date: taskDateController.text,
  //       time: taskTimeController.text,
  //       status: "not finished");
  //   await refreshTasksList();
  //   update();
  // }

  // Future<void> refreshTasksList() async {
  //   tasks = await TodoDatabaseClass.showNotFinishedTasks();
  // }

  // Future<void> deleteTask({required int id}) async {
  //   await TodoDatabaseClass.deleteTaskFormDatabase(id);
  //   await refreshTasksList();
  //   update();
  // }
}
