import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/status/nsfw/status_nsfw_warning_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
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
          placeholder: (context, url) => const Center(
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
            var mediaAttachment = mediaAttachments.first;
            var previewUrl = mediaAttachment.previewUrl;
            return StreamBuilder<bool>(
                stream: statusBloc.nsfwSensitiveAndDisplayEnabledStream,
                initialData: statusBloc.nsfwSensitiveAndDisplayEnabled,
                builder: (context, snapshot) {
                  var nsfwSensitiveAndDisplayEnabled = snapshot.data;

                  if (nsfwSensitiveAndDisplayEnabled) {
                    // todo: display all medias in list
                    return mediaAttachmentPreviewUrlWidget(previewUrl, context);
                  } else {
                    return StatusNsfwWarningWidget();
                  }
                });
          } else {
            // TODO: remove hack
            return const SizedBox.shrink();
          }
        });
  }
}
