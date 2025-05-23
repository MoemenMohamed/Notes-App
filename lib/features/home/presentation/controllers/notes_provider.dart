import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_application_1/features/home/domain/entities/note_entity.dart';
import 'package:flutter_application_1/features/home/domain/use_cases/add_new_note_use_case.dart';
import 'package:flutter_application_1/features/home/domain/use_cases/delete_note_use_case.dart';
import 'package:flutter_application_1/features/home/domain/use_cases/fetch_notes_use_case.dart';
import 'package:flutter_application_1/features/home/domain/use_cases/update_note_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Status { initial, loading, success, error }

class NoteRequest {
  List<NoteEntity> notes;
  Status notesStatus;
  String? error;

  NoteRequest({required this.notes, required this.notesStatus, this.error});
  factory NoteRequest.initialState() {
    return NoteRequest(notes: [], notesStatus: Status.initial);
  }
}

class NoteNotifier extends StateNotifier<NoteRequest> {
  NoteNotifier() : super(NoteRequest.initialState());
  fetchNotes() async {
    state = NoteRequest(notes: [], notesStatus: Status.loading);
    try {
      final result = await getIt<FetchNotesUseCase>().execute();
      state = NoteRequest(notes: result, notesStatus: Status.success);
    } on Exception catch (e) {
      state = NoteRequest(
          notes: [], notesStatus: Status.error, error: "error occured $e");
    }
  }

  deleteNote({required int id}) async {
    try {
      await getIt<DeleteNoteUseCase>().execute(id: id);
      fetchNotes();
    } on Exception catch (e) {
      state = NoteRequest(
          notes: state.notes,
          notesStatus: Status.error,
          error: "error deleting note: $e");
    }
  }

  addNote({required String title, required String body}) async {
    await getIt<AddNewNoteUseCase>().execute(title: title, body: body);
    fetchNotes();
  }

  updateNote(
      {String? noteTitle,
      String? noteBody,
      int? isFavourite,
      required int noteIndex}) async {
    final existingData = state.notes.firstWhere(
      (element) => noteIndex == element.id,
    );
    final updatedNotes = List<NoteEntity>.from(state.notes);
    await getIt<UpdateNoteUseCase>().execute(
        noteTitle: noteTitle ?? existingData.title,
        noteBody: noteBody ?? existingData.details,
        isFavourite: isFavourite ?? existingData.isFavourite,
        noteIndex: noteIndex);
    final updatedNote = NoteEntity(
      details: noteBody ?? existingData.details,
      id: existingData.id,
      title: noteTitle ?? existingData.title,
      isFavourite: isFavourite ?? existingData.isFavourite,
    );
    int index =
        updatedNotes.indexWhere((element) => element.id == updatedNote.id);
    updatedNotes[index] = updatedNote;
    state = NoteRequest(notes: updatedNotes, notesStatus: Status.success);
  }
}

final notesProvider = StateNotifierProvider<NoteNotifier, NoteRequest>((ref) {
  return NoteNotifier();
});
