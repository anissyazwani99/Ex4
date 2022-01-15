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

//TODO Complete the implementation of the viewmodel for the main screen

import '../viewmodel.dart';
import 'package:exercise4/app/service_locator.dart';
import 'package:exercise4/models/note.dart';
import 'package:exercise4/services/note/note_service.dart';

/// `MainViewmodel` the class for the viewmodel of the main screen.
/// Things that you will implement in this class:
///
///  - Declare all related attributes mainly the states
///  - Method method to handle fetching notes from the data service.
///  - Method to handle adding a new note.
///  - Method to handle deleting a note.
///  - Method to handle updating a note.

class MainViewmodel extends Viewmodel {
  final _service = locator<NoteService>();
  List<Note> _list;
  bool _status = false;

  Note getNote(int index) => _list == null ? null : _list[index];
  int get dataCount => _list == null ? 0 : _list.length;
  bool get status => _status;

  @override
  init() => update(() async {
        _list = await _service.fetchNotes();
        super.init();
      });

  void addNote(Note note) => update(() async {
        // 1. Update the "physical" entity via service
        // 2. Update state (in viewmodel)
        // 3. Update the UI

        final item = await _service.addNote(note);
        _list.add(item);
      });

  void removeNote(dynamic id) => update(() async {
        // 1. delete at the backend
        // 2. delete in the viewmodel
        // 3. update UI
        await _service.removeNote(id);
        _list.removeWhere((note) => note.id == id);
      });

  void updateNote({dynamic id, Note data}) => update(() async {
        // 1. Update the database via service
        // 2. Update the state (in viewmodel)
        // 3. Update UI
        final item = await _service.updateNote(id: id, data: data);
        final index = _list.indexWhere((note) => note.id == id);
        if (index == -1) return;
        _list[index] = item;
      });

  void toggleStatus() => update(() async {
        _status = !_status;
      });
}
