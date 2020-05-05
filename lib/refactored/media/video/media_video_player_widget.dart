import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class MediaVideoPlayerWidget extends StatefulWidget {
  final File localFile;
  final String networkUrl;

  MediaVideoPlayerWidget.localFile({@required this.localFile})
      : networkUrl = null {
    assert(localFile != null);
  }

  MediaVideoPlayerWidget.network({@required this.networkUrl})
      : localFile = null {
    assert(networkUrl != null);
  }

  @override
  _MediaVideoPlayerWidgetState createState() => _MediaVideoPlayerWidgetState();
}

class _MediaVideoPlayerWidgetState extends State<MediaVideoPlayerWidget> {
  VideoPlayerController _controller;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    if (widget.networkUrl != null) {
      _controller = VideoPlayerController.network(widget.networkUrl);
    } else {
      _controller = VideoPlayerController.file(widget.localFile);
    }

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {
        _controller.setVolume(0);

        chewieController = ChewieController(
          aspectRatio: _controller.value.aspectRatio,
          videoPlayerController: _controller,
          autoPlay: false,
          looping: true,
        );

        _controller.pause();
      });
    });
    _controller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
