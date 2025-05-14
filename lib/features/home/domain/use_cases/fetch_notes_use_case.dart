import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_application_1/features/home/domain/entities/note_entity.dart';
import 'package:flutter_application_1/features/home/domain/repository/notes_base_repo.dart';

class FetchNotesUseCase {
  Future<List<NoteEntity>> execute() async {
    return await getIt<NotesBaseRepo>().fetchAllNotes();
  }
}
