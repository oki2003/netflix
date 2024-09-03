import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.listmovies});
  final List listmovies;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text("POPULAR")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...listmovies[0].map(
                      (item) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/playvideo_controller",
                            arguments: item,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: Column(children: [
                            Image.network(
                              "${item.posterPath}",
                              width: 160,
                            ),
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text("NOW PLAYING")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...listmovies[1].map(
                      (item) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/playvideo_controller",
                            arguments: item,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: Column(children: [
                            Image.network(
                              "${item.posterPath}",
                              width: 160,
                            ),
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text("TOP RATED")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...listmovies[2].map(
                      (item) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/playvideo_controller",
                            arguments: item,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: Column(children: [
                            Image.network(
                              "${item.posterPath}",
                              width: 160,
                            ),
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text("UP COMING")),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...listmovies[3].map(
                      (item) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/playvideo_controller",
                            arguments: item,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: Column(children: [
                            Image.network(
                              "${item.posterPath}",
                              width: 160,
                            ),
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
