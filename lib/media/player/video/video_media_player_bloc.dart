import 'package:fedi/media/player/media_player_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IVideoMediaPlayerBloc implements IMediaPlayerBloc {
  static IVideoMediaPlayerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IVideoMediaPlayerBloc>(context, listen: listen);

  bool get isNeedEnableWakelockOnFullScreen;

  List<SystemUiOverlay> get systemOverlaysAfterFullScreen;

  List<DeviceOrientation> get deviceOrientationsAfterFullScreen;

  double get desiredAspectRatio;

  bool get isFullScreenSupportEnabled;

  bool get isFullscreen;

  Stream<bool> get isFullscreenStream;

  bool get isControlsVisible;

  Stream<bool> get isControlsVisibleStream;

  Future enterFullscreen();

  Future exitFullscreen();

  void onTapOnVideo();


}

extension IVideoMediaPlayerBlocExtension on IVideoMediaPlayerBloc {
  Future toggleFullscreen() async {
    if (isFullscreen) {
      await exitFullscreen();
    } else {
      await enterFullscreen();
    }
  }
}
