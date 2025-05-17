import 'package:flutter_application_1/core/database/sqflite.dart';
import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_application_1/features/home/data/models/notes_model.dart';
import 'package:flutter_application_1/features/home/domain/entities/note_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/notes_base_repo.dart';

class NotesImplRepo extends NotesBaseRepo {
  @override
  Future<List<NoteEntity>> fetchAllNotes() async {
    final notes = await getIt<MyDataBase>().getAllNotes();
    List<NoteEntity> myNotes = [];
    for (var note in notes) {
      myNotes.add(NotesModel.fromJson(note));
    }
    return myNotes;
  }

  @override
  deleteNote({required int id}) async {
    await getIt<MyDataBase>().deleteNote(id: id);
  }

  @override
  addNote({required String title, required String body}) async {
    await getIt<MyDataBase>().insertNote(noteTitle: title, noteBody: body);
  }

  @override
  updateNote(
      {required String noteTitle,
      required String noteBody,
      required int isFavourite,
      required int noteIndex}) async {
    await getIt<MyDataBase>().updateNote(
        noteTitle: noteTitle,
        noteBody: noteBody,
        isFavourite: isFavourite,
        noteIndex: noteIndex);
  }
}
