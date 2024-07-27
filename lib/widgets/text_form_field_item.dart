import 'package:daily_note_app/style/color.dart';
import 'package:flutter/material.dart';

class TextFormFieldItem extends StatelessWidget {
  String label;
  int? maxlines;
  TextEditingController controller;

  TextFormFieldItem({
    super.key,
    required this.controller,
    required this.label,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: pink),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightPink,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: TextStyle(color: lightPink),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required to fill this section';
        }
        return null;
      },
    );
  }
}
