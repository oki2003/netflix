import 'package:flutter/material.dart';
import 'package:netflix/Object/Movie.dart';
import 'package:netflix/Object/Video.dart';
import 'package:netflix/view/playvideo/favorite_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentVideoView extends StatefulWidget {
  ContentVideoView(
      {super.key,
      required this.listContent,
      required this.movie,
      required this.video,
      required this.showReviews,
      required this.showDescription,
      required this.controller});

  late List listContent;
  late Movie movie;
  late Video video;
  final VoidCallback showReviews;
  final VoidCallback showDescription;
  final YoutubePlayerController controller;
  @override
  State<StatefulWidget> createState() {
    return _ContentVideoView();
  }
}

class _ContentVideoView extends State<ContentVideoView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              widget.showDescription();
            },
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0))),
            child: Text(
              widget.video.type != "Featurette"
                  ? "${widget.movie.title} | ${widget.video.name} | ${widget.video.type}"
                  : widget.video.name,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: FavoriteView(movie: widget.movie)),
        Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 15, right: 15, bottom: 20),
          child: ElevatedButton(
              onPressed: () {
                widget.showReviews();
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(51, 51, 51, 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: const Center(
                child: Text(
                  "Reading Comment",
                  style:
                      TextStyle(color: Colors.white, fontSize: 13, height: 3),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...widget.listContent.map(
                (item) => InkWell(
                  onTap: () {
                    setState(() {
                      widget.video = Video(
                          id: item.id,
                          name: item.name,
                          key: item.key,
                          type: item.type);
                      widget.controller.load(widget.video.key);
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: Column(children: [
                      Stack(alignment: Alignment.center, children: [
                        Image.network(
                          "https://img.youtube.com/vi/${item.key}/0.jpg",
                          width: 300,
                        ),
                        (widget.video.key == item.key)
                            ? const Center(
                                child: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 60,
                              ))
                            : const SizedBox()
                      ]),
                      SizedBox(
                        width: 250,
                        child: Center(
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
