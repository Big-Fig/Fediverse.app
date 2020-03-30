import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/account/status_account_widget.dart';
import 'package:fedi/refactored/app/status/action/status_comment_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_favourite_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_reblog_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_share_action_widget.dart';
import 'package:fedi/refactored/app/status/card/status_card_widget.dart';
import 'package:fedi/refactored/app/status/content/status_content_widget.dart';
import 'package:fedi/refactored/app/status/created_at/status_created_at_widget.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_list_widget.dart';
import 'package:fedi/refactored/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/refactored/app/status/media/status_media_attachments_widget.dart';
import 'package:fedi/refactored/app/status/reblog/status_reblog_header_widget.dart';
import 'package:fedi/refactored/app/status/reply/status_reply_header_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_list_item_timeline_widget.dart");

class StatusListItemTimelineWidget extends StatefulWidget {
  final bool navigateToStatusThreadOnClick;
  final bool displayActions;

  StatusListItemTimelineWidget({
    this.displayActions = true,
    this.navigateToStatusThreadOnClick = true,
  }) : super();

  @override
  _StatusListItemTimelineWidgetState createState() =>
      _StatusListItemTimelineWidgetState();
}

class _StatusListItemTimelineWidgetState
    extends State<StatusListItemTimelineWidget> {
  bool showEmojiPicker = false;

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    _logger.finest(() => "build ${statusBloc.remoteId}");

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            buildMainContentWidget(context, statusBloc),
            if (showEmojiPicker)
              StatusEmojiReactionPickerWidget(
                emojiReactionSelectedCallback:
                    (String emojiName, String emoji) {
                  setState(() {
                    showEmojiPicker = !showEmojiPicker;
                  });
                  statusBloc.requestToggleEmojiReaction(emoji: emoji);
                },
              ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildMainContentWidget(
          BuildContext context, IStatusBloc statusBloc) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.navigateToStatusThreadOnClick == true) {
            goToStatusThreadPage(context, statusBloc.status);
          }
        },
        child: Column(
          children: [
            StreamBuilder<bool>(
                stream: statusBloc.isHaveReblogStream,
//                initialData: statusBloc.isHaveReblog,
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
            StatusContentWidget(),
            StatusCardWidget(),
            StatusEmojiReactionListWidget(),
            StatusMediaAttachmentsWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StatusCommentActionWidget(),
                  StatusFavouriteActionWidget(),
                  buildEmojiPickerButton(context),
                  StatusReblogActionWidget(),
                  StatusShareActionWidget(),
                ],
              ),
            ),
          ],
        ),
      );

  IconButton buildEmojiPickerButton(BuildContext context) => IconButton(
        color: Colors.grey,
        icon: Icon(Icons.insert_emoticon),
        tooltip: AppLocalizations.of(context)
            .tr("timeline.status.cell.tooltip.repost"),
        onPressed: () {
          setState(() {
            showEmojiPicker = !showEmojiPicker;
          });
        },
      );
}
