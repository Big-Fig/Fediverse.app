import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

AlertDialog createProfileEditSelectImageDialog({
  @required FilePickerFile filePickerFile,
  @required VoidCallback cancelCallback,
  @required VoidCallback editCallback,
  @required VoidCallback okCallback,
}) {
  return AlertDialog(
    title: Text("Confirm selection?"),
    content: Image.file(filePickerFile.file),
    actions: <Widget>[
      FlatButton(onPressed: okCallback, child: Text("ok")),
      FlatButton(onPressed: editCallback, child: Text("edit")),
      FlatButton(onPressed: cancelCallback, child: Text("cancel")),
    ],
  );
}

Future<AlertDialog> showProfileEditSelectImageDialog({
  @required BuildContext context,
  @required FilePickerFile filePickerFile,
  @required VoidCallback okCallback,
}) async {
  AlertDialog dialog;
  dialog = await showDialog(
      context: context,
      barrierDismissible: false,
      child: createProfileEditSelectImageDialog(
        filePickerFile: filePickerFile,
        cancelCallback: () {
          Navigator.pop(context);
        },
        okCallback: okCallback,
        editCallback: () async {
          File croppedFile = await ImageCropper.cropImage(
              sourcePath: filePickerFile.file.path,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ],
              androidUiSettings: AndroidUiSettings(
                  toolbarTitle: AppLocalizations.of(context)
                      .tr("profile.image.edit.crop.title", args: ["as"]),
                  toolbarColor: Colors.blue,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: false),
              iosUiSettings: IOSUiSettings(
                minimumAspectRatio: 1.0,
              ));
        },
      ));
  return dialog;
}
