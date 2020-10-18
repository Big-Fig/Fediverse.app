import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_panel_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_buffering_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_content_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_control_toggle_fullscreen_button_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_play_pause_button_widget.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediVideoPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: videoMediaPlayerBloc.desiredAspectRatio,
          child: StreamBuilder<bool>(
              stream: videoMediaPlayerBloc.isInitializedStream,
              initialData: videoMediaPlayerBloc.isInitialized,
              builder: (context, snapshot) {
                var isInitialized = snapshot.data;
                if (isInitialized) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      videoMediaPlayerBloc.onTapOnVideo();
                    },
                    child: FediVideoPlayerContentWidget(),
                  );
                } else {
                  return Container(
                    color: IFediUiColorTheme.of(context).mediumGrey,
                  );
                }
              }),
        ),
        FediVideoPlayerBufferingWidget(),
        FediVideoPlayerPlayPauseButtonWidget(),
        StreamBuilder<bool>(
            stream: videoMediaPlayerBloc.isControlsVisibleStream,
            initialData: videoMediaPlayerBloc.isControlsVisible,
            builder: (context, snapshot) {
              var isControlsVisible = snapshot.data;
              if (isControlsVisible) {
                return Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: buildControls(context),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
        buildErrorWidget(videoMediaPlayerBloc),
      ],
    );
  }

  Widget buildErrorWidget(IMediaPlayerBloc mediaPlayerBloc) =>
      StreamBuilder<bool>(
          stream: mediaPlayerBloc.isHaveErrorStream,
          initialData: mediaPlayerBloc.isHaveError,
          builder: (context, snapshot) {
            var isHaveError = snapshot.data;
            if (isHaveError) {
              return Positioned.fill(
                child: Container(
                  color: IFediUiColorTheme.of(context).error.withOpacity(0.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FediTransparentTextButton(
                        "app.media.player.error.action.reload".tr(),
                        expanded: false,
                        color: IFediUiColorTheme.of(context).white,
                        onPressed: () {
                          mediaPlayerBloc.reloadAfterError();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "app.media.player.error.desc".tr(),
                          style: IFediUiTextTheme.of(context).bigShortBoldWhite,
                        ),
                      ),
                      FediTransparentTextButton(
                        "app.media.player.error.action.more_details".tr(),
                        expanded: false,
                        color: IFediUiColorTheme.of(context).white,
                        onPressed: () {
                          showErrorFediNotificationOverlay(
                            context: context,
                            contentText: mediaPlayerBloc.error.toString(),
                            titleText: null,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          });

  Widget buildControls(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            IFediUiColorTheme.of(context).imageDarkOverlay.withOpacity(0.0),
            IFediUiColorTheme.of(context).darkGrey.withOpacity(1.0),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: FediSizes.mediumPadding),
        child: Row(
          children: [
            Expanded(
              child: FediPlayerControlPanelWidget(),
            ),
            if (videoMediaPlayerBloc.isFullScreenSupportEnabled)
              FediVideoPlayerToggleControlFullscreenButtonWidget(),
          ],
        ),
      ),
    );
  }
}
