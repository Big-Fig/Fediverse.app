import 'package:fedi/app/media/attachment/details/media_attachments_details_page.dart';
import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_widget.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_media_attachments_widget.dart");

class MediaAttachmentsWidget extends StatelessWidget {
  final List<IPleromaMediaAttachment> mediaAttachments;
  final IPleromaMediaAttachment initialMediaAttachment;

  const MediaAttachmentsWidget({
    @required this.mediaAttachments,
    @required this.initialMediaAttachment,
  });

  @override
  Widget build(BuildContext context) {
    if (mediaAttachments?.isNotEmpty == true) {
      return SizedBox(
        width: double.infinity,
        child: buildChildren(context, mediaAttachments),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildChildren(
      BuildContext context, List<IPleromaMediaAttachment> mediaAttachments) {
    _logger.finest(() => "buildChildren ${mediaAttachments?.length}");

    List<Widget> children = mediaAttachments.map(
      (IPleromaMediaAttachment mediaAttachment) {
        Widget child = MediaAttachmentWidget(
          mediaAttachment: mediaAttachment,
        );

        if (mediaAttachment.typeMastodon == MastodonMediaAttachmentType.image ||
            mediaAttachment.typeMastodon == MastodonMediaAttachmentType.gifv) {
          child = InkWell(
              onTap: () {
                goToMultiMediaAttachmentDetailsPage(context,
                    mediaAttachments: mediaAttachments,
                    initialMediaAttachment: mediaAttachment);
              },
              child: child);
        }
        return child;
      },
    ).toList();
    if (children.length == 1) {
      return children.first;
    } else {
      var initialPageIndex = 0;
      if (initialMediaAttachment != null) {
        initialPageIndex = mediaAttachments.indexOf(initialMediaAttachment);
        if (initialPageIndex == -1) {
          initialPageIndex = 0;
        }
      }
      return FediMediaCarouselWidget(
        initialPageIndex: initialPageIndex,
        children: children,
      );
    }
  }
}
