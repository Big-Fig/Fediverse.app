import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/media/player/media_player_bloc.dart';
import 'package:fedi_app/media/player/media_player_bloc_impl.dart';
import 'package:fedi_app/media/player/media_player_model.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc.dart';
import 'package:fedi_app/media/player/video/video_media_player_bloc_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

// ignore: no-magic-number
const _durationToHideControlsDuringPlaying = Duration(seconds: 3);

class VideoMediaPlayerBloc extends MediaPlayerBloc
    implements IVideoMediaPlayerBloc {
  @override
  final double desiredAspectRatio;

  @override
  double? get actualAspectRatio => videoPlayerController?.value.aspectRatio;

  @override
  final bool isFullScreenSupportEnabled;
  @override
  final bool isNeedEnableWakelockOnFullScreen;
  @override
  final List<SystemUiOverlay> systemOverlaysAfterFullScreen;
  @override
  final List<DeviceOrientation> deviceOrientationsAfterFullScreen;

  BehaviorSubject<DateTime> lastIterationDateTimeSubject =
      BehaviorSubject.seeded(DateTime.now());

  Stream<DateTime> get lastIterationDateTimeStream =>
      lastIterationDateTimeSubject.stream;

  DateTime? get lastIterationDateTime =>
      lastIterationDateTimeSubject.valueOrNull;

  VideoMediaPlayerBloc({
    required MediaPlayerSource mediaPlayerSource,
    required this.desiredAspectRatio,
    required this.isFullScreenSupportEnabled,
    required bool? autoInit,
    required bool? autoPlay,
    required this.isFullscreen,
    this.systemOverlaysAfterFullScreen = SystemUiOverlay.values,
    this.isNeedEnableWakelockOnFullScreen = true,
    this.deviceOrientationsAfterFullScreen = const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  }) : super(
          mediaPlayerSource: mediaPlayerSource,
          autoInit: autoInit,
          autoPlay: autoPlay,
        ) {
    lastIterationDateTimeSubject.disposeWith(this);
  }

  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static VideoMediaPlayerBloc createFromContext(
    BuildContext context, {
    required MediaPlayerSource mediaPlayerSource,
    required double desiredAspectRatio,
    bool isFullScreenSupportEnabled = true,
    required bool? autoInit,
    required bool? autoPlay,
    required bool isFullscreen,
  }) =>
      VideoMediaPlayerBloc(
        mediaPlayerSource: mediaPlayerSource,
        desiredAspectRatio: desiredAspectRatio,
        isFullScreenSupportEnabled: isFullScreenSupportEnabled,
        autoInit: autoInit,
        autoPlay: autoPlay,
        isFullscreen: isFullscreen,
      );

  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Widget provideToContext(
    BuildContext context, {
    required MediaPlayerSource mediaPlayerSource,
    required Widget child,
    required double desiredAspectRatio,
    bool isFullScreenSupportEnabled = true,
    required bool? autoInit,
    required bool? autoPlay,
    required bool isFullscreen,
  }) =>
      DisposableProvider<IVideoMediaPlayerBloc>(
        create: (context) => VideoMediaPlayerBloc.createFromContext(
          context,
          mediaPlayerSource: mediaPlayerSource,
          desiredAspectRatio: desiredAspectRatio,
          isFullScreenSupportEnabled: isFullScreenSupportEnabled,
          autoInit: autoInit,
          autoPlay: autoPlay,
          isFullscreen: isFullscreen,
        ),
        child: VideoMediaPlayerBlocProxyProvider(
          child: child,
        ),
      );

  static double calculateDefaultAspectRatio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return width > height ? width / height : height / width;
  }

  @override
  Future<void> pause() {
    _onNewIteration();

    return super.pause();
  }

  @override
  Future<void> play() {
    _onNewIteration();

    return super.play();
  }

  @override
  Future<void> mute() {
    _onNewIteration();

    return super.mute();
  }

  @override
  Future<void> unMute() {
    _onNewIteration();

    return super.unMute();
  }

  @override
  Future<void> seekToDuration(Duration position) {
    _onNewIteration();

    return super.seekToDuration(position);
  }

  @override
  Future<void> seekToPercent(double percent) {
    _onNewIteration();

    return super.seekToPercent(percent);
  }

  @override
  final bool isFullscreen;

  @override
  bool get isControlsVisible =>
      _calculateIsControlsVisible(lastIterationDateTime!, isPlaying);

  bool _calculateIsControlsVisible(
    DateTime lastIterationDateTime,
    bool isPlaying,
  ) {
    var diff = lastIterationDateTime.difference(DateTime.now()).abs();

    if (isPlaying && diff > _durationToHideControlsDuringPlaying) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Stream<bool> get isControlsVisibleStream => Rx.combineLatest3(
        lastIterationDateTimeStream, isPlayingStream, videoPlayerValueStream,
        // use videoPlayerValueStream just for regular updates
        // hack to avoid using Timer to update isControlsVisibleStream
        (
          DateTime lastIterationDateTime,
          bool isPlaying,
          VideoPlayerValue videoPlayerValue,
        ) =>
            _calculateIsControlsVisible(lastIterationDateTime, isPlaying),
      );

  @override
  void onTapOnVideo() {
    _onNewIteration();
  }

  void _onNewIteration() {
    lastIterationDateTimeSubject.add(DateTime.now());
  }
}
