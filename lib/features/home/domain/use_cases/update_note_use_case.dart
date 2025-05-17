import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_application_1/features/home/domain/repository/notes_base_repo.dart';

class UpdateNoteUseCase {
  execute(
      {required String noteTitle,
      required String noteBody,
      required int isFavourite,
      required int noteIndex}) {
    getIt<NotesBaseRepo>().updateNote(
        noteTitle: noteTitle,
        noteBody: noteBody,
        isFavourite: isFavourite,
        noteIndex: noteIndex);
  }
}
