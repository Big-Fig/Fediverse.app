import 'package:fedi/refactored/app/chat/post/action/chat_post_message_attach_media_action_widget.dart';
import 'package:fedi/refactored/app/chat/post/action/chat_post_message_post_action_widget.dart';
import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/refactored/app/chat/post/content/chat_post_message_content_widget.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPostMessageWidget extends StatelessWidget {
  ChatPostMessageWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: ChatPostMessageContentWidget()),
          ProxyProvider<IChatPostMessageBloc, IUploadMediaAttachmentGridBloc>(
              update: (context, value, previous) =>
                  value.mediaAttachmentGridBloc,
              child: const UploadMediaAttachmentGridWidget()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ChatPostMessageAttachMediaActionWidget(),
                  ],
                ),
                const ChatPostMessagePostActionWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
