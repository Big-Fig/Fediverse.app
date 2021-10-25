import 'package:fedi_app/app/chat/selection/action/copy_as_raw_text/chat_selection_copy_as_raw_text_action_button.dart';
import 'package:fedi_app/app/chat/selection/action/delete/chat_selection_delete_action_button.dart';
import 'package:fedi_app/app/chat/selection/action/share/chat_selection_share_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSelectionActionListWidget extends StatelessWidget {
  const ChatSelectionActionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          ChatSelectionShareActionButtonWidget(),
          ChatSelectionCopyAsRawTextActionButtonWidget(),
          ChatSelectionDeleteActionButtonWidget(),
        ],
      );
}
