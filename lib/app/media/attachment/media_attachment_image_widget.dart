import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/media/attachment/preview/media_attachment_preview_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaAttachmentImageWidget extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;
  final double maxHeight;

  const MediaAttachmentImageWidget(this.mediaAttachment, {this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          goToMediaAttachmentPreviewPage(context,
              mediaAttachment: mediaAttachment);
        },
        child: Container(
          color: FediColors.ultraLightGrey,
          child: CachedNetworkImage(
            imageUrl: mediaAttachment.previewUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Padding(
              padding: FediPadding.allBigPadding,
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  child: FediCircularProgressIndicator(),
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) {
              if (maxHeight != null) {
                return LimitedBox(
                  maxHeight: maxHeight,
                  child: Image(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                );
              } else {
                return Image(
                  fit: BoxFit.cover,
                  image: imageProvider,
                );
              }
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ));
  }
}
