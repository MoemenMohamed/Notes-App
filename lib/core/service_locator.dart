import 'package:flutter_application_1/core/database/sqflite.dart';
import 'package:flutter_application_1/features/home/data/repository/notes_impl_repo.dart';
import 'package:flutter_application_1/features/home/domain/repository/notes_base_repo.dart';
import 'package:flutter_application_1/features/home/domain/use_cases/fetch_notes_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MyDataBase>(() => MyDataBase());
  getIt.registerLazySingleton<NotesBaseRepo>(() => NotesImplRepo());
  getIt.registerLazySingleton<FetchNotesUseCase>(() => FetchNotesUseCase());
}
