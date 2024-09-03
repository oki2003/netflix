class Author {
  final String name;
  final String username;
  final String avatarPath;
  final double rating;

  const Author(
      {required this.name,
      required this.username,
      required this.avatarPath,
      required this.rating});

  factory Author.fromJson(Map<String, dynamic> json) {
    if (json['avatar_path'] == null) {
      if (json['rating'] != null) {
        return Author(
          name: json['name'] as String,
          username: json['username'] as String,
          avatarPath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaoWQgKOMl7F3QBdHdry4Q9Uw-r5Hnzq2TzA&s",
          rating: json['rating'].toDouble() as double,
        );
      } else {
        return Author(
          name: json['name'] as String,
          username: json['username'] as String,
          avatarPath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaoWQgKOMl7F3QBdHdry4Q9Uw-r5Hnzq2TzA&s",
          rating: 5.0,
        );
      }
    } else {
      if (json['rating'] != null) {
        return Author(
          name: json['name'] as String,
          username: json['username'] as String,
          avatarPath: "https://image.tmdb.org/t/p/w500/${json['avatar_path']}",
          rating: json['rating'].toDouble() as double,
        );
      } else {}
      return Author(
        name: json['name'] as String,
        username: json['username'] as String,
        avatarPath: "https://image.tmdb.org/t/p/w500/${json['avatar_path']}",
        rating: 5.0,
      );
    }
  }

  @override
  String toString() {
    return 'Author(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
  }
}
