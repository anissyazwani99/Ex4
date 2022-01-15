//? MOBILE APPLICATION PROGRAMMING
//? Exercise 4

// Date: 15/1/2022
// Member 1's Name: Tachaini a/p Karunanithi    Section: 01   Location: Ulu Tiram, Johor (i.e. where are you currently located)
// Member 2's Name: Anis Syazwani binti Md. Aini    Section: 02   Location: Semenyih

// Log the time(s) your pair programming sessions
//  Date         Time (From)   To             Duration (in minutes)
//  _________    ___________   ___________    ________
//  _________    ___________   ___________    ________
//  _________    ___________   ___________    ________

//? This custom widget is fully given. Do nothing about it.

import 'package:flutter/material.dart';

/// CustomTextField is a custom widget  meant for not repeating yourself (i.e., to prevent redudant code).
/// It is used in the NoteEditorTile widget.

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.initialValue, this.onChanged, this.maxLines = 1});

  final int maxLines;
  final String initialValue;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
        color: Colors.red,
      ))),
      onChanged: onChanged,
    );
  }
}
