import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/status/deleted/status_deleted_overlay_widget.dart';
import 'package:fedi/app/status/sensitive/nsfw/status_sensitive_nsfw_warning_overlay_widget.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_model.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('status_list_item_media_widget.dart');

class StatusListItemMediaWidget extends StatelessWidget {
  const StatusListItemMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    var statusSensitiveBloc = IStatusSensitiveBloc.of(context);

    _logger.finest(
      () => 'build ${statusBloc.remoteId} '
          'media ${statusBloc.reblogOrOriginalMediaAttachments?.length}',
    );

    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);
    var previewUrl = mediaAttachment.previewUrl!;

    var child = Provider<String>.value(
      value: previewUrl,
      child: const _StatusListItemMediaWidgetPreviewUrl(),
    );
    var body = StreamBuilder<StatusSensitiveWarningState>(
      stream: statusSensitiveBloc.statusWarningStateStream.distinct(),
      builder: (context, snapshot) {
        var statusWarningState =
            snapshot.data ?? statusSensitiveBloc.statusWarningState;

        var nsfwSensitiveAndDisplayNsfwContentEnabled =
            !statusWarningState.nsfwSensitive ||
                statusWarningState.displayEnabled;

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

    return StreamBuilder<bool>(
      stream: statusBloc.deletedStream.distinct(),
      builder: (context, snapshot) {
        var deleted = snapshot.data ?? false;

        if (deleted) {
          return Stack(
            children: [
              body,
              const Positioned.fill(
                child: StatusDeletedOverlayWidget(),
              ),
            ],
          );
        } else {
          return body;
        }
      },
    );
  }
}

class _StatusListItemMediaWidgetPreviewUrl extends StatelessWidget {
  const _StatusListItemMediaWidgetPreviewUrl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var previewUrl = Provider.of<String>(context);

    return Container(
      // todo: refactor
      // ignore: no-magic-number
      color: fediUiColorTheme.black.withOpacity(0.2),
      child: SizedBox.expand(
        child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
          fit: BoxFit.cover,
          imageUrl: previewUrl,
          placeholder: (context, url) => const Center(
            child: FediCircularProgressIndicator(),
          ),
          width: MediaQuery.of(context).size.width,
          errorWidget: (context, url, dynamic error) =>
              const Icon(FediIcons.warning),
        ),
      ),
    );
  }
}
