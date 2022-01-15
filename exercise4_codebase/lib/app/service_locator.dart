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

import 'package:get_it/get_it.dart';

import '../screens/main/main_viewmodel.dart';
import '../services/note/note_service.dart';
import '../services/rest.dart';
import '../services/note/note_service_mock.dart';
import '../services/note/note_service_rest.dart';

GetIt locator = GetIt.instance;

void initializeServiceLocator() {
  // Services
  // locator.registerLazySingleton<RestService>(
  //     () => RestService(baseUrl: 'http://192.168.1.147:3000'));

  //TODO To switch between service, comment out the line below accordingly
  locator.registerLazySingleton<NoteService>(() => NoteServiceMock());
  // locator.registerLazySingleton<NoteService>(() => NoteServiceRest());

  // Viewmodels
  locator.registerLazySingleton<MainViewmodel>(() => MainViewmodel());
}
