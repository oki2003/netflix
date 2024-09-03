import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Object/Movie.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key, required this.movie});
  final Movie movie;
  @override
  State<StatefulWidget> createState() {
    return _FavoriteView();
  }
}

class _FavoriteView extends State<FavoriteView> {
  bool isFavorite = false;
  bool isLoading = true;
  @override
  void initState() {
    checkFavorite();
    super.initState();
  }

  void checkFavorite() async {
    FirebaseFirestore.instance
        .collection("movies")
        .doc(widget.movie.id.toString())
        .get()
        .then((DocumentSnapshot doc) {
      if (doc.exists) {
        setState(() {
          isLoading = false;
          isFavorite = true;
        });
        print('co');
      } else {
        setState(() {
          isLoading = false;
          isFavorite = false;
        });
        print('ko co');
      }
    }, onError: (e) {});
  }

  void handleDataOnFireStore() async {
    setState(() {
      isFavorite = !isFavorite;
      isLoading = true;
    });
    try {
      // Create a new user with a first and last name
      final movie = <String, dynamic>{
        "id": widget.movie.id,
        "overview": widget.movie.overview,
        "title": widget.movie.title,
        "backdrop_path": widget.movie.backdropPath,
        "poster_path": widget.movie.posterPath
      };
      if (isFavorite == true) {
        FirebaseFirestore.instance
            .collection("movies")
            .doc(widget.movie.id.toString())
            .set(movie)
            .then((_) {
          setState(() {
            isLoading = false;
          });
        }).catchError((error) {
          print('Error adding document: $error');
          setState(() {
            isLoading = false;
            isFavorite = false;
          });
        });
      } else {
        FirebaseFirestore.instance
            .collection("movies")
            .doc(widget.movie.id.toString())
            .delete()
            .then((doc) => {
                  print("Document deleted"),
                  setState(() {
                    isLoading = false;
                  })
                });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: Text("Do you like this movie?")),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: isLoading
                ? const CircularProgressIndicator()
                : isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
            color: Colors.red[500],
            onPressed: () {
              if (isLoading != true) {
                handleDataOnFireStore();
              }
            },
          ),
        )
      ],
    );
  }
}
