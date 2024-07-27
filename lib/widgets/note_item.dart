import 'dart:ui';

import 'package:daily_note_app/providers/notes_provider.dart';
import 'package:daily_note_app/style/color.dart';
import 'package:daily_note_app/style/font.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  NoteItem({required this.note, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.delete_forever, color: Colors.white),
            Text(
              "Delete",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )
          ],
        ),
      ),
      key: Key(note.id.toString()),
      onDismissed: (direction) {
        context.read<NotesProvider>().deleteNote(note.id!);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Note Deleted')));
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(16),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  beige,
                  lightPink,
                ],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: bold18,
              ),
              SizedBox(height: 4),
              Text(
                note.description,
                overflow: TextOverflow.ellipsis,
                style: medium18,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(DateFormat('dd MMMM yyyy – kk:mm')
                      .format(note.reminderTime)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
