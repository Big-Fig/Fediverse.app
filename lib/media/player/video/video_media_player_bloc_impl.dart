import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/media_player_bloc_impl.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

final _durationToHideControlsDuringPlaying = Duration(seconds: 3);

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

  DateTime? get lastIterationDateTime => lastIterationDateTimeSubject.value;

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
    addDisposable(subject: lastIterationDateTimeSubject);
  }

  static VideoMediaPlayerBloc createFromContext(
    BuildContext context, {
    required MediaPlayerSource mediaPlayerSource,
    required double desiredAspectRatio,
    bool isFullScreenSupportEnabled = true,
    required bool? autoInit,
    required bool? autoPlay,
    required bool isFullscreen,
  }) {
    return VideoMediaPlayerBloc(
      mediaPlayerSource: mediaPlayerSource,
      desiredAspectRatio: desiredAspectRatio,
      isFullScreenSupportEnabled: isFullScreenSupportEnabled,
      autoInit: autoInit,
      autoPlay: autoPlay,
      isFullscreen: isFullscreen,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required MediaPlayerSource mediaPlayerSource,
    required Widget child,
    required double desiredAspectRatio,
    bool isFullScreenSupportEnabled = true,
    required bool? autoInit,
    required bool? autoPlay,
    required bool isFullscreen,
  }) {
    return DisposableProvider<IVideoMediaPlayerBloc>(
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
  }

  static double calculateDefaultAspectRatio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return width > height ? width / height : height / width;
  }

  @override
  Future pause() {
    _onNewIteration();
    return super.pause();
  }

  @override
  Future play() {
    _onNewIteration();
    return super.play();
  }

  @override
  Future mute() {
    _onNewIteration();
    return super.mute();
  }

  @override
  Future unMute() {
    _onNewIteration();
    return super.unMute();
  }

  @override
  Future seekToDuration(Duration position) {
    _onNewIteration();
    return super.seekToDuration(position);
  }

  @override
  Future seekToPercent(double percent) {
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
          dynamic lastIterationDateTime,
          dynamic isPlaying,
          dynamic videoPlayerValue,
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
