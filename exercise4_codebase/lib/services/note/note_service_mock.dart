// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of each method of this service class

import 'note_service.dart';
import '../../models/note.dart';

/// `NoteServiceMock` is a database service for notes that are stored in internal memory.
///
class NoteServiceMock extends NoteService {
  //? Sample of mock data is provided
  final _mockDb = <Note>[
    Note(
        title: 'What is Flutter?',
        content:
            'Flutter is an open-source UI framework for creating native mobile applications. It allows developers to build mobile applications a single codebase.'),
    Note(
        title: 'Stateful Widgets',
        content:
            'The widgets whose state can be altered once they are built are called stateful Widgets.'),
    Note(
        title: 'Conditional (ternary) operator',
        content:
            'The conditional (ternary) operator in Dart takes three operands: a condition, first expression (if truthy) and second expression (if falsy).'),
  ];

  @override
  Future<List<Note>> fetchNotes() async {
    await Future.delayed(Duration(seconds: 2));
    return [..._mockDb];
  }

  @override
  Future<Note> getNote(id) async {
    await Future.delayed(Duration(seconds: 2));
    final noteItem = _mockDb.firstWhere((note) => note.id == id);
    return Note.copy(noteItem);
  }

  @override
  Future<Note> updateNote({id, Note data}) async {
    //await Future.delayed(Duration(seconds: 0));
    final index = _mockDb.indexWhere((note) => note.id == id);

    if (index == -1) return null;

    final noteItem = _mockDb.firstWhere((note) => note.id == id);
    final updatedNoteItem = Note(id: noteItem.id, title: data.title, content: data.content);
    _mockDb[index] = updatedNoteItem;

    return Note.copy(_mockDb[index]);
  }

  @override
  Future<void> removeNote(id) async {
    await Future.delayed(Duration(seconds: 1));
    _mockDb.removeWhere((note) => note.id == id);
  }

  @override
  Future<Note> addNote(Note data) async {
    await Future.delayed(Duration(seconds: 1));
    int id = (_mockDb != null && _mockDb.length > 0) ? _mockDb.last.id + 1 : 1;
    final newNoteItem = Note(id: id, title: data.title, content: data.content);
    _mockDb.add(newNoteItem);
    return Note.copy(newNoteItem);
  }
}
