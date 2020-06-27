import 'package:fedi/app/media/single_camera_picker.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusAttachCameraActionWidget extends StatelessWidget {
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

          var  onPressed;
          if (isPossibleToAttach) {
            onPressed = () async {

              var pickedFile = await pickImageFromCamera();

              if (pickedFile != null) {
                var filePickerFile = FilePickerFile(
                  type: FilePickerFileType.image,
                  isNeedDeleteAfterUsage: true,
                  file: pickedFile,
                );
                postStatusBloc.mediaAttachmentGridBloc
                    .attachMedia(filePickerFile);
              }
            };
          }

          return IconButton(
            icon: Icon(
              FediIcons.camera,
              color: isPossibleToAttach
                  ? FediColors.darkGrey
                  : FediColors.lightGrey,
            ),
            onPressed: onPressed,
          );
        });
  }
}
