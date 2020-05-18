import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/refactored/app/ui/button/text/fedi_filled_text_button.dart';
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
                return FediFilledTextButton(
                  AppLocalizations.of(context).tr("app.chat.post.action.post"),
                  onPressed: isReadyToPost ? onPressed : null,
                );
            },
          );
        });
  }
}
