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

import 'note_editor_tile.dart';
import 'note_tile.dart';
import '../view.dart';
import 'main_viewmodel.dart';

/// `MainBody` the body of the main screen.
/// It should display the list of notes.
/// If the note is under editing, show the note with `NoteEditor` tile widget.
/// Otherwise, show the note with `NoteTile` widget
///
class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, int>(
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___) {
          return ListView.separated(
              itemCount: vm.dataCount,
              separatorBuilder: (_, index) => Divider(
                    color: Colors.blueGrey,
                  ),
              itemBuilder: (_, index) {
                return SelectorView<MainViewmodel, bool>(
                    selector: (_, vm) => vm.status,
                    builder: (_, vm, __, ___) {
                      return vm.status
                          ? NoteEditorTile(index)
                          : NoteTile(index);
                    });
              });
        });
  }
}
