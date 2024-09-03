import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/Object/Movie.dart';

Future<List> fetchData(String value) async {
  if (value == "") {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=23f1e4dc64dcdfe853dd2aee44cf082d'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } else {
      return [];
    }
  } else {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=23f1e4dc64dcdfe853dd2aee44cf082d&query=${value}'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } else {
      return [];
    }
  }
}
