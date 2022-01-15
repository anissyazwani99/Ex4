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

//? The main file (main.dart) is fully given. Do nothing here.

import 'package:flutter/material.dart';

import 'app/service_locator.dart';
import 'screens/main/main_screen.dart';

void main() {
  initializeServiceLocator();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MAP Exercise 4',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MainScreen(),
    // home: NoteScreen(),
  ));
}
