import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class GalleryPreview extends StatefulWidget {
  final ValueNotifier<AssetEntity> data;
  GalleryPreview(this.data);

  @override
  State<StatefulWidget> createState() {
    return _GalleryPreview();
  }
}

class _GalleryPreview extends State<GalleryPreview> {
  VideoPlayerController _videoController;

  File videoFile;

  @override
  initState() {
    super.initState();
    // Call setState when the ValueNotifier changes
    widget.data.addListener(didValueChange);
  }

  // Wrap setState in a function so the listener can be disposed
  didValueChange() async {
    if (_videoController != null) {
      _videoController.pause();
      _videoController = null;
    }
    if (widget.data.value.type == AssetType.video) {
      widget.data.value.file.then((file) {
        videoFile = file;

        _videoController = VideoPlayerController.file(videoFile)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {
              _videoController.setLooping(true);
              _videoController.play();
            });
          });
      });
    } else {
      setState(() {});
    }
  }

  Image oldImage;

  @override
  Widget build(BuildContext context) {
    return widget.data.value == null ? _buildLoading() : _buildItem();
  }

  Widget _buildLoading() {
    // if (oldImage != null) {
    //   return Center(
    //     child: oldImage,
    //   );
    // }

    return Center(
      child: Text('loading...'),
    );
  }

  Widget _buildItem() {
    if (widget.data.value.type == AssetType.video) {
      if (videoFile == null) {
        return _buildLoading();
      }

      return Center(
          child: AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: VideoPlayer(_videoController),
      ));
    } else {
      return FutureBuilder(
        future: widget.data.value.thumbDataWithSize(400, 400),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            oldImage = Image.memory(snapshot.data);
            return Center(
              child: Image.memory(
                snapshot.data,
              ),
            );
          }
          return _buildLoading();
        },
      );
    }
  }
}
