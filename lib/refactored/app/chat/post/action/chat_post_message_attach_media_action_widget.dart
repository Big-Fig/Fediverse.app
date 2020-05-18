import 'package:fedi/refactored/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/file/picker/single/single_file_picker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageAttachMediaActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postChatMessageBloc = IChatPostMessageBloc.of(context, listen: false);

    var mediaAttachmentGridBloc = postChatMessageBloc.mediaAttachmentGridBloc;
    return StreamBuilder<bool>(
        stream: mediaAttachmentGridBloc.isPossibleToAttachMediaStream,
        initialData: mediaAttachmentGridBloc.isPossibleToAttachMedia,
        builder: (context, snapshot) {
          var isPossibleToAttach = snapshot.data;

          Null Function() onPressed;
          if (isPossibleToAttach) {
            onPressed = () {
              goToSingleFilePickerPage(context,
                  fileSelectedCallback: (FilePickerFile filePickerFile) {
                mediaAttachmentGridBloc.attachMedia(filePickerFile);
                Navigator.of(context).pop();
              }, startActiveTab: FilePickerTab.gallery);
            };
          }

          return IconButton(
            icon: Icon(
              FediIcons.attachment,
              color: isPossibleToAttach
                  ? FediColors.darkGrey
                  : FediColors.lightGrey,
            ),
            onPressed: onPressed,
          );
        });
  }

  const ChatPostMessageAttachMediaActionWidget();
}
