import 'package:daily_note_app/services/notifications_services.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/database_helper.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> loadNotes() async {
    _notes = await DatabaseHelper.instance.getNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    final id = await DatabaseHelper.instance.createNote(note);
    if (id > 0) {
      await NotificationService().scheduleNotification(
        id,
        note.title,
        note.description,
        note.reminderTime,
      );
    }
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await DatabaseHelper.instance.updateNote(note);
    await NotificationService().scheduleNotification(
      note.id!,
      note.title,
      note.description,
      note.reminderTime,
    );
    await loadNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    await loadNotes();
  }
}
