import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/file/picker/single/single_file_picker_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusAttachMediaActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postStatusBloc
            .mediaAttachmentGridBloc.isPossibleToAttachMediaStream,
        initialData:
            postStatusBloc.mediaAttachmentGridBloc.isPossibleToAttachMedia,
        builder: (context, snapshot) {
          var isPossibleToAttach = snapshot.data;

          Null Function() onPressed;
          if (isPossibleToAttach) {
            onPressed = () {
              goToSingleFilePickerPage(context,
                  fileSelectedCallback: (FilePickerFile filePickerFile) {
                postStatusBloc.mediaAttachmentGridBloc
                    .attachMedia(filePickerFile);
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
}
