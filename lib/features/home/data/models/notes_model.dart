import 'package:flutter_application_1/features/home/domain/entities/note_entity.dart';

class NotesModel extends NoteEntity {
  NotesModel(
      {required super.id,
      required super.title,
      required super.details,
      required super.isFavourite});
  factory NotesModel.fromJson(json) {
    return NotesModel(
        id: json["id"],
        title: json["noteTitle"],
        details: json["noteBody"],
        isFavourite: json['isFavourite']);
  }
}
