import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/app/image/image_view_page.dart';
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
                builder: (context) => ImageViewPage(networkImage.image)),
          );
        },
        child: CachedNetworkImage(
          imageUrl: attachment.url,
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
