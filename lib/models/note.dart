import 'dart:convert';

class Note {
  final String title;
  final String content;

  Note({required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content};
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(title: map['title'] ?? '', content: map['content'] ?? '');
  }

  String toJson() => json.encode(toMap());
  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
