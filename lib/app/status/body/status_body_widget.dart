import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_widget.dart';
import 'package:fedi/app/status/card/status_card_widget.dart';
import 'package:fedi/app/status/content/status_content_with_emojis_widget.dart';
import 'package:fedi/app/status/nsfw/status_nsfw_warning_widget.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_alert_widget.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _defaultPadding = FediPadding.horizontalBigPadding;

class StatusBodyWidget extends StatelessWidget {
  final bool collapsible;

  StatusBodyWidget({@required this.collapsible});

  @override
  Widget build(BuildContext context) {
    IStatusBloc statusBloc = IStatusBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabledStream,
        initialData: statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled,
        builder: (context, snapshot) {
          var nsfwSensitiveAndDisplayNsfwContentEnabled = snapshot.data;

          if (nsfwSensitiveAndDisplayNsfwContentEnabled) {
            return StreamBuilder<bool>(
                stream: statusBloc
                    .containsSpoilerAndDisplaySpoilerContentEnabledStream,
                initialData:
                    statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled,
                builder: (context, snapshot) {
                  var containsSpoilerAndDisplayEnabled = snapshot.data;

                  // todo: remove temp hack
                  var alreadyClickedShowContent = statusBloc.nsfwSensitive;
                  if (containsSpoilerAndDisplayEnabled ||
                      alreadyClickedShowContent) {
                    return buildStatusBodyWidget(statusBloc, context);
                  } else {
                    return buildSpoilerWithoutBodyWidget();
                  }
                });
          } else {
            return StatusNsfwWarningWidget();
          }
        });
  }

  Widget buildStatusBodyWidget(IStatusBloc statusBloc, BuildContext context) =>
      Column(
        children: <Widget>[
          Padding(
            padding: _defaultPadding,
            child: Column(
              children: [
                StatusSpoilerWidget(),
                collapsible
                    ? StatusContentWithEmojisWidget(
                        collapsible: true,
                      )
                    : StatusContentWithEmojisWidget(
                        collapsible: false,
                      ),
                if (collapsible && statusBloc.isPossibleToCollapse)
                  buildCollapsibleButton(context, statusBloc),
                StatusCardWidget(),
              ],
            ),
          ),
          if (statusBloc.poll != null)
            Provider<IPollBloc>.value(
              value: statusBloc.pollBloc,
              child: PollWidget(),
            ),
          StreamBuilder<List<IPleromaMediaAttachment>>(
              stream: statusBloc.mediaAttachmentsStream,
              initialData: statusBloc.mediaAttachments,
              builder: (context, snapshot) {
                var mediaAttachments = snapshot.data;

                if (mediaAttachments?.isNotEmpty == true) {
                  return Padding(
                    padding: FediPadding.verticalSmallPadding,
                    child: MediaAttachmentsWidget(
                      mediaAttachments: snapshot.data,
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
        ],
      );

  Widget buildSpoilerWithoutBodyWidget() => Padding(
        padding: _defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StatusSpoilerWidget(),
            StatusSpoilerAlertWidget(),
          ],
        ),
      );

  Widget buildCollapsibleButton(BuildContext context, IStatusBloc statusBloc) =>
      Center(
          child: StreamBuilder<bool>(
              stream: statusBloc.isCollapsedStream,
              initialData: statusBloc.isCollapsed,
              builder: (context, snapshot) {
                var isCollapsed = snapshot.data;
                return FediPrimaryFilledTextButton(
                  isCollapsed
                      ? tr("app.status.collapsible.action.expand")
                      : tr("app.status.collapsible.action.collapse"),
                  onPressed: () {
                    statusBloc.toggleCollapseExpand();
                  },
                );
              }));
}
