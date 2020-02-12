import 'package:fedi/camera/camera_bloc.dart';
import 'package:fedi/camera/camera_bloc_impl.dart';
import 'package:fedi/camera/camera_model.dart';
import 'package:fedi/camera/camera_photo_widget.dart';
import 'package:fedi/camera/camera_video_widget.dart';
import 'package:fedi/camera/camera_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
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
          BuildContext context, IFilePickerBloc filePickerBloc) =>
      buildCameraBlocWithChild(
          context: context,
          config: defaultVideoConfig,
          filePickerBloc: filePickerBloc,
          child: CameraVideoWidget());

  @protected
  Widget buildBodyCaptureImageWidget(
          BuildContext context, IFilePickerBloc filePickerBloc) =>
      buildCameraBlocWithChild(
          context: context,
          config: defaultImageConfig,
          filePickerBloc: filePickerBloc,
          child: CameraPhotoWidget());

  DisposableProvider<ICameraBloc> buildCameraBlocWithChild(
      {@required BuildContext context,
      @required CameraConfig config,
      @required IFilePickerBloc filePickerBloc,
      @required CameraWidget child}) {
    return DisposableProvider<ICameraBloc>(
        create: (BuildContext context) {
          var cameraBloc = CameraBloc(
              cameraPermissionBloc:
                  ICameraPermissionBloc.of(context, listen: false),
              micPermissionBloc: IMicPermissionBloc.of(context, listen: false),
              startConfig: config);
          cameraBloc.performAsyncInit();
          cameraBloc.addDisposable(streamSubscription:
              cameraBloc.latestCapturedFileStream.listen((cameraFile) {
            filePickerBloc.onFileSelected(FilePickerFile(
                file: cameraFile.file,
                type: mapToPickerType(cameraFile.type),
                isNeedDeleteAfterUsage: true));
          }));
          return cameraBloc;
        },
        child: child);
  }

  FilePickerFileType mapToPickerType(CameraFileType cameraFileType) {
    switch (cameraFileType) {
      case CameraFileType.video:
        return FilePickerFileType.video;
        break;
      case CameraFileType.photo:
        return FilePickerFileType.image;
        break;
      default:
        return FilePickerFileType.other;
    }
  }

  @protected
  Widget buildBodyGalleryWidget(
      BuildContext context, IFilePickerBloc filePickerBloc);
}
