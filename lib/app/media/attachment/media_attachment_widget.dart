import 'package:fedi/app/media/attachment/media_attachment_audio_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_image_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_unknown_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_video_widget.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _maxHeight = 350.0;

class MediaAttachmentWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentWidget({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    switch (mediaAttachment.typeMastodon) {
      case MastodonMediaAttachmentType.image:
        return MediaAttachmentImageWidget(
          mediaAttachment,
          maxHeight: _maxHeight,
        );
        break;

      case MastodonMediaAttachmentType.video:
      case MastodonMediaAttachmentType.gifv:
        return MediaAttachmentVideoWidget(mediaAttachment);
      case MastodonMediaAttachmentType.audio:
        return MediaAttachmentAudioWidget(mediaAttachment);
        break;

      case MastodonMediaAttachmentType.unknown:
      default:
        return MediaAttachmentUnknownWidget(mediaAttachment);
        break;
    }
  }
}
