import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusAttachFileActionWidget extends StatelessWidget {
  final double iconSize;


  PostStatusAttachFileActionWidget({this.iconSize});

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

          var onPressed;
          if (isPossibleToAttach) {
            onPressed = () async {

              var pickedFile = await FilePicker.getFile();
              if (pickedFile != null) {
                var filePickerFile = FilePickerFile(
                  type: FilePickerFileType.other,
                  isNeedDeleteAfterUsage: false,
                  file: pickedFile,
                );
                postStatusBloc.mediaAttachmentGridBloc
                    .attachMedia(filePickerFile);
              }
            };
          }

          return IconButton(
            icon: Icon(
              FediIcons.attachment,
              size: iconSize,
              color: isPossibleToAttach
                  ? FediColors.darkGrey
                  : FediColors.lightGrey,
            ),
            onPressed: onPressed,
          );
        });
  }
}
