import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../Core/Database/sqlite/my_sqflite_db.dart';
import '../Models/note_model.dart';
import '../Widgets/note_tile.dart';
import 'add_new_note.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NoteModel> notes = [];
  @override
  void initState() {
    getAllNotes();
  }

  getAllNotes() async {
    notes = await MySqfliteDb().query();
    print(notes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddNewNote();
                }));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return NoteTile(
              noteTitle: notes[index].title,
              noteContent: notes[index].content,
              noteCreateTime: notes[index].createTime,
              noteUpdateTime: notes[index].updateTime,
              noteIsFavourite: notes[index].isFavourite,
            );
          },
          itemCount: notes.length),
    );
  }
}
