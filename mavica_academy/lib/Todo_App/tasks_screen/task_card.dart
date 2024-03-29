import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/Todo_App/services/database.dart';
import 'package:mavica_academy/Todo_App/services/toast.dart';
import 'package:mavica_academy/Todo_App/tasks_screen/tasks_screen_controller.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';

class TaskCard extends StatelessWidget {
  final tasksScreenController = Get.put(TasksScreenController());
  String taskTitle;
  String taskDescription;
  String taskTime;
  int id;
  TaskCard(
      {required this.id,
      required this.taskTitle,
      required this.taskDescription,
      required this.taskTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: DefaultColors.defaultRed,
                      radius: 36,
                      child: Text(
                        taskTime,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskTitle,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          taskDescription,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),

                /**
                 * Buttons Row
                 */
                Row(
                  children: [
                    /**
                     * Delete Task Button
                     */
                    IconButton(
                      icon: Icon(
                        Icons.highlight_remove,
                        size: 28,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        await tasksScreenController.deleteTask(id: id);
                        CustomToast.showDeletedTaskToast(
                            "Task Deleted Successfully ✔");
                      },
                    ),
                    /**
                     * Task Done Button
                     */
                    IconButton(
                      icon: Icon(
                        Icons.done_all_outlined,
                        size: 28,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        await TodoDatabaseClass.changeStateToDone(id);
                      },
                    ),
                    /**
                     * Task Archieve button
                     */
                    IconButton(
                      icon: Icon(
                        Icons.archive_outlined,
                        size: 28,
                        color: DefaultColors.defaultRed,
                      ),
                      onPressed: () async {
                        // await tasksScreenController.deleteTask(id: id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
