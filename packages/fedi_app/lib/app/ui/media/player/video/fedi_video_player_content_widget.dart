import 'package:fedi_app/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class FediVideoPlayerContentWidget extends StatelessWidget {
  const FediVideoPlayerContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    return VideoPlayer(
      videoMediaPlayerBloc.videoPlayerController!,
    );
  }
}
