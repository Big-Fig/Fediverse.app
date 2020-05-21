import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageContentWidget extends StatelessWidget {
  const ChatPostMessageContentWidget();

  @override
  Widget build(BuildContext context) {
    IChatPostMessageBloc chatPostMessageBloc = IChatPostMessageBloc.of(context);

    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText:
            AppLocalizations.of(context).tr("app.chat.post.field.content.hint"),
        hintStyle: TextStyle(fontSize: 16.0, color: FediColors.grey),
      ),
      style: TextStyle(fontSize: 16.0, color: FediColors.darkGrey),
      autofocus: false,
      controller: chatPostMessageBloc.inputTextController,
      minLines: null,
      maxLines: null,
      expands: false,
    );
  }
}
