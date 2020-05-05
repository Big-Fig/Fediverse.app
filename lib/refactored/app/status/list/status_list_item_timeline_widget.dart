import 'package:fedi/refactored/app/status/account/status_account_widget.dart';
import 'package:fedi/refactored/app/status/action/status_comment_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_favourite_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_more_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_reblog_action_widget.dart';
import 'package:fedi/refactored/app/status/card/status_card_widget.dart';
import 'package:fedi/refactored/app/status/content/status_content_widget.dart';
import 'package:fedi/refactored/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_list_widget.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/refactored/app/status/media/status_media_attachments_widget.dart';
import 'package:fedi/refactored/app/status/nsfw/status_nsfw_warning_widget.dart';
import 'package:fedi/refactored/app/status/reblog/status_reblog_header_widget.dart';
import 'package:fedi/refactored/app/status/reply/status_reply_header_widget.dart';
import 'package:fedi/refactored/app/status/spoiler/status_spoiler_alert_widget.dart';
import 'package:fedi/refactored/app/status/spoiler/status_spoiler_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_list_item_timeline_widget.dart");

class StatusListItemTimelineWidget extends StatefulWidget {
  final IStatusCallback statusCallback;
  final bool displayActions;

  StatusListItemTimelineWidget({
    this.displayActions = true,
    this.statusCallback = goToStatusThreadPage,
  }) : super();

  @override
  _StatusListItemTimelineWidgetState createState() =>
      _StatusListItemTimelineWidgetState();
}

class _StatusListItemTimelineWidgetState
    extends State<StatusListItemTimelineWidget> {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    _logger.finest(() => "build ${statusBloc.remoteId}");

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: buildMainContentWidget(context, statusBloc),
      ),
    );
  }

  GestureDetector buildMainContentWidget(
          BuildContext context, IStatusBloc statusBloc) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.statusCallback != null) {
            widget.statusCallback(context, statusBloc.status);
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
                    return StatusReblogHeaderWidget();
                  } else {
                    return SizedBox.shrink();
                  }
                }),
            StreamBuilder<bool>(
                stream: statusBloc.isHaveInReplyToAccountStream,
//                initialData: statusBloc.isHaveInReplyToAccount,
                builder: (context, snapshot) {
                  var isHaveInReplyToAccount = snapshot.data;
                  if (isHaveInReplyToAccount == true) {
                    return StatusReplyHeaderWidget();
                  } else {
                    return SizedBox.shrink();
                  }
                }),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StatusAccountWidget(),
                  StatusCreatedAtWidget(),
                ],
              ),
            ),
            buildStatusContent(context, statusBloc),
            StatusEmojiReactionListWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StatusCommentActionWidget(),
                  StatusFavouriteActionWidget(),
                  buildEmojiPickerButton(context, statusBloc),
                  StatusReblogActionWidget(),
                  StatusShareActionWidget(),
                ],
              ),
            ),
          ],
        ),
      );

  IconButton buildEmojiPickerButton(
      BuildContext context, IStatusBloc statusBloc) {
    return IconButton(
      color: Colors.grey,
      icon: Icon(Icons.insert_emoticon),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => StatusEmojiReactionPickerWidget(
                  emojiReactionSelectedCallback:
                      (String emojiName, String emoji) {
                    setState(() {
                      Navigator.of(context).pop();
                    });
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
                if(containsSpoilerAndDisplayEnabled) {
                  return Column(
                    children: <Widget>[
                      StatusSpoilerWidget(),
                      StatusContentWidget(),
                      StatusCardWidget(),
                      StatusMediaAttachmentsWidget(),
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

              }
            );
          } else {
            return StatusNsfwWarningWidget();
          }
        });
  }
}
