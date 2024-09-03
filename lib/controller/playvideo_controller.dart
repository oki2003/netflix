import 'package:flutter/material.dart';
import 'package:netflix/Object/Movie.dart';
import 'package:netflix/Object/Video.dart';
import 'package:netflix/model/playvideo_model.dart' show fechtContentVideo;
import 'package:netflix/view/loading_view.dart';
import 'package:netflix/view/playvideo/contentVideo_view.dart';
import 'package:netflix/view/playvideo/youtube_view.dart';
import 'package:netflix/view/playvideo/panel/description_view.dart'
    show DescriptionView;
import 'package:netflix/view/playvideo/panel/reviews_view.dart'
    show ReviewsView;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoController extends StatefulWidget {
  const PlayVideoController({super.key});
  @override
  State<StatefulWidget> createState() {
    return _PlayVideoController();
  }
}

class _PlayVideoController extends State<PlayVideoController> {
  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    // Movie movie = const Movie(
    //     id: 533535,
    //     overview:
    //         "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
    //     title: "Deadpool & Wolverine",
    //     backdropPath: "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg",
    //     posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg");
    return FutureBuilder<List>(
      future: fechtContentVideo(movie),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ContentVideoController(
            listContent: snapshot.data!,
            movie: movie,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Text('Error');
        }
        // By default, show a loading spinner.
        return const LoadingView();
      },
    );
  }
}

class ContentVideoController extends StatefulWidget {
  const ContentVideoController(
      {super.key, required this.listContent, required this.movie});
  final List listContent;
  final Movie movie;
  @override
  State<StatefulWidget> createState() {
    return _ContentVideoController();
  }
}

class _ContentVideoController extends State<ContentVideoController> {
  late List listContent;
  late Movie movie;
  late Video video;
  bool showComment = false;
  bool firstBuild = true;
  // bool isFirst = true;
  late YoutubePlayerController controller;
  final PanelController _pc = PanelController();
  @override
  void initState() {
    listContent = widget.listContent;
    movie = widget.movie;
    video = Video(
        id: listContent[0][0].id,
        name: listContent[0][0].name,
        key: listContent[0][0].key,
        type: listContent[0][0].type);
    controller = YoutubePlayerController(
        initialVideoId: video.key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    Future.delayed(Duration.zero, () {
      _pc.hide();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _pc,
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      panel: showComment
          ? ReviewsView(
              listData: listContent[1],
              panelController: _pc,
            )
          : DescriptionView(
              listData: listContent[2],
              nameMovidePlaying: video.name,
              panelController: _pc,
              title: movie.title,
              typeMovidePlaying: video.type),
      body: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          YoutubePlayerView(controller: controller),
          ContentVideoView(
              listContent: listContent[0],
              movie: movie,
              video: video,
              showReviews: () async {
                await _pc.show();
                await _pc.open();
                setState(() {
                  showComment = true;
                });
              },
              showDescription: () async {
                await _pc.show();
                await _pc.open();
                setState(() {
                  showComment = false;
                });
              },
              controller: controller)
        ],
      )),
    );
  }
}
