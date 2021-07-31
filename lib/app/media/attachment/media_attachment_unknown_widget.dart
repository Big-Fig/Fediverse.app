import 'package:fedi/app/media/attachment/media_attachment_non_media_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
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
