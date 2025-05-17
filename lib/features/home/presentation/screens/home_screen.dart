import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_router.dart';
import 'package:flutter_application_1/features/home/presentation/controllers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<AnimatedListState> listkey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(notesProvider.notifier).fetchNotes());
  }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined), label: "Favourites"),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade100,
        onPressed: () {
          context.pushNamed(AppRoutes.newNoteScreen);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          key: listkey,
          itemBuilder: (context, index) {
            return NoteTile(
              isFavourite: notes.notes[index].isFavourite,
              noteTitle: notes.notes[index].title,
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
  final int noteIndex;
  int isFavourite;
  NoteTile(
      {super.key,
      required this.noteTitle,
      required this.noteIndex,
      required this.isFavourite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: 120,
              child: Text(
                noteTitle,
                overflow: TextOverflow.ellipsis,
              )),
          IconButton(
              onPressed: () {
                ref.watch(notesProvider.notifier).deleteNote(id: noteIndex);
              },
              icon: Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                isFavourite == 1 ? isFavourite = 0 : isFavourite = 1;
                ref
                    .watch(notesProvider.notifier)
                    .updateNote(noteIndex: noteIndex,isFavourite: isFavourite);
              },
              icon: isFavourite == 1
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border))
        ],
      ),
    );
  }
}
