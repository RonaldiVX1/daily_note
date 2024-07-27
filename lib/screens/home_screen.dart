import 'package:daily_note_app/screens/note_form_screen.dart';
import 'package:daily_note_app/style/color.dart';
import 'package:daily_note_app/style/font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/notes_provider.dart';
import 'login_screen.dart';
import '../widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NotesProvider>(context, listen: false).loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NotesProvider>(context).notes;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: orange,
        title: Text(
          'Daily Notes',
          style: bold20,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: notes.isEmpty
          ? Center(child: Text('No notes available'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: NoteItem(
                      note: note,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteFormScreen(note: note),
                          ),
                        ).then((value) => setState(() {}));
                      }),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteFormScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Create Note"),
      ),
    );
  }
}
