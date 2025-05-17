import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  Future<Database> _openDb() async {
    //get database path
    final dbPath = await getDatabasesPath();
    final fullPath = join(dbPath, "notes.db");

    final database = await openDatabase(
      fullPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE Notes (id INTEGER PRIMARY KEY, noteTitle TEXT, noteBody TEXT, isFavourite INTEGER)');
      },
    );
    return database;
  }

  Future<int> insertNote(
      {required String noteTitle,
      required String noteBody,
      int isFavourite = 0}) async {
    Database database = await _openDb();
    int rawId = await database.insert("Notes", {
      'noteTitle': noteTitle,
      'noteBody': noteBody,
      'isFavourite': isFavourite
    });
    return rawId;
  }

  Future<void> deleteNote({required int id}) async {
    Database database = await _openDb();
    await database.execute("DELETE FROM Notes Where id = $id");
  }

  Future<List<Map<String, Object?>>> getAllNotes() async {
    Database database = await _openDb();
    return await database.query("Notes");
  }

  updateNote(
      {required String noteTitle,
      required String noteBody,
      required int isFavourite,
      required int noteIndex}) async {
    Database database = await _openDb();
    await database.update(
      "Notes",
      {
        'noteTitle': noteTitle,
        'noteBody': noteBody,
        'isFavourite': isFavourite
      },
      where: "id = ?",
      whereArgs: [noteIndex],
    );
  }
}
