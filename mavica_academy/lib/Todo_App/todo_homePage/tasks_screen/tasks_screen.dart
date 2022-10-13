import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/todo_homePage/todo_home_page_components/task_card.dart';
import 'package:todo_app/screens/todo_homePage/tasks_screen/tasks_screen_controller.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Data inside tasks : ");
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
                    ? Center(child: CircularProgressIndicator())
                    : TaskCard(
                      id: controller.tasks[index]["id"],
                        taskTitle: controller.tasks[index]["title"],
                        taskDescription: controller.tasks[index]["date"],
                        taskTime: controller.tasks[index]["time"]);
              }),
            ),
          );
        }
      ),
    );
  }
}

/*
ListTile(
        
          contentPadding: EdgeInsets.all(18),
          leading: CircleAvatar(
            radius: 30,
            child: Text(
              "02:00 AM",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          title: Text("Post title"),
          subtitle: Text("Post description"),
          trailing: 
        ),*/