import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_list_item_media_widget.dart");

class StatusListItemMediaWidget extends StatelessWidget {
  StatusListItemMediaWidget() : super();

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

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    _logger.finest(() =>
        "build ${statusBloc.remoteId} media ${statusBloc.mediaAttachments?.length}");

    return StreamBuilder<List<IPleromaMediaAttachment>>(
        stream: statusBloc.mediaAttachmentsStream,
        initialData: statusBloc.mediaAttachments,
        builder: (context, snapshot) {
          var mediaAttachments = snapshot.data;

          if (mediaAttachments?.isNotEmpty == true) {
            // todo: display all medias in list
            var mediaAttachment = mediaAttachments.first;
            var previewUrl = mediaAttachment.previewUrl;
            return mediaAttachmentPreviewUrlWidget(previewUrl, context);
          } else {
            // TODO: remove hack
            return SizedBox.shrink();
          }
        });
  }
}
