import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/status/deleted/status_deleted_overlay_widget.dart';
import 'package:fedi/app/status/nsfw/status_nsfw_warning_overlay_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_list_item_media_widget.dart");

class StatusListItemMediaWidget extends StatelessWidget {
  StatusListItemMediaWidget() : super();

  Container mediaAttachmentPreviewUrlWidget(
      String previewUrl, BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Container(
      color: fediUiColorTheme.black.withOpacity(0.2),
      child: SizedBox.expand(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: previewUrl,
          placeholder: (context, url) => const Center(
            child: FediCircularProgressIndicator(),
          ),
          width: MediaQuery.of(context).size.width,
          errorWidget: (context, url, error) => Icon(FediIcons.warning),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    _logger.finest(() =>
        "build ${statusBloc.remoteId} media ${statusBloc.mediaAttachments?.length}");

    var mediaAttachment = Provider.of<IPleromaMediaAttachment>(context);
    var previewUrl = mediaAttachment.previewUrl;
    return StreamBuilder<bool>(
        stream: statusBloc.deletedStream.distinct(),
        initialData: statusBloc.deleted,
        builder: (context, snapshot) {
          var deleted = snapshot.data;

          if (deleted == true) {
            return StatusDeletedOverlayWidget(
              child: buildBody(
                statusBloc,
                previewUrl,
              ),
            );
          } else {
            return buildBody(statusBloc, previewUrl);
          }
        });
  }

  Widget buildBody(IStatusBloc statusBloc, String previewUrl) {
    return StreamBuilder<StatusWarningState>(
        stream: statusBloc.statusWarningStateStream.distinct(),
        initialData: statusBloc.statusWarningState,
        builder: (context, snapshot) {
          var statusWarningState = snapshot.data;

          var nsfwSensitiveAndDisplayNsfwContentEnabled =
              statusWarningState.nsfwSensitive != true ||
                  statusWarningState.displayNsfwSensitive == true;

          var child = mediaAttachmentPreviewUrlWidget(previewUrl, context);
          if (nsfwSensitiveAndDisplayNsfwContentEnabled) {
            // todo: display all medias in list
            return child;
          } else {
            return StatusNsfwWarningOverlayWidget(
              child: child,
            );
          }
        });
  }
}
