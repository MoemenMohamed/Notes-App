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
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(notesProvider.notifier).fetchNotes());
  }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 25,
          ),
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
      decoration: BoxDecoration(
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [Text(noteTitle), Text(noteDetails)],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
