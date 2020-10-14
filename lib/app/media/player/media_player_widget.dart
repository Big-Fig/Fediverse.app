import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/player/media_player_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:video_player/video_player.dart';

var _logger = Logger("media_player_widget.dart");

abstract class MediaPlayerWidget<T> extends StatefulWidget {
  final File localFile;
  final String networkUrl;

  String get pathToFile => networkUrl ?? localFile.path;

  MediaPlayerWidget.localFile({@required this.localFile}) : networkUrl = null {
    assert(localFile != null);
  }

  MediaPlayerWidget.network({@required this.networkUrl}) : localFile = null {
    assert(networkUrl != null);
  }

  @override
  _MediaPlayerWidgetState<T> createState() => _MediaPlayerWidgetState<T>();

  T createDisplayController(VideoPlayerController videoPlayerController);

  Widget buildDisplayWidget(BuildContext context, T displayController);

  void dispose(T displayController);
}

class _MediaPlayerWidgetState<T> extends State<MediaPlayerWidget<T>> {
  VideoPlayerController _videoPlayerController;
  T _displayController;

  MediaPlayerState mediaPlayerState = MediaPlayerState.initializing;

  @override
  void initState() {
    super.initState();

    if (widget.networkUrl != null) {
      _videoPlayerController = VideoPlayerController.network(widget.networkUrl);
    } else {
      _videoPlayerController = VideoPlayerController.file(widget.localFile);
    }

    _videoPlayerController.initialize().then((_) {
      _displayController =
          widget.createDisplayController(_videoPlayerController);
      setState(() {
        mediaPlayerState = MediaPlayerState.initialized;
      });
    }).catchError((error, stackTrace) {
      _logger.warning(
          () => "failed to init ${widget.pathToFile}", error, stackTrace);
      setState(() {
        mediaPlayerState = MediaPlayerState.failedToInitialize;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var filename = p.basename(widget.pathToFile ?? "") ?? "";
    switch (mediaPlayerState) {
      case MediaPlayerState.initializing:
        return Padding(
          padding: FediPadding.allSmallPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: FediPadding.allSmallPadding,
                child: FediCircularProgressIndicator(),
              ),
              Text(
                  "media.player.initializing".tr(
                    args: [filename],
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
        );
        break;
      case MediaPlayerState.initialized:
        return widget.buildDisplayWidget(context, _displayController);
        break;
      case MediaPlayerState.failedToInitialize:
        return Padding(
          padding: FediPadding.allSmallPadding,
          child: Text(
            "media.player.failed".tr(args: [filename]),
            textAlign: TextAlign.center,
          ),
        );
        break;
    }

    throw "invalid mediaPlayerState $mediaPlayerState";
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    widget.dispose(_displayController);
    super.dispose();
  }
}
