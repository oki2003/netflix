import 'package:netflix/Object/Author.dart';

class Review {
  final String id;
  final Author author;
  final String content;

  const Review({required this.id, required this.author, required this.content});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      author: Author.fromJson(json['author_details']),
      content: json['content'] as String,
    );
  }
}
