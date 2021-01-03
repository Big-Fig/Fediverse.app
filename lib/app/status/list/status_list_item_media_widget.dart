import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/status/deleted/status_deleted_overlay_widget.dart';
import 'package:fedi/app/status/sensitive/nsfw/status_sensitive_nsfw_warning_overlay_widget.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_model.dart';
import 'package:fedi/app/status/status_bloc.dart';
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
  const StatusListItemMediaWidget() : super();

  Container mediaAttachmentPreviewUrlWidget(
      String previewUrl, BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Container(
      color: fediUiColorTheme.black.withOpacity(0.2),
      child: SizedBox.expand(
        child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
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
    var statusBloc = IStatusBloc.of(context);
    var statusSensitiveBloc = IStatusSensitiveBloc.of(context);

    _logger.finest(() =>
        "build ${statusBloc.remoteId} media ${statusBloc.mediaAttachments?.length}");

    var mediaAttachment = Provider.of<IPleromaMediaAttachment>(context);
    var previewUrl = mediaAttachment.previewUrl;

    var child = mediaAttachmentPreviewUrlWidget(previewUrl, context);
    var body = buildBody(
      child: child,
      statusBloc: statusBloc,
      statusSensitiveBloc: statusSensitiveBloc,
    );
    return StreamBuilder<bool>(
      stream: statusBloc.deletedStream.distinct(),
      builder: (context, snapshot) {
        var deleted = snapshot.data ?? false;

        if (deleted == true) {
          return Stack(
            children: [
              body,
              Positioned.fill(
                child: const StatusDeletedOverlayWidget(),
              ),
            ],
          );
        } else {
          return body;
        }
      },
    );
  }

  Widget buildBody({
    @required Widget child,
    @required IStatusBloc statusBloc,
    @required IStatusSensitiveBloc statusSensitiveBloc,
  }) {
    return StreamBuilder<StatusSensitiveWarningState>(
      stream: statusSensitiveBloc.statusWarningStateStream.distinct(),
      builder: (context, snapshot) {
        var statusWarningState = snapshot.data;

        if (statusWarningState == null) {
          return child;
        }

        var nsfwSensitiveAndDisplayNsfwContentEnabled =
            statusWarningState.nsfwSensitive != true ||
                statusWarningState.displayEnabled == true;

        if (nsfwSensitiveAndDisplayNsfwContentEnabled) {
          // todo: display all medias in list
          return child;
        } else {
          return StatusSensitiveNsfwWarningOverlayWidget(
            child: child,
          );
        }
      },
    );
  }
}
