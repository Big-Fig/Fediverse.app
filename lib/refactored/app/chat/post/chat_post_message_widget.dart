import 'package:fedi/refactored/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/refactored/app/chat/post/content/chat_post_message_content_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageWidget extends StatelessWidget {
  ChatPostMessageWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(child: ChatPostMessageContentWidget()),
          AsyncOperationButtonBuilderWidget(
            asyncButtonAction: () {
              var chatPostMessageBloc =
                  IChatPostMessageBloc.of(context, listen: false);

              return chatPostMessageBloc.postMessage();
            },
            builder: (BuildContext context, onPressed) {
              return IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
