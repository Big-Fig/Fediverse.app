import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/media/attachment/preview/media_attachment_preview_page.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusMediaAttachmentImageWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  StatusMediaAttachmentImageWidget(this.mediaAttachment);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          goToMediaAttachmentPreviewPage(context, mediaAttachment: mediaAttachment);
        },
        child: CachedNetworkImage(
          imageUrl: mediaAttachment.previewUrl,
          placeholder: (context, url) => Center(
            child: Container(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ));
  }
}
