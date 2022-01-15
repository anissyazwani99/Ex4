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

//? The model class is fully given. Do nothing here.

class Note {
  dynamic id;
  String title;
  String content;

  Note({this.id = 0, this.title = '', this.content = ''});
  Note.copy(from) : this(id: from.id, title: from.title, content: from.content);

  Note.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], title: json['title'], content: json['content']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'content': content};
}
