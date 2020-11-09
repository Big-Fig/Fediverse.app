import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class FediVideoPlayerContentWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    return VideoPlayer(
      videoMediaPlayerBloc.videoPlayerController,
    );
  }

  const FediVideoPlayerContentWidget();
}
