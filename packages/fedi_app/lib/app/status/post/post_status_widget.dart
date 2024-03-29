import 'package:fedi_app/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi_app/app/message/action/post_message_emoji_action_widget.dart';
import 'package:fedi_app/app/message/post_message_widget.dart';
import 'package:fedi_app/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi_app/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi_app/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:flutter/widgets.dart';

class PostStatusWidget extends PostMessageWidget {
  const PostStatusWidget({
    Key? key,
    required String hintText,
    required bool showActionsOnlyWhenFocused,
  }) : super(
          key: key,
          hintText: hintText,
          showActionsOnlyWhenFocused: showActionsOnlyWhenFocused,
        );

  @override
  List<Widget> buildActions() => [
        const PostMessageAttachActionWidget(),
        const PostMessageEmojiActionWidget(),
        const PostStatusMentionActionWidget(),
        const PostStatusVisibilityActionWidget(),
        const PostStatusNsfwActionWidget(),
      ];
}
