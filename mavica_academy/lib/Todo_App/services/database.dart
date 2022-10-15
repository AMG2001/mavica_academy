import 'package:get/get.dart';
import 'package:mavica_academy/Todo_App/done_screen/done_screen_controller.dart';
import 'package:mavica_academy/Todo_App/tasks_screen/tasks_screen_controller.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabaseClass {
  static String _databasename = "todo.db";
  static late Database databaseObject;
  static String _tableName = "tasks";
  static String notFinishedState = "notFinished";
  static String doneState = "done";
  static String archievedState = "archived";
  static List<Map<String, dynamic>> notFinishedTasks = [];
  static List<Map<String, dynamic>> doneTasks = [];
  static List<Map<String, dynamic>> archievedTasks = [];

  static final doneScreenController =
      Get.put(DoneScreenController(), permanent: true);
  static final tasksScreenController =
      Get.put(TasksScreenController(), permanent: true);
  // final archievedScreenController = Get.put(());

  /**
   * create and open database
   */
  static Future<void> createDatabase() async {
    /**
     * 
     */
    (await openDatabase(
      _databasename,
      /**
     * it's our first time to create DB without any editings so we will give it version : 1
     */
      version: 1,
      /**
         * onCreate() -> method called first time only .
         */
      onCreate: ((db, version) async {
        print("database created #");
        /**
           * create table , and because we create it only 1 time , so we added it in onCreate() .
           */
        await db
            .execute(
                "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY , title TEXT ,date TEXT,time TEXT , status TEXT)")
            .then((value) => print("table Created Successfully # "))
            .onError((error, stackTrace) => print(error));
      }),
      onOpen: (db) async {},
    ).then((value) => databaseObject = value));
  }

/**
 *  insert into database
 */
  static Future<void> insertIntoDatabase(
      {required String title,
      required String date,
      required String time,
      required String status}) async {
    // Insert some records in a transaction
    await databaseObject.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO $_tableName(title, date, time,status) VALUES("$title", "$date","$time","$notFinishedState")')
          .then((value) => print("Insert record Done successfully #"))
          .onError((error, stackTrace) => print(error));
    });
  }

/**
 * Get all not finished Tasks and show in tasks page
 */
  static Future<List<Map<String, dynamic>>> showNotFinishedTasks() async {
    List<Map<String, dynamic>> data = await databaseObject
        .rawQuery(
            "select * from $_tableName WHERE status = '$notFinishedState' order by id")
        .then((value) => tasksScreenController.tasks = value)
        .catchError((error, stackTrace) => print(error.toString()));
    return data;
  }

/**
 * get all done tasks and show them in done screen
 */
  static Future<List<Map<String, dynamic>>> showDoneTasks() async {
    List<Map<String, dynamic>> data = await databaseObject
        .rawQuery(
            "SELECT * FROM $_tableName WHERE status = '$doneState' ORDER BY id")
        .then((value) => doneScreenController.doneTasks = value)
        .catchError((error, stackTrace) => print(error.toString()));
    return data;
  }

/**
 * get all archieved tasks and show them in archieve screen
 */
  static Future<List<Map<String, dynamic>>> showArchievedTasks() async {
    List<Map<String, dynamic>> data = await databaseObject
        .rawQuery(
            "SELECT * FROM $_tableName WHERE status = '$archievedState' ORDER BY id")
        .then((value) => archievedTasks = value)
        .catchError((error, stackTrace) => print(error.toString()));
    return data;
  }

  static Future<void> changeStateToDone(int id) async {
    await databaseObject
        .rawUpdate(
            "UPDATE $_tableName SET status = '$doneState' where id = $id")
        .then((value) => print("Changed from not finished to Done ✔"));
  }

/**
 * Delete Task from Database
 */
  static Future<void> deleteTaskFormDatabase(int id) async {
    await databaseObject.rawDelete('DELETE FROM $_tableName WHERE id = $id');
  }
}
