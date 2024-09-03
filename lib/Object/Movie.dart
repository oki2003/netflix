class Movie {
  final int id;
  final String overview;
  final String title;
  final String backdropPath;
  final String posterPath;

  const Movie(
      {required this.id,
      required this.overview,
      required this.title,
      required this.backdropPath,
      required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (json['backdrop_path'] == null || json['poster_path'] == null) {
      return Movie(
        id: json['id'] as int,
        overview: json['overview'] as String,
        title: json['title'] as String,
        backdropPath:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaoWQgKOMl7F3QBdHdry4Q9Uw-r5Hnzq2TzA&s",
        posterPath:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaoWQgKOMl7F3QBdHdry4Q9Uw-r5Hnzq2TzA&s",
      );
    } else {
      return Movie(
        id: json['id'] as int,
        overview: json['overview'] as String,
        title: json['title'] as String,
        backdropPath:
            "https://image.tmdb.org/t/p/w500/${json['backdrop_path']}",
        posterPath: "https://image.tmdb.org/t/p/w500/${json['poster_path']}",
      );
    }
  }
}
