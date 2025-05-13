import 'package:flutter_application_1/core/database/sqflite.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MyDataBase>(() => MyDataBase());
}
