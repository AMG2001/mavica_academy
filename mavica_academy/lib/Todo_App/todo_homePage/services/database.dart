import 'package:sqflite/sqflite.dart';

class TodoDatabaseClass {
  static String _databasename = "todo.db";
  static late Database databaseObject;
  static String _tableName = "tasks";
  static List<Map<String, dynamic>> records = [];
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
              'INSERT INTO $_tableName(title, date, time,status) VALUES("$title", "$date","$time","$status")')
          .then((value) => print("Insert record Done successfully #"))
          .onError((error, stackTrace) => print(error));
    });
  }

/**
 * Show all records in database
 */
  static Future<List<Map<String, dynamic>>> showDatabaseRecordes() async {
    List<Map<String, dynamic>> data = await databaseObject
        .rawQuery("select * from $_tableName")
        .then((value) => records = value)
        .catchError((error, stackTrace) => print(error.toString()));
    return data;
  }

  static Future<void> deleteTaskFormDatabase(int id) async{
   await databaseObject
    .rawDelete('DELETE FROM $_tableName WHERE id = $id');
  }
}
