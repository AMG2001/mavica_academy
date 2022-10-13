import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_app/screens/archived_screen.dart';
import 'package:todo_app/screens/done_screen.dart';

import 'package:todo_app/screens/todo_homePage/todo_home_page_components/home_page_controller.dart';

import 'package:todo_app/screens/todo_homePage/tasks_screen/tasks_screen.dart';
import 'package:todo_app/services/database.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePage();
}

class _TodoHomePage extends State<TodoHomePage> {
  List<Widget> _screens = [TasksScreen(), DoneScreen(), ArchivedScreen()];
  List<String> _screenTitle = ["New Tasks", "Done Tasks", "Archived Tasks"];
  int _currentIndex = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final homePageController =
        Get.put(HomePageController(context: context), permanent: true);

    return Scaffold(
      /**
       * ************************************ Body **************************************
       */
      body: _screens[_currentIndex],
      /**
       * ********************************** AppBar **************************************
       */
      appBar: AppBar(
        title: Text(_screenTitle[_currentIndex]),
      ),
      /**
       * ********************************** FAB ****************************************
       */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homePageController.showBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
      /**
       * ******************************* Bottom Navigation Bar **************************
       */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_outlined), label: "Done"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: "Archived"),
        ],
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
    );
  }
}

/**
 *   await DatabaseClass.insertIntoDatabase(
              title: "First task",
              date:  DateFormat.yMMMMd('en_US').format(DateTime.now()),
              time: DateFormat.jm().format(DateTime.now()),
              status: "Not finished");
          await DatabaseClass.showDatabase();
 */
