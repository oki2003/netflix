import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix/Object/Movie.dart';

Future<List> fetchLibrary() async {
  final arr = [];
  await FirebaseFirestore.instance.collection("movies").get().then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        // print('${docSnapshot.id} => ${docSnapshot.data()}');
        Movie movie = Movie.fromJson(docSnapshot.data());
        arr.add(movie);
      }
    },
    onError: (e) => print("Error: $e"),
  );
  return arr;
}
