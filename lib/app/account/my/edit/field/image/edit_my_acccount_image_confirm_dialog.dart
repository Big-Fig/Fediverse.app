import 'dart:io';

import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';

Future<IMediaDeviceFile> showEditMyAccountImageConfirmDialog({
  BuildContext context,
  @required String title,
  @required List<DialogAction> actions,
  @required IMediaDeviceFile mediaDeviceFile,
}) => EditMyAccountImageConfirmDialog(
    title: title,
    actions: actions,
    mediaDeviceFile: mediaDeviceFile,
  ).show<IMediaDeviceFile>(context);

class EditMyAccountImageConfirmDialog extends FediDialog {
  final IMediaDeviceFile mediaDeviceFile;

  EditMyAccountImageConfirmDialog({
    @required String title,
    @required List<DialogAction> actions,
    @required this.mediaDeviceFile,
    Axis actionsAxis = Axis.vertical,
    bool cancelable = true,
    bool actionsBorderVisible = false,
  }) : super(
          title: title,
          actions: actions,
          actionsAxis: actionsAxis,
          cancelable: cancelable,
          actionsBorderVisible: actionsBorderVisible,
        );

  @override
  Widget buildContentWidget(BuildContext context) {
    return FutureBuilder(
      future: mediaDeviceFile.loadFile(),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        var file = snapshot.data;
        if (file != null) {
          return Image.file(file);
        } else {
          return const FediCircularProgressIndicator();
        }
      },
    );
  }
}
