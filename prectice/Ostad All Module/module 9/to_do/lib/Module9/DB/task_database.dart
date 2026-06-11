import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../model/task_model.dart';

class TaskDatabase {
  static Database? _db;

  static Future<Database> getDB() async {
    if (_db != null) {
      return _db!;
    }

    _db = await openDatabase(
      p.join(await getDatabasesPath(), 'task.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER)',
        );
      },
      version: 1,
    );
    return _db!;
  }

  Future<void> insertDB(Task task) async {
    final db = await getDB();
    await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i)=> Task.fromMap(maps[i]));
  }

  Future<void> updateTask(Task task) async {
    final db = await getDB();
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await getDB();
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
