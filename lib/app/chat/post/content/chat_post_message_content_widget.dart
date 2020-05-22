import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/post/action/chat_post_message_attach_media_action_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/ui/edit/fedi_filled_edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageContentWidget extends StatelessWidget {
  const ChatPostMessageContentWidget();

  @override
  Widget build(BuildContext context) {
    IChatPostMessageBloc chatPostMessageBloc = IChatPostMessageBloc.of(context);

    return FediFilledEditTextField(
      leading: const ChatPostMessageAttachMediaActionWidget(),
      hintText:
          AppLocalizations.of(context).tr("app.chat.post.field.content.hint"),
      textEditingController: chatPostMessageBloc.inputTextController,
      expanded: false,
      autofocus: false,
    );
  }
}
