import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/Todo_App/tasks_screen/tasks_screen_controller.dart';
import 'package:mavica_academy/Todo_App/tasks_screen/task_card.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<TasksScreenController>(
          init: TasksScreenController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: ((context, index) {
                  return controller.tasks.length == 0
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.blue,
                        ))
                      : TaskCard(
                          id: controller.tasks[index]["id"],
                          taskTitle: controller.tasks[index]["title"],
                          taskDescription: controller.tasks[index]["date"],
                          taskTime: controller.tasks[index]["time"]);
                }),
              ),
            );
          }),
    );
  }
}
