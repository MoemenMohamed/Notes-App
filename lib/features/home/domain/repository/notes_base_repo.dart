import 'package:flutter_application_1/features/home/domain/entities/note_entity.dart';

abstract class NotesBaseRepo {
  Future<List<NoteEntity>> fetchAllNotes();
  deleteNote({required int id});
  addNote({required String title, required String body});
  updateNote(
      {required String noteTitle,
      required String noteBody,
      required int isFavourite,
      required int noteIndex});
}
