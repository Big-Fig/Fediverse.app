import 'package:fedi/app/media/attachment/media_attachment_audio_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_image_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_unknown_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_video_widget.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _maxHeight = 350.0;

class MediaAttachmentWidget extends StatelessWidget {
  const MediaAttachmentWidget();

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IPleromaMediaAttachment>(context);
    switch (mediaAttachment.typeAsMastodonApi) {
      case MastodonApiMediaAttachmentType.image:
        return const MediaAttachmentImageWidget(
          maxHeight: _maxHeight,
        );
      case MastodonApiMediaAttachmentType.video:
      case MastodonApiMediaAttachmentType.gifv:
        return const MediaAttachmentVideoWidget();
      case MastodonApiMediaAttachmentType.audio:
        return const MediaAttachmentAudioWidget();
      case MastodonApiMediaAttachmentType.unknown:
      default:
        return const MediaAttachmentUnknownWidget();
    }
  }
}
