import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/Todo_App/archieved_screen/archived_screen.dart';
import 'package:mavica_academy/Todo_App/done_screen/done_screen.dart';
import 'package:mavica_academy/Todo_App/tasks_screen/tasks_screen.dart';
import 'package:mavica_academy/Todo_App/todo_homePage/home_page_controller.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';


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
        Get.put(HomePageController(context: context));

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
          try{
            homePageController.showBottomSheet();
          }catch(e){
            print(e);
          }
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      /**
       * ******************************* Bottom Navigation Bar **************************
       */
      bottomNavigationBar: BottomNavigationBar(
        elevation: 16.0,
        selectedItemColor: DefaultColors.defaultRed,
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

