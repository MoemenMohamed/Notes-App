import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_application_1/features/home/domain/repository/notes_base_repo.dart';

class AddNewNoteUseCase {
  execute({required String title, required String body}) async{
    await getIt<NotesBaseRepo>().addNote(title: title, body: body);
  }
}
