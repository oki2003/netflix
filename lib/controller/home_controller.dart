import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/model/home_model.dart';
import 'package:netflix/view/home_view.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeController();
  }
}

class _HomeController extends State<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List>(
          future: fetchMovies(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MoviesList(listmovies: snapshot.data!);
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({super.key, required this.listmovies});
  final List listmovies;
  @override
  Widget build(BuildContext context) {
    return HomeView(listmovies: listmovies);
  }
}
