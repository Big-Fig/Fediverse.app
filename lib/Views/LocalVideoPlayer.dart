import 'dart:io';

import 'package:chewie/chewie.dart';
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
  ChewieController chewieController;

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
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
