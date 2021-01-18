import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/media/player/control/fedi_player_control_panel_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_buffering_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_content_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_control_toggle_fullscreen_button_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_play_pause_button_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final _logger = Logger("fedi_video_player_widget.dart");

class FediVideoPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const _FediVideoPlayerBodyWidget(),
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
    return FediTransparentTextButtonWithBorder(
      S.of(context).app_media_player_error_action_moreDetails,
      expanded: false,
      color: IFediUiColorTheme.of(context).white,
      onPressed: () {
        var mediaPlayerBloc = IVideoMediaPlayerBloc.of(context, listen: false);
        IToastService.of(context, listen: false).showErrorToast(
          context: context,
          title: mediaPlayerBloc.error.toString(),
          content: null,
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
  Widget build(BuildContext context) => FediTransparentTextButtonWithBorder(
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
      builder: (context, snapshot) {
        var isInitialized = snapshot.data ?? false;
        _logger.finest(() => "isInitialized $isInitialized, "
            "playerState  ${videoMediaPlayerBloc.playerState}");
        // todo: remove hack
        // sometimes  videoMediaPlayerBloc.isInitialized already false
        // but isInitialized contains old true value
        if (isInitialized && videoMediaPlayerBloc.isInitialized) {
          return AspectRatio(
            aspectRatio: videoMediaPlayerBloc.actualAspectRatio ?? 1.0,
            child: const _FediVideoPlayerInitializedWidget(),
          );
        } else {
          return AspectRatio(
            aspectRatio: videoMediaPlayerBloc.desiredAspectRatio,
            child: const _FediVideoPlayerNotInitializedWidget(),
          );
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

              if (isInitializing) {
                return const SizedBox.shrink();
              }
              return Center(
                child: FediIconInCircleTransparentButton(
                  FediIcons.play,
                  size: FediSizes.bigIconInCircleDefaultSize,
                  iconSize: FediSizes.bigIconInCircleDefaultIconSize,
                  color: IFediUiColorTheme.of(context).white,
                  onPressed: () {
                    mediaPlayerBloc.performAsyncInit();
                  },
                ),
              );
            }),
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
