import 'package:short_book/data/model/author.dart';

class Line {
  final Author author;
  final String content;

  Line({required this.author, required this.content});

  factory Line.fromJson(Map<String, dynamic> data) {
    return Line(
        author: Author.fromJson(data['author']), content: data['content']);
  }

  Map<String, Object> toJson() {
    return {'author': author.toJson(), 'content': content};
  }
}
