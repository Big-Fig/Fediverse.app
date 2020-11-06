import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_panel_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_buffering_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_content_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_control_toggle_fullscreen_button_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_play_pause_button_widget.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../fedi_icons.dart';

class FediVideoPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: videoMediaPlayerBloc.desiredAspectRatio,
          child: _FediVideoPlayerBodyWidget(),
        ),
        const FediVideoPlayerBufferingWidget(),
        const FediVideoPlayerPlayPauseButtonWidget(),
        const _FediVideoPlayerControlsWidget(),
        const _FediVideoPlayerErrorWidget(),
      ],
    );
  }

  const FediVideoPlayerWidget();
}

class _FediVideoPlayerErrorWidget extends StatelessWidget {
  const _FediVideoPlayerErrorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IVideoMediaPlayerBloc.of(context);
    return StreamBuilder<bool>(
        stream: mediaPlayerBloc.isHaveErrorStream,
        builder: (context, snapshot) {
          var isHaveError = snapshot.data ?? false;
          if (isHaveError) {
            return const _FediVideoPlayerErrorBodyWidget();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class _FediVideoPlayerErrorBodyWidget extends StatelessWidget {
  const _FediVideoPlayerErrorBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: IFediUiColorTheme.of(context).error.withOpacity(0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _FediVideoPlayerErrorReloadButtonWidget(),
            const _FediVideoPlayerErrorDescWidget(),
            const _FediVideoPlayerErrorDetailsButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _FediVideoPlayerErrorDetailsButtonWidget extends StatelessWidget {
  const _FediVideoPlayerErrorDetailsButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediTransparentTextButton(
      S.of(context).app_media_player_error_action_moreDetails,
      expanded: false,
      color: IFediUiColorTheme.of(context).white,
      onPressed: () {
        var mediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);
        showErrorFediNotificationOverlay(
          context: context,
          contentText: mediaPlayerBloc.error.toString(),
          titleText: null,
        );
      },
    );
  }
}

class _FediVideoPlayerErrorDescWidget extends StatelessWidget {
  const _FediVideoPlayerErrorDescWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        S.of(context).app_media_player_error_desc,
        style: IFediUiTextTheme.of(context).bigShortBoldWhite,
      ),
    );
  }
}

class _FediVideoPlayerErrorReloadButtonWidget extends StatelessWidget {
  const _FediVideoPlayerErrorReloadButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediTransparentTextButton(
        S.of(context).app_media_player_error_action_reload,
        expanded: false,
        color: IFediUiColorTheme.of(context).white,
        onPressed: () {
          var mediaPlayerBloc =
              IVideoMediaPlayerBloc.of(context, listen: false);
          mediaPlayerBloc.reloadAfterError();
        },
      );
}

class _FediVideoPlayerBodyWidget extends StatelessWidget {
  const _FediVideoPlayerBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);
    return StreamBuilder<bool>(
      stream: videoMediaPlayerBloc.isInitializedStream,
      initialData: videoMediaPlayerBloc.isInitialized,
      builder: (context, snapshot) {
        var isInitialized = snapshot.data;
        if (isInitialized) {
          return const _FediVideoPlayerInitializedWidget();
        } else {
          return const _FediVideoPlayerNotInitializedWidget();
        }
      },
    );
  }
}

class _FediVideoPlayerInitializedWidget extends StatelessWidget {
  const _FediVideoPlayerInitializedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        videoMediaPlayerBloc.onTapOnVideo();
      },
      child: const FediVideoPlayerContentWidget(),
    );
  }
}

class _FediVideoPlayerNotInitializedWidget extends StatelessWidget {
  const _FediVideoPlayerNotInitializedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = IMediaPlayerBloc.of(context);
    return Stack(
      children: [
        Container(
          color: IFediUiColorTheme.of(context).mediumGrey,
        ),
        StreamBuilder<bool>(
          stream: mediaPlayerBloc.isInitializingStream,
          initialData: mediaPlayerBloc.isInitializing,
          builder: (context, snapshot) {
            var isInitializing = snapshot.data;

            if(isInitializing) {
              return const SizedBox.shrink();
            }
            return Center(
              child: FediIconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  FediIcons.play,
                  size: FediSizes.bigIconInCircleDefaultIconSize,
                  color: IFediUiColorTheme.of(context).white,
                ),
                onPressed: () {

                  mediaPlayerBloc.performAsyncInit();
                },
              ),
            );
          }
        ),
      ],
    );
  }
}

class _FediVideoPlayerControlsWidget extends StatelessWidget {
  const _FediVideoPlayerControlsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    return StreamBuilder<bool>(
        stream: videoMediaPlayerBloc.isControlsVisibleStream,
        initialData: videoMediaPlayerBloc.isControlsVisible,
        builder: (context, snapshot) {
          var isControlsVisible = snapshot.data;
          if (isControlsVisible) {
            return const Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _FediVideoPlayerControlsBodyWidget(),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class _FediVideoPlayerControlsBodyWidget extends StatelessWidget {
  const _FediVideoPlayerControlsBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

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
            const Expanded(
              child: FediPlayerControlPanelWidget(),
            ),
            if (videoMediaPlayerBloc.isFullScreenSupportEnabled)
              const FediVideoPlayerToggleControlFullscreenButtonWidget(),
          ],
        ),
      ),
    );
  }
}
