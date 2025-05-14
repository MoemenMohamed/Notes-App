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
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      appBar: AppBar(title: Text("Notes"),),
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
              noteIndex: notes.notes[index].id,
            );
          },
          itemCount: notes.notes.length,
        ),
      ),
    );
  }
}

class NoteTile extends ConsumerWidget {
  final String noteTitle;
  final String noteDetails;
  final int noteIndex;
  const NoteTile({
    super.key,
    required this.noteTitle,
    required this.noteDetails,
    required this.noteIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [Text(noteTitle), Text(noteDetails)],
          ),
          IconButton(
              onPressed: () {
                ref.watch(notesProvider.notifier).deleteNote(id: noteIndex);
              },
              icon: Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
