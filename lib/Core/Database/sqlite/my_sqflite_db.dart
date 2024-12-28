import 'package:flutter_application_1/Core/Database/sqlite/crud.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../Models/note_model.dart';

class MySqfliteDb extends Crud {
  final String _tableName = "notes";

  Future<Database> initDatabase() async {
    String allDbPath = await getDatabasesPath();
    String path = join(allDbPath, "userNotes.db");
    Database db = await openDatabase(path, onCreate: (db, version) {
      db.execute(
          "CREATE TABLE IF NOT EXISTS $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, created_at TEXT, updated_at TEXT, isFavourite INTEGER DEFAULT 0)");
      print("table created");
    }, version: 1);
    return db;
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  insert(
      {required String noteTitle,
      required String noteContent,
      required String noteCreateTime,
      required String noteUpdateTime,
      required int noteisFavourite}) async {
    Database db = await initDatabase();
    await db.insert(_tableName, {
      'title': noteTitle,
      'content': noteContent,
      'created_at': noteCreateTime,
      'updated_at': noteUpdateTime,
      'isFavourite': noteisFavourite
    });
  }

  @override
  Future<List<NoteModel>> query() async {
    List<NoteModel> notes = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> queryData =
        await db.rawQuery("SELECT * FROM $_tableName");
    for (Map<String, Object?> data in queryData) {
      notes.add(NoteModel.fromMap(data));
    }
    return notes;
  }

  @override
  update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
