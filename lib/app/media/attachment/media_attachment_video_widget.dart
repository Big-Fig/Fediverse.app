import 'package:fedi/media/media_video_player_widget.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';

class MediaAttachmentVideoWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentVideoWidget(this.mediaAttachment);

  @override
  Widget build(BuildContext context) {
    return MediaVideoPlayerWidget.network(networkUrl: mediaAttachment.url);
  }
}
