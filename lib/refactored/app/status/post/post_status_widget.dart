import 'package:fedi/refactored/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_attach_media_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_post_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_schedule_action_widget.dart';
import 'package:fedi/refactored/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:fedi/refactored/app/status/post/mentions/post_status_mentions_widget.dart';
import 'package:fedi/refactored/app/status/post/message/message_post_status_widget.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusWidget extends StatelessWidget {
  final bool showVisibilityAction;
  final bool expanded;
  final bool displayMentions;
  final bool goBackOnSuccess;
  final bool displayAccountAvatar;

  PostStatusWidget(
      {this.showVisibilityAction = true,
      @required this.expanded,
      @required this.displayMentions,
      this.displayAccountAvatar = false,
      @required this.goBackOnSuccess});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          if (displayMentions) PostStatusMentionsWidget(),
          displayAccountAvatar
              ? Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyAccountAvatarWidget(
                        imageSize: 48,
                        progressSize: 48,
                      ),
                    ),
                    Flexible(
                      child: MessagePostStatusWidget(
                        expanded: expanded,
                      ),
                    )
                  ],
                )
              : Flexible(
                  child: MessagePostStatusWidget(
                  expanded: expanded,
                )),
          UploadMediaAttachmentGridWidget(),
          if (!displayAccountAvatar)
            Container(
              height: 1,
              decoration: BoxDecoration(color: FediColors.lightGrey),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    PostStatusMentionActionWidget(),
                    if (showVisibilityAction)
                      PostStatusVisibilityActionWidget(),
                    PostStatusAttachMediaActionWidget(),
                    PostStatusNsfwActionWidget(),
                    PostStatusScheduleActionWidget(),
                  ],
                ),
                PostStatusPostActionWidget(successCallback: (context) {
                  if (goBackOnSuccess) {
                    Navigator.of(context).pop();
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
