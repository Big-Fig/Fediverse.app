import 'dart:io';

import 'package:chewie_audio/chewie_audio.dart';
import 'package:fedi/media/media_player_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class MediaAudioPlayerWidget extends MediaPlayerWidget<ChewieAudioController> {
  MediaAudioPlayerWidget.localFile({@required File localFile})
      : super.localFile(localFile: localFile);

  MediaAudioPlayerWidget.network({@required String networkUrl})
      : super.network(networkUrl: networkUrl);

  @override
  ChewieAudioController createDisplayController(
      VideoPlayerController videoPlayerController) {
    return ChewieAudioController(
      videoPlayerController: videoPlayerController,
      autoInitialize: false,
      allowMuting: true,
      autoPlay: false,
      looping: false,
      errorBuilder: (context, errorMessage) => Text(errorMessage)
    );
  }

  @override
  void dispose(ChewieAudioController displayController) {
    displayController?.dispose();
  }

  @override
  Widget buildDisplayWidget(
          BuildContext context, ChewieAudioController displayController) =>
      ChewieAudio(
        controller: displayController,
      );
}
