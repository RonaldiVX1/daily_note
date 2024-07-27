import 'package:daily_note_app/style/color.dart';
import 'package:daily_note_app/style/font.dart';
import 'package:daily_note_app/widgets/text_form_field_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';

class NoteFormScreen extends StatefulWidget {
  final Note? note;

  NoteFormScreen({this.note});

  @override
  _NoteFormScreenState createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _reminderTime;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      _reminderTime = widget.note!.reminderTime;
    }
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      if (_reminderTime != null) {
        final note = Note(
          id: widget.note?.id,
          title: _titleController.text,
          description: _descriptionController.text,
          reminderTime: _reminderTime!,
        );
        if (widget.note == null) {
          Provider.of<NotesProvider>(context, listen: false).addNote(note);
        } else {
          Provider.of<NotesProvider>(context, listen: false).updateNote(note);
        }
        Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Opps!'),
            content: Text('Set Reminder Time'),
            actions: [
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: orange,
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title", style: medium18),
                TextFormFieldItem(controller: _titleController, label: 'Title'),
                SizedBox(
                  height: 15,
                ),
                Text("Description", style: medium18),
                TextFormFieldItem(
                    controller: _descriptionController,
                    label: 'Description',
                    maxlines: 3),
                SizedBox(height: 24),
                Text(
                    _reminderTime == null
                        ? 'No reminder set'
                        : 'Reminder: ${DateFormat.yMMMMd().add_jm().format(_reminderTime!)}',
                    style: medium18),
                SizedBox(height: 24),
                Container(
                  width: 450,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: lightPink),
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: _reminderTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (selectedDate != null) {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          setState(() {
                            _reminderTime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );
                          });
                        }
                      }
                    },
                    child: Text('Set Reminder Time',
                        style: TextStyle(fontSize: 18, color: black)),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 450,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: beige),
                    onPressed: _saveNote,
                    child: Text('Save Note',
                        style: TextStyle(fontSize: 18, color: black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
