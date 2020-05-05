import 'package:chewie/chewie.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// TODO: use MediaVideoPlayer class instead of copy-pasted code
class StatusMediaAttachmentVideoWidget extends StatefulWidget {
  final IPleromaMediaAttachment mediaAttachment;

  StatusMediaAttachmentVideoWidget(this.mediaAttachment);

  @override
  _StatusMediaAttachmentVideoWidget createState() =>
      _StatusMediaAttachmentVideoWidget();
}

class _StatusMediaAttachmentVideoWidget
    extends State<StatusMediaAttachmentVideoWidget> {
  VideoPlayerController _controller;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.mediaAttachment.url)
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
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return chewieController == null
        ? Container()
        : Center(
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
    _controller?.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}
