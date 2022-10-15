import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/Todo_App/done_screen/done_screen_controller.dart';
import 'package:mavica_academy/Todo_App/tasks_screen/task_card.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DoneScreenController>(
          init: DoneScreenController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: controller.doneTasks.length,
                itemBuilder: ((context, index) {
                  return controller.doneTasks.length == 0
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.blue,
                        ))
                      : TaskCard(
                          id: controller.doneTasks[index]["id"],
                          taskTitle: controller.doneTasks[index]["title"],
                          taskDescription: controller.doneTasks[index]["date"],
                          taskTime: controller.doneTasks[index]["time"]);
                }),
              ),
            );
          }),
    );
  }
}
