import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:fedi/media/media_player_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class MediaVideoPlayerWidget extends MediaPlayerWidget<ChewieController> {
  MediaVideoPlayerWidget.localFile({@required File localFile})
      : super.localFile(localFile: localFile);

  MediaVideoPlayerWidget.network({@required String networkUrl})
      : super.network(networkUrl: networkUrl);

  @override
  ChewieController createDisplayController(
      VideoPlayerController videoPlayerController) {
    videoPlayerController.setVolume(0);
    return ChewieController(
        aspectRatio: videoPlayerController.value.aspectRatio,
        videoPlayerController: videoPlayerController,
        autoInitialize: false,
        allowFullScreen: false,
        allowMuting: true,
        autoPlay: false,
        looping: false,
        errorBuilder: (context, errorMessage) => Text(errorMessage));
  }

  @override
  void dispose(ChewieController displayController) {
    displayController?.dispose();
  }

  @override
  Widget buildDisplayWidget(
          BuildContext context, ChewieController displayController) =>
      Chewie(
        controller: displayController,
      );
}
