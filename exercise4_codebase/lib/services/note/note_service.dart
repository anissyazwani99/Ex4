// Turn of null-safety by writing the following line
// @dart=2.9

import '../../models/note.dart';

//? The abstract class for the service is fully given. Do nothing here.

/// This abstract class is meant to facilitate the concept of Dependency Inversion.
/// That means, you can simply switch between services (i.e., from REST to Mock and vice-versa)
/// without changing most parts of your code.
/// You simply switch the service in service locator registration (service_locator.dart)
///
abstract class NoteService {
  Future<List<Note>> fetchNotes();
  Future<Note> getNote(id);
  Future<Note> updateNote({id, Note data});
  Future<void> removeNote(id);
  Future<Note> addNote(Note data);
}
