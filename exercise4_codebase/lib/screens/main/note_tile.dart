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

/// `NoteTile` is a custom ListTile widget.
/// What it should do basically only to refactor the code
/// to make the `MainBody` much cleaner.
/// This widget will be used for normal building of
/// the list tile on the `MainBody' (i.e, without any editing)
///
class NoteTile extends StatelessWidget {
  const NoteTile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, Note>(
      selector: (_, vm) => vm.getNote(index),
      builder: (_, vm, __, ___) {
        return ListTile(
          title: Text('${vm.getNote(index).title}'),
          subtitle: Text('${vm.getNote(index).content}'),
          onLongPress: () => vm.toggleStatus(),
          onTap: () {},
        );
      },
    );
  }
}
