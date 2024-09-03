import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.listMovies});
  final List listMovies;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...listMovies.map(
              (item) => Container(
                margin: const EdgeInsets.all(9.0),
                child: Material(
                  color: const Color.fromRGBO(31, 31, 31, 1),
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(
                        context,
                        "/playvideo_controller",
                        arguments: item,
                      )
                    },
                    child: Row(children: [
                      Image.network(
                        "${item.backdropPath}",
                        width: 150,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 3,
                        child: Text(
                          item.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Icon(Icons.play_circle_outlined,
                            color: Colors.white, size: 35),
                      )
                    ]),
                  ),
                ),
              ),
            )
            // )
          ],
        ),
      ),
    );
  }
}
