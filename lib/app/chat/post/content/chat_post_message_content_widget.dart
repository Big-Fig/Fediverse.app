import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/post/action/chat_post_message_attach_action_widget.dart';
import 'package:fedi/app/chat/post/action/chat_post_message_emoji_action_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageContentWidget extends StatelessWidget {
  const ChatPostMessageContentWidget();

  @override
  Widget build(BuildContext context) {
    IChatPostMessageBloc chatPostMessageBloc = IChatPostMessageBloc.of(context);

    return FediFilledEditTextField(
      leading: StreamBuilder<String>(
          stream: chatPostMessageBloc.inputTextStream,
          initialData: chatPostMessageBloc.inputText,
          builder: (context, snapshot) {
            var inputText = snapshot.data;
            if (inputText?.trim()?.isNotEmpty == true) {
              return ChatPostMessageEmojiActionWidget();
            } else {
              return ChatPostMessageAttachActionWidget();
            }
          }),
      hintText: tr("app.chat.post.field.content.hint"),
      textEditingController: chatPostMessageBloc.inputTextController,
      expanded: false,
      autofocus: false,
      textInputAction: TextInputAction.send,
      onSubmitted: (String value) async {
        if (chatPostMessageBloc.isReadyToPost) {
          await chatPostMessageBloc.postMessage();
        } else {
          await SimpleAlertDialog(
                  context: context,
                  title: tr("app.chat.post.error.empty.dialog.title"))
              .show(context);
        }
      },
      maxLines: 1,
      errorText: null,
    );
  }
}
