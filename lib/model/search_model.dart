import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/Object/Movie.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";

Future<List> fetchData(String value) async {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  if (value == "") {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } else {
      return [];
    }
  } else {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$value'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } else {
      return [];
    }
  }
}
