import 'package:fedi/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi/app/message/action/post_message_emoji_action_widget.dart';
import 'package:fedi/app/message/post_message_widget.dart';
import 'package:fedi/app/status/post/action/post_status_mention_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_nsfw_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_visibility_action_widget.dart';
import 'package:flutter/widgets.dart';

class PostStatusWidget extends PostMessageWidget {

  PostStatusWidget({
    @required String hintText,
  }): super(hintText: hintText);

  @override
  List<Widget> buildActions() {
    return [
      PostMessageAttachActionWidget(),
      PostMessageEmojiActionWidget(),
      PostStatusMentionActionWidget(),
      PostStatusVisibilityActionWidget(),
      PostStatusNsfwActionWidget(),
    ];
  }
}