import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_application_1/features/home/domain/repository/notes_base_repo.dart';

class DeleteNoteUseCase {
  execute({required int id}) async {
    await getIt<NotesBaseRepo>().deleteNote(id: id);
  }
}
