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
import '../../models/note.dart';
import '../view.dart';
import 'main_viewmodel.dart';
import 'widgets/custom_text_field.dart';

/// `NoteEditorTile` is a custom ListTile widget that should be
/// shown when a note is under editing.
///
class NoteEditorTile extends StatelessWidget {
  const NoteEditorTile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, Note>(
        selector: (_, vm) => vm.getNote(index),
        builder: (_, vm, __, ___) {
          return ListTile(
            title: CustomTextField(
              initialValue: '${vm.getNote(index).title}',
              onChanged: (value) {
                return vm.getNote(index).title = value;
                // return vm.updateNote(id: vm.getNote(index).id, data: vm.getNote(index));
              },
            ),
            subtitle: CustomTextField(
              maxLines: 3,
              initialValue: '${vm.getNote(index).content}',
              onChanged: (value) => vm.getNote(index).content = value,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.blue,
              ),
              onPressed: () => vm.removeNote(vm.getNote(index).id),
            ),
            onLongPress: () {
              vm.updateNote(id: vm.getNote(index).id, data: vm.getNote(index));
              vm.toggleStatus();
            },
          );
        });
  }
}
