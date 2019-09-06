import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class CellVideoPlayer extends StatefulWidget {
  final String url;

  CellVideoPlayer(this.url);

  @override
  _CellVideoPlayer createState() => _CellVideoPlayer();
}

class _CellVideoPlayer extends State<CellVideoPlayer> {
  VideoPlayerController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
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