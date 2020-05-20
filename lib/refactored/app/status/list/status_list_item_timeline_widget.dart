import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/media/attachment/media_attachments_widget.dart';
import 'package:fedi/refactored/app/status/account/status_account_widget.dart';
import 'package:fedi/refactored/app/status/action/status_comment_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_favourite_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_more_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_reblog_action_widget.dart';
import 'package:fedi/refactored/app/status/card/status_card_widget.dart';
import 'package:fedi/refactored/app/status/content/status_content_with_emojis_widget.dart';
import 'package:fedi/refactored/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_list_widget.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/refactored/app/status/header/status_reblog_header_widget.dart';
import 'package:fedi/refactored/app/status/header/status_reply_header_widget.dart';
import 'package:fedi/refactored/app/status/nsfw/status_nsfw_warning_widget.dart';
import 'package:fedi/refactored/app/status/spoiler/status_spoiler_alert_widget.dart';
import 'package:fedi/refactored/app/status/spoiler/status_spoiler_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_page.dart';
import 'package:fedi/refactored/app/ui/button/text/fedi_filled_text_button.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_list_item_timeline_widget.dart");

class StatusListItemTimelineWidget extends StatelessWidget {
  final IStatusCallback statusCallback;
  final bool displayActions;
  final bool collapsible;

  const StatusListItemTimelineWidget({
    @required this.collapsible,
    this.displayActions = true,
    this.statusCallback = goToStatusThreadPage,
  }) : super();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    _logger.finest(() => "build ${statusBloc.remoteId}");

    return buildMainContentWidget(context, statusBloc);
  }

  GestureDetector buildMainContentWidget(
          BuildContext context, IStatusBloc statusBloc) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (statusCallback != null) {
            statusCallback(context, statusBloc.status);
          }
        },
        child: Column(
          children: [
            StreamBuilder<bool>(
                stream: statusBloc.isHaveReblogStream,
                initialData: statusBloc.isHaveReblog,
                builder: (context, snapshot) {
                  var isHaveReblogStream = snapshot.data;
                  if (isHaveReblogStream == true) {
                    return const StatusReblogHeaderWidget();
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
            StreamBuilder<bool>(
                stream: statusBloc.isHaveInReplyToAccountStream,
//                initialData: statusBloc.isHaveInReplyToAccount,
                builder: (context, snapshot) {
                  var isHaveInReplyToAccount = snapshot.data;
                  if (isHaveInReplyToAccount == true) {
                    return const StatusReplyHeaderWidget();
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StatusAccountWidget(),
                  StatusCreatedAtWidget(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: buildStatusContent(context, statusBloc),
            ),
            if (displayActions) StatusEmojiReactionListWidget(),
            if (displayActions)
              Column(
                children: <Widget>[
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(color: FediColors.ultraLightGrey),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            StatusCommentActionWidget(),
                            StatusFavouriteActionWidget(),
                            buildEmojiPickerButton(context, statusBloc),
                            StatusReblogActionWidget()
                          ],
                        ),
                        StatusShareActionWidget(),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      );

  IconButton buildEmojiPickerButton(
      BuildContext context, IStatusBloc statusBloc) {
    return IconButton(
      color: FediColors.darkGrey,
      iconSize: 20.0,
      icon: Icon(FediIcons.emoji),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => StatusEmojiReactionPickerWidget(
                  emojiReactionSelectedCallback:
                      (String emojiName, String emoji) {
                    Navigator.of(context).pop();
                    statusBloc.toggleEmojiReaction(emoji: emoji);
                  },
                ));
      },
    );
  }

  Widget buildStatusContent(BuildContext context, IStatusBloc statusBloc) {
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
              return FediFilledTextButton(
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
