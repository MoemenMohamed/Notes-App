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
            'CREATE TABLE Notes (id INTEGER PRIMARY KEY, noteTitle TEXT, noteBody TEXT)');
      },
    );
    return database;
  }

  Future<int> insertNote(
      {required String noteTitle, required String noteBody}) async {
    Database database = await _openDb();
    int rawId = await database
        .insert("Notes", {'noteTitle': noteTitle, 'noteBody': noteBody});
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
}
