import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/media/attachment/preview/media_attachment_preview_page.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusMediaAttachmentImageWidget extends StatelessWidget {
  final IPleromaMediaAttachment attachment;

  StatusMediaAttachmentImageWidget(this.attachment);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var networkImage = Image.network(
            attachment.url,
            height: 15.0,
            width: 15.0,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MediaAttachmentPreviewPage(
                      attachment: attachment,
                    )),
          );
        },
        child: CachedNetworkImage(
          imageUrl: attachment.previewUrl,
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
