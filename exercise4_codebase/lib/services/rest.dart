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

//? This class is fully given. You are not expected to do anything here.

// Author: jumail@utm.my.
// Date: Dec 2021

import 'dart:convert';
import 'package:http/http.dart' as http;

/// The class `RestService` is the actual service that performs REST operations.
/// It is wraps the Dart package http to do the networking calls via http.
///
class RestService {
  final String _baseUrl;
  const RestService({baseUrl}) : _baseUrl = baseUrl;

  /// Send a GET request to retrieve data from a REST server
  Future get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  /// Send a POST request to add a new in the REST server
  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  /// Send a PUT request to update an existing data in the REST server.
  Future put(String endpoint, {dynamic data}) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  /// Send a PATCH request to update parts of an existing data in the REST server.
  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  /// Send a DELETE request to remove an existing data from the REST server.
  Future delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return;
    }
    throw response;
  }
}
