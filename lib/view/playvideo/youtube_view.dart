import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatelessWidget {
  const YoutubePlayerView({super.key, required this.controller});
  final YoutubePlayerController controller;
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
            playedColor: Colors.white,
            handleColor: Colors.white,
          ),
        ),
        const PlaybackSpeedButton(),
      ],
    );
  }
}
