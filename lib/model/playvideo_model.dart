import 'dart:convert';
import 'package:netflix/Object/Movie.dart';
import 'package:netflix/Object/Review.dart';
import 'package:netflix/Object/Video.dart';
import 'package:http/http.dart' as http;
import "package:flutter_dotenv/flutter_dotenv.dart";

Future<List> fechtContentVideo(Movie movie) async {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  //reviews of movie
  final responseReviews = await http.Client().get(Uri.parse(
      "https://api.themoviedb.org/3/movie/${movie.id}/reviews?api_key=$apiKey"));
  //videos of movie
  final responseVideos = await http.Client().get(Uri.parse(
      "https://api.themoviedb.org/3/movie/${movie.id}/videos?api_key=$apiKey"));
  //movie details
  final responseDetailMovie = await http.Client().get(Uri.parse(
      "https://api.themoviedb.org/3/movie/${movie.id}?api_key=$apiKey"));
  if (responseReviews.statusCode == 200 &&
      responseVideos.statusCode == 200 &&
      responseDetailMovie.statusCode == 200) {
    final jsonReviews = (jsonDecode(responseReviews.body)["results"] as List)
        .map((reivew) => Review.fromJson(reivew))
        .toList();
    final jsonVideos = (jsonDecode(responseVideos.body)["results"] as List)
        .map((video) => Video.fromJson(video))
        .toList();
    final jsonDetailMovie = jsonDecode(responseDetailMovie.body);
    return [jsonVideos, jsonReviews, jsonDetailMovie];
  } else {
    return [];
  }
}
