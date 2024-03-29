import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediVideoPlayerBufferingWidget extends StatelessWidget {
  const FediVideoPlayerBufferingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
      stream: videoMediaPlayerBloc.isBufferingStream,
      builder: (context, snapshot) {
        var isBuffering = snapshot.data ?? true;
        if (isBuffering) {
          return const _FediVideoPlayerBufferingLoadingWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _FediVideoPlayerBufferingLoadingWidget extends StatelessWidget {
  const _FediVideoPlayerBufferingLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediCircularProgressIndicator(
        color: IFediUiColorTheme.of(context).white,
      );
}
