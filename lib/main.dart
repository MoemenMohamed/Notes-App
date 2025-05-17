import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/database/sqflite.dart';
import 'package:flutter_application_1/core/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'App/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  // getIt<MyDataBase>()
  //     .insertNote(noteTitle: "firstNote", noteBody: "dsfbdshf", isFavourite: 1);
  //     getIt<MyDataBase>()
  //     .insertNote(noteTitle: "firstNote", noteBody: "dsfbdshf", isFavourite: 0);
  final data = await getIt<MyDataBase>().getAllNotes();
  print(data);
  runApp(ProviderScope(child: const MyApp()));
}
