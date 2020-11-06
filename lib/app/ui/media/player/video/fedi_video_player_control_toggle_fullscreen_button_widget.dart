import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

class FediVideoPlayerToggleControlFullscreenButtonWidget
    extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    var mediaPlayerBloc = videoMediaPlayerBloc;
    return StreamBuilder<bool>(
        stream: mediaPlayerBloc.isInitializedStream,
        builder: (context, snapshot) {
          var isInitialized = snapshot.data ?? false;

          if (isInitialized && mediaPlayerBloc.isFullScreenSupportEnabled) {
            return const _FediVideoPlayerToggleControlFullscreenButtonInitializedWidget();
          } else {
            return const _FediVideoPlayerToggleControlFullscreenButtonNotInitializedWidget();
          }
        });
  }

  const FediVideoPlayerToggleControlFullscreenButtonWidget();
}

class _FediVideoPlayerToggleControlFullscreenButtonInitializedWidget
    extends StatelessWidget {
  const _FediVideoPlayerToggleControlFullscreenButtonInitializedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var videoMediaPlayerBloc = IVideoMediaPlayerBloc.of(context);

    var mediaPlayerBloc = videoMediaPlayerBloc;
    return StreamBuilder<bool>(
        stream: mediaPlayerBloc.isFullscreenStream,
        builder: (context, snapshot) {
          var isFullscreen = snapshot.data ?? false;

          return AsyncOperationButtonBuilderWidget(
            builder: (BuildContext context, void Function() onPressed) {
              return FediIconButton(
                icon: Icon(
                    isFullscreen ? FediIcons.minimize : FediIcons.maximize),
                color: IFediUiColorTheme.of(context).white,
                onPressed: onPressed,
              );
            },
            asyncButtonAction: () async {
              if (mediaPlayerBloc.isFullscreen) {
                Navigator.of(context, rootNavigator: true).pop();
              } else {
                unawaited(pushFullScreenPage(context, videoMediaPlayerBloc));
              }
              return mediaPlayerBloc.toggleFullscreen();
            },
          );
        });
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
        builder: (BuildContext context, Widget child) {
          return Provider<IMediaPlayerBloc>.value(
            value: videoMediaPlayerBloc,
            child: Provider<IVideoMediaPlayerBloc>.value(
              value: videoMediaPlayerBloc,
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
  await videoMediaPlayerBloc.exitFullscreen();

  // The wakelock plugins checks whether it needs to perform an action internally,
  // so we do not need to check Wakelock.isEnabled.
  await Wakelock.disable();

  await SystemChrome.setEnabledSystemUIOverlays(
      videoMediaPlayerBloc.systemOverlaysAfterFullScreen);
  await SystemChrome.setPreferredOrientations(
      videoMediaPlayerBloc.deviceOrientationsAfterFullScreen);
}

class _FediVideoPlayerToggleControlFullscreenButtonNotInitializedWidget
    extends StatelessWidget {
  const _FediVideoPlayerToggleControlFullscreenButtonNotInitializedWidget({
    Key key,
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.center,
        color: fediUiColorTheme.black,
        child: FediVideoPlayerWidget(),
      ),
    );
  }
}
