import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Statuses/ImageViewPage.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Views/VideoPlayer.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusListItemMediaWidget extends StatusWidget {
  StatusListItemMediaWidget({@required IStatus initialStatusData})
      : super(initialStatusData: initialStatusData);

  @override
  Widget buildStatusWidget(BuildContext context, IStatus status) =>
      getMediaWidget(context, status.mediaAttachments);

  Widget getMediaWidget(
      BuildContext context, List<IPleromaMediaAttachment> mediaAttachments) {
    List<Widget> items = mediaAttachments.map((attachment) {
      Widget item;

      switch (attachment.type) {
        case "image":
          item = buildImagePreviewWidget(context, attachment);
          break;
        case "video":
        case "audio":
          item = CellVideoPlayer(
            attachment.url,
          );
          break;
      }

      if (item != null) {
        item = Text(AppLocalizations.of(context)
            .tr("status.media.preview.not_supported"));
      }

      return item;
    }).toList();

    var deviceWidth = MediaQuery.of(context).size.width;
    var targetHeight = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return LimitedBox(
      maxWidth: deviceWidth,
      maxHeight: targetHeight,
      child: Carousel(
        animationDuration: Duration(seconds: 0),
        overlayShadowColors: Colors.transparent,
        overlayShadowSize: 0.0,
        images: items,
        dotIncreasedColor: items.length == 1 ? Colors.transparent : Colors.blue,
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: items.length == 1
            ? Colors.transparent
            : Colors.blue.withOpacity(0.5),
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
        borderRadius: true,
        autoplay: false,
      ),
    );
  }

  Widget buildImagePreviewWidget(
      BuildContext context, IPleromaMediaAttachment attachment) {
    var image = CachedNetworkImage(
      imageUrl: attachment.url,
      placeholder: (context, url) => Center(
        child: Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );

    var imageProvider = Image.network(
      attachment.url,
      height: 15.0,
      width: 15.0,
    );
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageViewPage(imageProvider.image)),
          );
        },
        child: image);
  }

  Container mediaAttachmentPreviewUrlWidget(
      String previewUrl, BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: SizedBox.expand(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: previewUrl,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          width: MediaQuery.of(context).size.width,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
