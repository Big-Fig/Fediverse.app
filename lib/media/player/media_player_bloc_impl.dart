import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

final _logger = Logger("media_player_bloc_impl.dart");

class MediaPlayerBloc extends AsyncInitLoadingBloc implements IMediaPlayerBloc {
  @override
  VideoPlayerController videoPlayerController;

  final MediaPlayerSource mediaPlayerSource;

  final BehaviorSubject<VideoPlayerValue> videoPlayerValueSubject =
      BehaviorSubject();

  VideoPlayerValue get videoPlayerValue => videoPlayerValueSubject.value;

  Stream<VideoPlayerValue> get videoPlayerValueStream =>
      videoPlayerValueSubject.stream;

  BehaviorSubject<bool> isBufferingSubject = BehaviorSubject.seeded(false);

  @override
  bool get isBuffering => isBufferingSubject.value;

  @override
  Stream<bool> get isBufferingStream => isBufferingSubject.stream;

  @override
  MediaPlayerState get playerState => playerStateSubject.value;

  @override
  Stream<MediaPlayerState> get playerStateStream => playerStateSubject.stream;

  BehaviorSubject<MediaPlayerState> playerStateSubject =
      BehaviorSubject.seeded(MediaPlayerState.notInitialized);

  Disposable videoPlayerDisposable;
  @override
  dynamic error;

  @override
  StackTrace stackTrace;

  MediaPlayerBloc({
    @required this.mediaPlayerSource,
  }) {
    addDisposable(subject: playerStateSubject);
    addDisposable(subject: videoPlayerValueSubject);
    addDisposable(subject: isBufferingSubject);
  }

  @override
  void dispose() {
    playerStateSubject.add(MediaPlayerState.disposed);
    super.dispose();
    videoPlayerDisposable?.dispose();
  }

  @override
  Future internalAsyncInit() async {
    await _actualInit();
  }

  Future _actualInit() async {
    playerStateSubject.add(MediaPlayerState.initializing);

    VideoPlayerController videoPlayerController;
    var type = mediaPlayerSource.type;
    switch (type) {
      case MediaPlayerSourceType.asset:
        videoPlayerController = VideoPlayerController.asset(
          mediaPlayerSource.assetPath,
          package: mediaPlayerSource.assetPackage,
        );
        break;
      case MediaPlayerSourceType.file:
        videoPlayerController = VideoPlayerController.file(
          mediaPlayerSource.file,
        );
        break;
      case MediaPlayerSourceType.network:
        videoPlayerController = VideoPlayerController.network(
          mediaPlayerSource.networkUrl,
        );
        break;
      default:
        throw "Not supported type $type";
    }

    var positionChangedLastDateTime = DateTime.now();

    var listener = () {
      var oldVideoPlayerValue = this.videoPlayerValue;
      var videoPlayerValue = videoPlayerController.value;
      if (videoPlayerValue?.hasError == true) {
        if (error == null && videoPlayerValue.errorDescription != null) {
          error == videoPlayerValue.errorDescription;
        }
        if (playerState != MediaPlayerState.error) {
          playerStateSubject.add(MediaPlayerState.error);
        }
      }
      // _logger.finest(() => "videoPlayerController.value ${videoPlayerValue}");
      videoPlayerValueSubject.add(videoPlayerValue);

      if (videoPlayerValue.duration == videoPlayerValue.position) {
        playerStateSubject.add(MediaPlayerState.finished);
      }

      if (videoPlayerValue != null) {
        if (videoPlayerValue.isBuffering) {
          isBufferingSubject.add(true);
        } else {
          // below lines is hack
          // actually videoPlayerValue.isBuffering is always false
          // in almost all cases
          // so we should detect buffering on our side
          if (isPlaying) {
            var continuesPlaying = oldVideoPlayerValue?.isPlaying == true;
            var positionChanged =
                oldVideoPlayerValue?.position != videoPlayerValue.position;

            if (positionChanged) {
              positionChangedLastDateTime = DateTime.now();
            }

            var now = DateTime.now();
            if (continuesPlaying &&
                now.difference(positionChangedLastDateTime).abs() >
                    Duration(seconds: 1)) {
              isBufferingSubject.add(true);
            } else {
              isBufferingSubject.add(false);
            }
          } else {
            isBufferingSubject.add(false);
          }
        }
      } else {
        // not initialized = not buffering
        isBufferingSubject.add(false);
      }
    };

    videoPlayerController.addListener(listener);

    // dispose old init if it is exist
    videoPlayerDisposable?.dispose();

    videoPlayerDisposable = CompositeDisposable([
      CustomDisposable(() {
        videoPlayerController.removeListener(listener);
        videoPlayerController.dispose();
      }),
    ]);

    try {
      await videoPlayerController.initialize();

      this.videoPlayerController = videoPlayerController;

      playerStateSubject.add(MediaPlayerState.initialized);
    } catch (error, stackTrace) {
      this.error = error;
      this.stackTrace = stackTrace;
      _logger.warning(
          () => "failed to init videoPlayerController", error, stackTrace);

      playerStateSubject.add(MediaPlayerState.error);
    }
  }

  @override
  Duration get positionDuration => videoPlayerValue?.position;

  @override
  Stream<Duration> get positionDurationStream => videoPlayerValueStream.map(
        (videoPlayerValue) => videoPlayerValue?.position,
      );

  @override
  Duration get lengthDuration => videoPlayerValue?.duration;

  @override
  Stream<Duration> get lengthDurationStream => videoPlayerValueStream.map(
        (videoPlayerValue) => videoPlayerValue?.duration,
      );

  @override
  double get currentPlaybackPercent {
    if (positionDuration != null && lengthDuration != null) {
      return positionDuration.inMicroseconds / lengthDuration.inMicroseconds;
    } else {
      return null;
    }
  }

  @override
  Stream<double> get currentPlaybackPercentStream =>
      positionDurationStream.map((currentPlaybackPercent) =>
          currentPlaybackPercent.inMicroseconds /
          lengthDuration.inMicroseconds);

  @override
  Future play() async {
    if (!isInitialized) {
      await performAsyncInit();
    }
    assert(isInitialized);
    try {
      if (playerState == MediaPlayerState.finished) {
        await videoPlayerController.seekTo(Duration(seconds: 0));
      }
      await videoPlayerController.play();

      playerStateSubject.add(MediaPlayerState.playing);
    } catch (error, stackTrace) {
      this.error = error;
      this.stackTrace = stackTrace;
      _logger.warning(
          () => "failed to init videoPlayerController", error, stackTrace);

      playerStateSubject.add(MediaPlayerState.error);
    }
  }

  @override
  Future pause() async {
    await videoPlayerController.pause();

    assert(isInitialized);
    assert(isPlaying);
    try {
      await videoPlayerController.pause();

      playerStateSubject.add(MediaPlayerState.paused);
    } catch (error, stackTrace) {
      this.error = error;
      this.stackTrace = stackTrace;
      _logger.warning(
          () => "failed to init videoPlayerController", error, stackTrace);

      playerStateSubject.add(MediaPlayerState.error);
    }
  }

  @override
  Future mute() async {
    await videoPlayerController.setVolume(0.0);
  }

  @override
  Future unMute() async {
    await videoPlayerController.setVolume(1.0);
  }

  @override
  bool get isMuted => !(videoPlayerValue.volume > 0);

  @override
  Stream<bool> get isMutedStream => videoPlayerValueStream.map(
        (videoPlayerValue) => !(videoPlayerValue.volume > 0),
      );

  @override
  Future seekToDuration(Duration position) async {
    await videoPlayerController.seekTo(position);
  }

  @override
  Future seekToPercent(double percent) async {
    assert(percent >= 0.0 && percent <= 1.0);
    await seekToDuration(lengthDuration * percent);
  }

  @override
  Future reloadAfterError() async {
    await _actualInit();
  }
}
