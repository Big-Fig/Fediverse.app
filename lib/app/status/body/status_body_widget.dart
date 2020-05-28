import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/app/status/card/status_card_widget.dart';
import 'package:fedi/app/status/content/status_content_with_emojis_widget.dart';
import 'package:fedi/app/status/nsfw/status_nsfw_warning_widget.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_alert_widget.dart';
import 'package:fedi/app/status/spoiler/status_spoiler_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';

class StatusBodyWidget extends StatelessWidget {
  final bool collapsible;

  StatusBodyWidget({@required this.collapsible});

  @override
  Widget build(BuildContext context) {
    IStatusBloc statusBloc = IStatusBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: statusBloc.nsfwSensitiveAndDisplayEnabledStream,
        initialData: statusBloc.nsfwSensitiveAndDisplayEnabled,
        builder: (context, snapshot) {
          var nsfwSensitiveAndDisplayEnabled = snapshot.data;

          if (nsfwSensitiveAndDisplayEnabled) {
            return StreamBuilder<bool>(
                stream: statusBloc.containsSpoilerAndDisplayEnabledStream,
                initialData: statusBloc.containsSpoilerAndDisplayEnabled,
                builder: (context, snapshot) {
                  var containsSpoilerAndDisplayEnabled = snapshot.data;
                  if (containsSpoilerAndDisplayEnabled) {
                    return Column(
                      children: <Widget>[
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
                        StreamBuilder<List<IPleromaMediaAttachment>>(
                            stream: statusBloc.mediaAttachmentsStream,
                            initialData: statusBloc.mediaAttachments,
                            builder: (context, snapshot) =>
                                MediaAttachmentsWidget(
                                  mediaAttachments: snapshot.data,
                                )),
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        StatusSpoilerWidget(),
                        StatusSpoilerAlertWidget(),
                      ],
                    );
                  }
                });
          } else {
            return StatusNsfwWarningWidget();
          }
        });
  }

  Center buildCollapsibleButton(BuildContext context, IStatusBloc statusBloc) {
    var appLocalizations = AppLocalizations.of(context);
    return Center(
        child: StreamBuilder<bool>(
            stream: statusBloc.isCollapsedStream,
            initialData: statusBloc.isCollapsed,
            builder: (context, snapshot) {
              var isCollapsed = snapshot.data;
              return FediPrimaryFilledTextButton(
                isCollapsed
                    ? appLocalizations
                        .tr("app.status.collapsible.action.expand")
                    : appLocalizations.tr("app.status.collapsible.action"
                        ".collapse"),
                onPressed: () {
                  statusBloc.toggleCollapseExpand();
                },
              );
            }));
  }
}
