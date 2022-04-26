import 'package:sqflite/sqflite.dart';
import '../model/task.dart';

class DbHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print('creating a new one');
        return db.execute(
          'CREATE TABLE $_tableName('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title STRING, date STRING, startTime STRING, endTime STRING, repeat STRING, '
          'note TEXT, remind INTEGER, color INTEGER, isCompleted INTEGER)',
        );
      });
      } catch (e) {
      print('this is db error: $e');
    }
  }


  static Future<int> insertTask(Task task) async{
    print('inserte done');
    return await _db!.insert(_tableName, task.toJson());
  }

  static Future<int> deleteTask(Task task) async{
    print('delete one done');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }
  static Future<List<Map<String, dynamic>>> queryTask() async{
    print('query done');
    return await _db!.query(_tableName);
  }
  static Future<int> deleteAllTasks() async{
    print('all delete done');
    return await _db!.delete(_tableName);
  }


  static Future<int> updateTask({required int isCompleted, required int id}) async{
    print('update done');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    ''',[isCompleted,id]);
  }
}
