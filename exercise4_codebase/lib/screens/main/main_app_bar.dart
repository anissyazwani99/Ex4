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
import 'package:exercise4/screens/main/main_viewmodel.dart';
import 'package:exercise4/screens/view.dart';

// MainAppBar is to show the application bar
//
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My Notes'),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade200,
          child: SelectorView<MainViewmodel, int>(
              selector: (_, vm) => vm.dataCount,
              builder: (_, vm, __, ___) => Text(
                    '${vm.dataCount}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  )),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
