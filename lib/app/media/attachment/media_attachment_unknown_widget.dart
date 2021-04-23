import 'package:fedi/app/media/attachment/media_attachment_non_media_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaAttachmentUnknownWidget extends StatelessWidget {
  const MediaAttachmentUnknownWidget();

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IPleromaApiMediaAttachment>(context);

    return InkWell(
      onTap: () {
        UrlHelper.handleUrlClick(
          context: context,
          url: mediaAttachment.url,
        );
      },
      child: const Padding(
        padding: FediPadding.allSmallPadding,
        child: MediaAttachmentNonMediaWidget(
          actionsWidget: null,
        ),
      ),
    );
  }
}
