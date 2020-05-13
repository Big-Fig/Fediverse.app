import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageContentWidget extends StatelessWidget {

  ChatPostMessageContentWidget();

  @override
  Widget build(BuildContext context) {
    IChatPostMessageBloc chatPostMessageBloc = IChatPostMessageBloc.of(context);

    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(),
        ),
        labelText: AppLocalizations.of(context)
            .tr("app.chat.post.field.message.label"),
      ),
      autofocus: false,
      controller: chatPostMessageBloc.inputTextController,
      minLines: null,
      maxLines: null,
      expands: false,
    );
  }
}
