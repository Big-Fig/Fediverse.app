import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageAttachActionWidget extends StatelessWidget {
  ChatPostMessageAttachActionWidget();

  @override
  Widget build(BuildContext context) {
    var chatPostMessageBloc = IChatPostMessageBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: chatPostMessageBloc
            .mediaAttachmentsBloc.isPossibleToAttachMediaStream,
        initialData:
            chatPostMessageBloc.mediaAttachmentsBloc.isPossibleToAttachMedia,
        builder: (context, snapshot) {
          var isPossibleToAttach = snapshot.data;

          var onPressed;
          if (isPossibleToAttach) {
            onPressed = () async {
              chatPostMessageBloc.toggleAttachActionSelection();
            };
          }

          return IconButton(
            icon: Icon(
              FediIcons.plus,
              color: isPossibleToAttach
                  ? FediColors.darkGrey
                  : FediColors.lightGrey,
            ),
            onPressed: onPressed,
          );
        });
  }
}
