import 'dart:convert';
import 'package:netflix/Object/Movie.dart' show Movie;
import 'package:http/http.dart' as http;

Future<List> fetchMovies(http.Client client) async {
  final responsePopular = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=23f1e4dc64dcdfe853dd2aee44cf082d'));
  final responseNowPlaying = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=23f1e4dc64dcdfe853dd2aee44cf082d'));
  final responseTopRated = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=23f1e4dc64dcdfe853dd2aee44cf082d'));
  final responseUpComing = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=23f1e4dc64dcdfe853dd2aee44cf082d'));

  if (responsePopular.statusCode == 200 &&
      responseNowPlaying.statusCode == 200 &&
      responseTopRated.statusCode == 200 &&
      responseUpComing.statusCode == 200) {
    return parseMovies([
      responsePopular.body,
      responseNowPlaying.body,
      responseTopRated.body,
      responseUpComing.body
    ]);
  } else {
    throw Exception('Failed to load Movie');
  }
}

List parseMovies(List listJson) {
  final jsonPopular = jsonDecode(listJson[0]);
  final jsonNowPlaying = jsonDecode(listJson[1]);
  final jsonTopRated = jsonDecode(listJson[2]);
  final jsonUpComing = jsonDecode(listJson[3]);

  final resultsPopular = jsonPopular["results"] as List;
  final resultsNowPlaying = jsonNowPlaying["results"] as List;
  final resultsTopRated = jsonTopRated["results"] as List;
  final resultsUpComing = jsonUpComing["results"] as List;

  final dataPopular =
      resultsPopular.map((item) => Movie.fromJson(item)).toList();
  final dataNowPlaying =
      resultsNowPlaying.map((item) => Movie.fromJson(item)).toList();
  final dataTopRated =
      resultsTopRated.map((item) => Movie.fromJson(item)).toList();
  final dataUpComing =
      resultsUpComing.map((item) => Movie.fromJson(item)).toList();

  return [dataPopular, dataNowPlaying, dataTopRated, dataUpComing];
}
