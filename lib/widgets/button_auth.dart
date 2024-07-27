import 'package:daily_note_app/style/color.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  String title;
  String subtitle;
  Function onPresed;
  Function onTap;

  ButtonAuth({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPresed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 450,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: orange),
            onPressed: () => onPresed(),
            child: Text(title, style: TextStyle(fontSize: 18, color: black)),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(),
          child: Container(
            width: 450,
            height: 50,
            child: Center(
              child:
                  Text(subtitle, style: TextStyle(fontSize: 18, color: black)),
            ),
          ),
        ),
      ],
    );
  }
}
