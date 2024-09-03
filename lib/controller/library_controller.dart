import 'package:flutter/material.dart';
import 'package:netflix/model/library_model.dart';
import 'package:netflix/view/library_view.dart';

class LibraryController extends StatelessWidget {
  const LibraryController({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchLibrary(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LibraryView(listMovies: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text("Error:${snapshot.error}");
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("LOADING... WAIT...")
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
