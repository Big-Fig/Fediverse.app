import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
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
      ),
      autofocus: false,
      controller: chatPostMessageBloc.inputTextController,
      minLines: null,
      maxLines: null,
      expands: false,
    );
  }
}
