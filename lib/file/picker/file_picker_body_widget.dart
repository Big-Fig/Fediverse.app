import 'package:fedi/file/image/capture/file_image_capture_widget.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/video/capture/file_video_capture_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FilePickerBodyWidget extends StatelessWidget {
  Widget buildBody(BuildContext context) {
    var filePickerBloc = IFilePickerBloc.of(context);

    return StreamBuilder<FilePickerTab>(
        stream: filePickerBloc.selectedTabStream.distinct(),
        initialData: filePickerBloc.selectedTab,
        builder: (context, snapshot) {
          var tab = snapshot.data;

          switch (tab) {
            case FilePickerTab.captureVideo:
              return buildBodyCaptureVideoWidget(context, filePickerBloc);
              break;
            case FilePickerTab.captureImage:
              return buildBodyCaptureImageWidget(context, filePickerBloc);

              break;
            case FilePickerTab.gallery:
              return buildBodyGalleryWidget(context, filePickerBloc);
              break;
          }

          throw "Invalid tab type $tab";
        });
  }

  @protected
  Widget buildBodyCaptureVideoWidget(
      BuildContext context, IFilePickerBloc filePickerBloc) {
    return FileImageCaptureWidget();
  }
  @protected
  Widget buildBodyCaptureImageWidget(
      BuildContext context, IFilePickerBloc filePickerBloc) {

    return FileVideoCaptureWidget();
  }

  @protected
  Widget buildBodyGalleryWidget(
      BuildContext context, IFilePickerBloc filePickerBloc);
}
