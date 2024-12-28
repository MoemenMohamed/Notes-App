import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String noteTitle;
  final String noteContent;
  final String noteCreateTime;
  final String noteUpdateTime;
  final int noteIsFavourite;
  const NoteTile(
      {super.key,
      required this.noteTitle,
      required this.noteContent,
      required this.noteCreateTime,
      required this.noteUpdateTime,
      required this.noteIsFavourite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              noteTitle,
              style: TextStyle(fontSize: 22),
            ),
            Text(noteContent),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        Column(
          children: [
            Text(
              "Created",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(noteCreateTime),
            Text(
              "Last Edited",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(noteUpdateTime),
          ],
        )
      ]),
    );
  }
}
