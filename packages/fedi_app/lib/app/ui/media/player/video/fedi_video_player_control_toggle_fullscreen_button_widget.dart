import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:wakelock/wakelock.dart';

final _logger =
    Logger('fedi_video_player_control_toggle_fullscreen_button_widget.dart');

class FediVideoPlayerToggleControlFullscreenButtonWidget
    extends StatelessWidget {
  const FediVideoPlayerToggleControlFullscreenButtonWidget({Key? key})
      : super(key: key);

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
    _logger.finest(() => 'onClick isFullscreen $isFullscreen');

    return FediIconButton(
      icon: Icon(isFullscreen ? FediIcons.minimize : FediIcons.maximize),
      color: IFediUiColorTheme.of(context).white,
      onPressed: () {
        if (isFullscreen) {
          Navigator.of(context, rootNavigator: true).pop();
        } else {
          // ignore: unawaited_futures
          pushFullScreenPage(context, videoMediaPlayerBloc);
        }
      },
    );
  }
}

Future<void> pushFullScreenPage(
  BuildContext context,
  IVideoMediaPlayerBloc videoMediaPlayerBloc,
) async {
  final isAndroid = Theme.of(context).platform == TargetPlatform.android;
  final TransitionRoute route = PageRouteBuilder<void>(
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) =>
          DisposableProvider<IVideoMediaPlayerBloc>(
        create: (context) => VideoMediaPlayerBloc(
          mediaPlayerSource: videoMediaPlayerBloc.mediaPlayerSource,
          desiredAspectRatio: videoMediaPlayerBloc.desiredAspectRatio,
          isFullScreenSupportEnabled:
              videoMediaPlayerBloc.isFullScreenSupportEnabled,
          autoInit: videoMediaPlayerBloc.autoInit,
          autoPlay: videoMediaPlayerBloc.autoPlay,
          isFullscreen: true,
        ),
        child: const VideoMediaPlayerBlocProxyProvider(
          child: _FediVideoPlayerToggleControlFullscreenPage(),
        ),
      ),
    ),
  );

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  if (isAndroid) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  if (!videoMediaPlayerBloc.isNeedEnableWakelockOnFullScreen) {
    await Wakelock.enable();
  }

  await Navigator.of(context, rootNavigator: true).push<void>(route);

  // The wakelock plugins checks whether it needs to perform an action internally,
  // so we do not need to check Wakelock.isEnabled.
  await Wakelock.disable();

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: videoMediaPlayerBloc.systemOverlaysAfterFullScreen,
  );
  await SystemChrome.setPreferredOrientations(
    videoMediaPlayerBloc.deviceOrientationsAfterFullScreen,
  );
}

class _FediVideoPlayerToggleControlFullscreenButtonDisabledWidget
    extends StatelessWidget {
  const _FediVideoPlayerToggleControlFullscreenButtonDisabledWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        icon: const Icon(FediIcons.maximize),
        color: IFediUiColorTheme.of(context).grey,
        onPressed: null,
      );
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
