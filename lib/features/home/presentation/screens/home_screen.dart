import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/controllers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NoteTile(
              noteTitle: notes.notes[index].title,
              noteDetails: notes.notes[index].details,
            );
          },
          itemCount: notes.notes.length,
        ),
      ),
    );
  }
}

class NoteTile extends StatelessWidget {
  final String noteTitle;
  final String noteDetails;
  const NoteTile({
    super.key,
    required this.noteTitle,
    required this.noteDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue.shade300),
      child: Column(
        children: [Text(noteTitle), Text(noteDetails)],
      ),
    );
  }
}
