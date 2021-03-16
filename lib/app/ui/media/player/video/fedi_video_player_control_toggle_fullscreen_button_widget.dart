import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:wakelock/wakelock.dart';

final _logger =
    Logger("fedi_video_player_control_toggle_fullscreen_button_widget.dart");

class FediVideoPlayerToggleControlFullscreenButtonWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    var mediaPlayerBloc = videoMediaPlayerBloc;
    if (mediaPlayerBloc.isFullScreenSupportEnabled) {
      return const _FediVideoPlayerToggleControlFullscreenButtonEnabledWidget();
    } else {
      return const _FediVideoPlayerToggleControlFullscreenButtonDisabledWidget();
    }
  }

  const FediVideoPlayerToggleControlFullscreenButtonWidget();
}

class _FediVideoPlayerToggleControlFullscreenButtonEnabledWidget
    extends StatelessWidget {
  const _FediVideoPlayerToggleControlFullscreenButtonEnabledWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    var isFullscreen = videoMediaPlayerBloc.isFullscreen;
    _logger.finest(() => "onClick isFullscreen $isFullscreen");

    return FediIconButton(
      icon: Icon(isFullscreen ? FediIcons.minimize : FediIcons.maximize),
      color: IFediUiColorTheme.of(context).white,
      onPressed: () {
        if (isFullscreen) {
          Navigator.of(context, rootNavigator: true).pop();
        } else {
          unawaited(pushFullScreenPage(context, videoMediaPlayerBloc));
        }
      },
    );
  }
}

Future<dynamic> pushFullScreenPage(
    BuildContext context, IVideoMediaPlayerBloc videoMediaPlayerBloc) async {
  final isAndroid = Theme.of(context).platform == TargetPlatform.android;
  final TransitionRoute<Null> route = PageRouteBuilder<Null>(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return DisposableProvider<IVideoMediaPlayerBloc>(
            create: (context) => VideoMediaPlayerBloc(
              mediaPlayerSource: videoMediaPlayerBloc.mediaPlayerSource,
              desiredAspectRatio: videoMediaPlayerBloc.desiredAspectRatio,
              isFullScreenSupportEnabled:
                  videoMediaPlayerBloc.isFullScreenSupportEnabled,
              autoInit: videoMediaPlayerBloc.autoInit,
              autoPlay: videoMediaPlayerBloc.autoPlay,
              isFullscreen: true,
            ),
            child: VideoMediaPlayerBlocProxyProvider(
              child: const _FediVideoPlayerToggleControlFullscreenPage(),
            ),
          );
        },
      );
    },
  );

  await SystemChrome.setEnabledSystemUIOverlays([]);
  if (isAndroid) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  if (!videoMediaPlayerBloc.isNeedEnableWakelockOnFullScreen) {
    await Wakelock.enable();
  }

  await Navigator.of(context, rootNavigator: true).push(route);

  // The wakelock plugins checks whether it needs to perform an action internally,
  // so we do not need to check Wakelock.isEnabled.
  await Wakelock.disable();

  await SystemChrome.setEnabledSystemUIOverlays(
      videoMediaPlayerBloc.systemOverlaysAfterFullScreen);
  await SystemChrome.setPreferredOrientations(
      videoMediaPlayerBloc.deviceOrientationsAfterFullScreen);
}

class _FediVideoPlayerToggleControlFullscreenButtonDisabledWidget
    extends StatelessWidget {
  const _FediVideoPlayerToggleControlFullscreenButtonDisabledWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(FediIcons.maximize),
      color: IFediUiColorTheme.of(context).grey,
      onPressed: () {},
    );
  }
}

class _FediVideoPlayerToggleControlFullscreenPage extends StatelessWidget {
  const _FediVideoPlayerToggleControlFullscreenPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: fediUiColorTheme.black,
        child: const FediVideoPlayerWidget(),
      ),
    );
  }
}
