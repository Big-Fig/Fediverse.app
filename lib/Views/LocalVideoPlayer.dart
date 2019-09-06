import 'dart:io';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class LocalVideoPlayer extends StatefulWidget {
  final String url;
  final File file;
  LocalVideoPlayer({this.url, this.file});

  @override
  _LocalVideoPlayer createState() => _LocalVideoPlayer();
}

class _LocalVideoPlayer extends State<LocalVideoPlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    File file;

    if (widget.url != null) {
      file = File(widget.url);
    } else {
      file = widget.file;
    }

    _controller = VideoPlayerController.file(file)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.setVolume(0);
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     setState(() {
    //       _controller.value.isPlaying
    //           ? _controller.pause()
    //           : _controller.play();
    //     });
    //   },
    //   child: Icon(
    //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //   ),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
