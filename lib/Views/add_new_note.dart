import 'package:flutter/material.dart';

import '../Core/Database/sqlite/my_sqflite_db.dart';

import 'package:intl/intl.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  String title = "";
  String content = "";
  // Formatting the date and time
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Note"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Note Title:",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder()),
              onChanged: (value) {
                title = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Add Content:",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder()),
              minLines: 5, // Minimum number of lines
              maxLines:
                  7, // Allows the height to grow as more text is entered
              onChanged: (value) {
                content = value;
              },
            ),
          ),
          Row(
            children: [
              Spacer(flex: 6,),
              ElevatedButton(
                  onPressed: () async {
                    await MySqfliteDb().insert(
                        noteTitle: title,
                        noteContent: content,
                        noteCreateTime: formattedDate,
                        noteUpdateTime: formattedDate,
                        noteisFavourite: 0);
                  },
                  child: Text("Save")),
              Spacer(flex: 1,),
            ],
          )
        ],
      ),
    );
  }
}
