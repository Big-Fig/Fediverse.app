import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusListItemMediaWidget extends StatusWidget {
  StatusListItemMediaWidget({@required IStatus initialStatusData}) : super
      (initialStatusData:initialStatusData);

  @override
  Widget buildStatusWidget(BuildContext context, IStatus status) {
    var mediaAttachment = status.mediaAttachments[0];
    var previewUrl = mediaAttachment.previewUrl;
    return mediaAttachmentPreviewUrlWidget(previewUrl, context);
  }

  Container mediaAttachmentPreviewUrlWidget(String previewUrl, BuildContext context) {
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
