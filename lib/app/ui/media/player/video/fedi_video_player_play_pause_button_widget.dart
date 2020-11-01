import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediVideoPlayerPlayPauseButtonWidget extends StatelessWidget {
  final double size;
  final double iconSize;

  const FediVideoPlayerPlayPauseButtonWidget({
    this.size = FediSizes.bigIconInCircleDefaultSize,
    this.iconSize = FediSizes.bigIconInCircleDefaultIconSize,
  });

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: videoMediaPlayerBloc.isInitializingStream,
        builder: (context, snapshot) {
          var isInitializing = snapshot.data ?? true;

          if (isInitializing) {
            return const _FediVideoPlayerPlayPauseButtonLoadingWidget();
          } else {
            return _FediVideoPlayerPlayPauseButtonInitializedWidget(
              size: size,
              iconSize: iconSize,
            );
          }
        });
  }
}

class _FediVideoPlayerPlayPauseButtonInitializedWidget extends StatelessWidget {
  const _FediVideoPlayerPlayPauseButtonInitializedWidget({
    Key key,
    @required this.size,
    @required this.iconSize,
  }) : super(key: key);

  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
        stream: videoMediaPlayerBloc.isControlsVisibleStream,
        builder: (context, snapshot) {
          var isControlsVisible = snapshot.data ?? false;

          if (isControlsVisible) {
            return _FediVideoPlayerPlayPauseControlsWidget(
              size: size,
              iconSize: iconSize,
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class _FediVideoPlayerPlayPauseControlsWidget extends StatelessWidget {
  const _FediVideoPlayerPlayPauseControlsWidget({
    Key key,
    @required this.size,
    @required this.iconSize,
  }) : super(key: key);

  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: IFediUiColorTheme.of(context).darkGrey.withOpacity(0.6),
          ),
          child: StreamBuilder<bool>(
            stream: videoMediaPlayerBloc.isPlayingStream,
            builder: (context, snapshot) {
              var isPlaying = snapshot.data ?? false;
              return AsyncOperationButtonBuilderWidget(
                showProgressDialog: false,
                builder: (BuildContext context, void Function() onPressed) {
                  return Container(
                    child: FediIconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isPlaying ? FediIcons.pause : FediIcons.play,
                        size: iconSize,
                        color: IFediUiColorTheme.of(context).white,
                      ),
                      onPressed: onPressed,
                    ),
                  );
                },
                asyncButtonAction: () async {
                  await videoMediaPlayerBloc.togglePlay();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FediVideoPlayerPlayPauseButtonLoadingWidget extends StatelessWidget {
  const _FediVideoPlayerPlayPauseButtonLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediCircularProgressIndicator(
      color: IFediUiColorTheme.of(context).white,
    );
  }
}
