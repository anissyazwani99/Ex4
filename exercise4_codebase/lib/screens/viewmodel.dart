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

// Turn of null-safety by writing the following line
// @dart=2.9

//? The viewmodel class is fully given. You are not expected to modify this file.
//? However, if you feel like to add something or do any changes. Feel free to do so.

// Author: jumail@utm.my.
// Date: Dec 2021

import 'package:flutter/foundation.dart';

/// `Viewmodel` is the base class to implement the viemodel component of an MVVM.
/// Extend the class for your own viewmodel. Do not create an object directly from this base class.
/// Also, you need to register your viewmodels in the service locator (service_locator.dart).
///
class Viewmodel with ChangeNotifier {
  bool _initialized = false;
  bool get initialized => _initialized;
  void markInitialized() => _initialized = true;

  bool _busy = false;

  get busy => _busy;

  void turnBusy() {
    _busy = true;

    notifyListeners();
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }

  /// A convenient method, to implicitly write the turnBusy()... turnIdle()
  void update(AsyncCallback fn) async {
    turnBusy();
    if (fn != null) await fn();
    turnIdle();
  }

  /// To be overridden by the child class if it needs to
  /// do something once the viewmodel has been created
  void init() => markInitialized();
}
