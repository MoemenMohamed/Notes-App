import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/controllers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewNoteScreen extends ConsumerStatefulWidget {
  const NewNoteScreen({super.key});

  @override
  ConsumerState<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends ConsumerState<NewNoteScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController detailsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title:"),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  fillColor: Colors.blue.shade100),
              minLines: 1,
              maxLines: 2,
              controller: titleController,
            ),
            Text("Details:"),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  fillColor: Colors.blue.shade100),
              minLines: 1,
              maxLines: 8,
              controller: detailsController,
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100),
                    onPressed: () {
                      ref.read(notesProvider.notifier).addNote(
                          title: titleController.text,
                          body: detailsController.text);
                      ref.read(notesProvider.notifier).fetchNotes();
                    },
                    child: Text(
                      "save",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
