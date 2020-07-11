import 'package:fedi/app/media/player/media_audio_player_widget.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';

class MediaAttachmentAudioWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentAudioWidget(this.mediaAttachment);

  @override
  Widget build(BuildContext context) {
    return MediaAudioPlayerWidget.network(networkUrl: mediaAttachment.url);
  }
}
