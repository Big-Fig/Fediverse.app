import 'package:fedi/app/media/attachment/media_attachment_audio_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_image_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_unknown_widget.dart';
import 'package:fedi/app/media/attachment/media_attachment_video_widget.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _maxHeight = 350.0;

class MediaAttachmentWidget extends StatelessWidget {
  const MediaAttachmentWidget();

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IPleromaApiMediaAttachment>(context);
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
