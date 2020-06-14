import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaAttachmentUnknownWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentUnknownWidget(this.mediaAttachment);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UrlHelper.handleUrlClick(context, mediaAttachment.url);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            mediaAttachment.description,
            style: TextStyle(color: FediColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
