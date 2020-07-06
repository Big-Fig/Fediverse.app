import 'package:fedi/app/chat/post/action/chat_post_message_emoji_action_widget.dart';
import 'package:fedi/app/chat/post/action/chat_post_message_post_action_widget.dart';
import 'package:fedi/app/chat/post/attach/chat_post_message_attach_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/chat/post/content/chat_post_message_content_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'action/chat_post_message_attach_action_widget.dart';

class ChatPostMessageWidget extends StatelessWidget {
  ChatPostMessageWidget();

  @override
  Widget build(BuildContext context) {
    var chatPostMessageBloc = IChatPostMessageBloc.of(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProxyProvider<IChatPostMessageBloc,
                  IUploadMediaAttachmentsCollectionBloc>(
              update: (context, value, previous) =>
                  value.mediaAttachmentsBloc,
              child:  UploadMediaAttachmentsWidget()),
          Row(
            children: [
              StreamBuilder<String>(
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
              Expanded(child: const ChatPostMessageContentWidget()),
              const FediSmallHorizontalSpacer(),
              const ChatPostMessagePostActionWidget()
            ],
          ),
          ChatPostMessageAttachWidget()
        ],
      ),
    );
  }
}
