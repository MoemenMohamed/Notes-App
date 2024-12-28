import 'package:flutter/foundation.dart';

class NoteModel {
  final String title;
  String content;
  final String createTime;
  String updateTime;
  int isFavourite;

  NoteModel(
      {required this.title,
      required this.content,
      required this.createTime,
      required this.updateTime,
      required this.isFavourite});
  factory NoteModel.fromMap(myNote) {
    return NoteModel(
        title: myNote['title'],
        content: myNote['content'],
        createTime: myNote['created_at'],
        updateTime: myNote['updated_at'],
        isFavourite: myNote['isFavourite']);
  }
}
