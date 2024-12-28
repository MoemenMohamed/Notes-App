import '../../../Models/note_model.dart';

abstract class Crud {
  //insert function
  insert(
      {required String noteTitle,
      required String noteContent,
      required String noteCreateTime,
      required String noteUpdateTime,
      required int noteisFavourite});
  Future<List<NoteModel>> query();
  update();
  delete();
}
