import 'package:flutter/material.dart';
import 'package:netflix/model/search_model.dart';
import 'package:netflix/view/search_view.dart';

class SearchMovieController extends StatefulWidget {
  const SearchMovieController({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SearchMovieController();
  }
}

class _SearchMovieController extends State<SearchMovieController> {
  Future<List> resultSearch = fetchData("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                hintText: "Search your movie here",
                fillColor: const Color.fromRGBO(51, 51, 51, 1.0),
                filled: true,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                if (value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Không được để trống....")),
                  );
                } else {
                  setState(() {
                    resultSearch = fetchData(value);
                  });
                }
              },
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("TOP SEARCH"),
                )),
            FutureBuilder(
                future: resultSearch,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SearchView(listMovies: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
