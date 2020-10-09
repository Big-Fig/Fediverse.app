import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediVideoPlayerPlayPauseButtonWidget extends StatelessWidget {
  final double size;
  final double iconSize;

  FediVideoPlayerPlayPauseButtonWidget({
    this.size = FediSizes.bigIconInCircleDefaultSize,
    this.iconSize = FediSizes.bigIconInCircleDefaultIconSize,
  });

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: videoMediaPlayerBloc.isInitializingStream,
        initialData: videoMediaPlayerBloc.isInitializing,
        builder: (context, snapshot) {
          var isInitializing = snapshot.data;

          if (isInitializing) {
            return buildLoading();
          } else {
            return StreamBuilder<bool>(
                stream: videoMediaPlayerBloc.isControlsVisibleStream,
                initialData: videoMediaPlayerBloc.isControlsVisible,
                builder: (context, snapshot) {
                  var isControlsVisible = snapshot.data;

                  if (isControlsVisible) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(size),
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FediColors.darkGrey.withOpacity(0.6),
                          ),
                          child: StreamBuilder<bool>(
                              stream: videoMediaPlayerBloc.isPlayingStream,
                              initialData: videoMediaPlayerBloc.isPlaying,
                              builder: (context, snapshot) {
                                var isPlaying = snapshot.data;
                                return AsyncOperationButtonBuilderWidget(
                                  showProgressDialog: false,
                                  builder: (BuildContext context,
                                      void Function() onPressed) {
                                    return Container(
                                      child: FediIconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          isPlaying
                                              ? FediIcons.pause
                                              : FediIcons.play,
                                          size: iconSize,
                                          color: FediColors.white,
                                        ),
                                        onPressed: onPressed,
                                      ),
                                    );
                                  },
                                  asyncButtonAction: () async {
                                    await videoMediaPlayerBloc.togglePlay();
                                  },
                                );
                              }),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                });
          }
        });
  }

  FediCircularProgressIndicator buildLoading() {
    return FediCircularProgressIndicator(
      color: FediColors.white,
    );
  }
}
