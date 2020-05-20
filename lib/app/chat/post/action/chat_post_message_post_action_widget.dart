import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef IPostChatMessageCallback = Function(BuildContext context);

class ChatPostMessagePostActionWidget extends StatelessWidget {
  const ChatPostMessagePostActionWidget();

  @override
  Widget build(BuildContext context) {
    var postChatMessageBloc = IChatPostMessageBloc.of(context, listen: true);

    return StreamBuilder<bool>(
        stream: postChatMessageBloc.isReadyToPostStream,
        initialData: postChatMessageBloc.isReadyToPost,
        builder: (context, snapshot) {
          var isReadyToPost = snapshot.data;

          return PleromaAsyncOperationButtonBuilderWidget(
            showProgressDialog: false,
            asyncButtonAction: () async {
              await postChatMessageBloc.postMessage();
            },
            builder: (BuildContext context, onPressed) {
              return IconButton(
                onPressed: isReadyToPost ? onPressed : null,
                icon: Icon(Icons.send),
              );
            },
          );
        });
  }
}
