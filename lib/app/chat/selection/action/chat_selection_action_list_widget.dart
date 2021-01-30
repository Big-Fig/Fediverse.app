import 'package:fedi/app/chat/selection/action/copy_as_raw_text/chat_selection_copy_as_raw_text_action_button.dart';
import 'package:fedi/app/chat/selection/action/delete/chat_selection_delete_action_button.dart';
import 'package:fedi/app/chat/selection/action/share/chat_selection_share_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSelectionActionListWidget extends StatelessWidget {
  const ChatSelectionActionListWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ChatSelectionShareActionButtonWidget(),
        const ChatSelectionCopyAsRawTextActionButtonWidget(),
        const ChatSelectionDeleteActionButtonWidget(),
      ],
    );
  }
}
