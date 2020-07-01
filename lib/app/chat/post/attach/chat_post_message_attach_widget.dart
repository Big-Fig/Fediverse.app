import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/media/attachment/select_media_attachment_type_to_pick_widget.dart';
import 'package:flutter/widgets.dart';

class ChatPostMessageAttachWidget extends StatelessWidget {
  ChatPostMessageAttachWidget();

  @override
  Widget build(BuildContext context) {
    var chatPostMessageBloc = IChatPostMessageBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: chatPostMessageBloc.isAttachActionSelectedStream,
        initialData: chatPostMessageBloc.isAttachActionSelected,
        builder: (context, snapshot) {
          var isAttachActionSelected = snapshot.data;

          if (isAttachActionSelected) {
            return SelectMediaAttachmentTypeToPickWidget(
              onFileSelected: () {
                chatPostMessageBloc.toggleAttachActionSelection();
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
