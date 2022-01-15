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

//TODO Complete the implementation of this class

import 'package:flutter/material.dart';
import 'package:exercise4/models/note.dart';
import '../view.dart';
import 'main_viewmodel.dart';

/// `MainFloat` is show the Floating Action Button (i.e, the Add or the + button)
///
class MainFloat extends StatelessWidget {
  final Note newNote = Note(title: "Untitled Note", content: "Content");

  @override
  Widget build(BuildContext context) {
    return View<MainViewmodel>(builder: (
      _,
      vm,
      __,
    ) {
      return FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Add a new note',
          onPressed: () => vm.addNote(newNote));
    });
  }
}
