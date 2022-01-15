// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of each method of this service class.

import '../../app/service_locator.dart';
import '../rest.dart';
import 'note_service.dart';
import '../../models/note.dart';

/// `NoteServiceRest` is a datbase service for notes that are accessed from a REST service.
///
class NoteServiceRest extends NoteService {
  RestService get rest => locator();

  @override
  Future<List<Note>> fetchNotes() async {
    final jsonList =
        await rest.get('notes'); // http://192.168.0.5:3000/numbers
    return (jsonList as List).map((json) => Note.fromJson(json)).toList();
  }

  @override
  Future<Note> getNote(id) async {
    final json = await rest.get('notes/$id');
    return Note.fromJson(json);
  }

  @override
  Future<Note> updateNote({id, Note data}) async {
    final json = await rest.patch('notes/$id', data: data);
    return Note.fromJson(json);
  }

  @override
  Future<void> removeNote(id) async {
    await rest.delete('notes/$id');
  }

  @override
  Future<Note> addNote(Note data) async {
    final json = await rest.post('notes', data: data);
    return Note.fromJson(json);
  }
}
