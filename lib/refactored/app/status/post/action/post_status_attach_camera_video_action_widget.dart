import 'package:fedi/refactored/file/picker/single/single_file_picker_page.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusAttachCameraVideoActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return InitialDataStreamBuilder<bool>(
        stream: postStatusBloc.isPossibleToAttachMediaStream,
        initialData: postStatusBloc.isPossibleToAttachMedia,
        builder: (context, snapshot) {
          var isPossibleToAttach = snapshot.data;

          Null Function() onPressed;
          if (isPossibleToAttach) {
            onPressed = () {
              goToSingleFilePickerPage(context,
                  fileSelectedCallback: (FilePickerFile filePickerFile) {
                    postStatusBloc.attachMedia(filePickerFile);
                    Navigator.of(context).pop();
                  }, startActiveTab: FilePickerTab.captureVideo);
            };
          }

          return IconButton(
            icon: Icon(
              Icons.videocam,
              color: isPossibleToAttach ? Colors.blue : null,
            ),
            onPressed: onPressed,
          );
        });
  }
}
