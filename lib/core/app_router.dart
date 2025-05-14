import 'package:flutter_application_1/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/features/home/presentation/screens/new_note_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String homeScreen = 'home';
  static const String newNoteScreen = 'new_note';
}

final router = GoRouter(
  initialLocation: '/home',
  routes: [
  GoRoute(
    name: AppRoutes.homeScreen,
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    name: AppRoutes.newNoteScreen,
    path: '/new_note',
    builder: (context, state) => NewNoteScreen(),
  )
]);
