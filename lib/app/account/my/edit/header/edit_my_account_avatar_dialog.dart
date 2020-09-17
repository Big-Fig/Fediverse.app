import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditMyAccountAvatarDialog(
    BuildContext context,
    IMediaDeviceFile mediaDeviceFile,
    MediaDeviceFileCallback selectedCallback) {
  showDialog(
      context: context,
      child: AlertDialog(
        title: Text(tr("app.account.my.edit.field.avatar.dialog.title")),
        content: FutureBuilder(
          future: mediaDeviceFile.loadFile(),
          builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            var file = snapshot.data;
            if (file != null) {
              return Image.file(file);
            } else {
              return FediCircularProgressIndicator();
            }
          },
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () async {
                File croppedFile = await cropImageToSquare(
                    await mediaDeviceFile.loadFile(), context);

                dismissDialog(context);
                if (croppedFile != null) {
                  if (mediaDeviceFile.isNeedDeleteAfterUsage) {
                    await mediaDeviceFile.delete();
                  }

                  selectedCallback(
                    FileMediaDeviceFile(
                      originalFile: croppedFile,
                      type: mediaDeviceFile.type,
                      isNeedDeleteAfterUsage: true,
                    ),
                  );
                } else {
                  selectedCallback(mediaDeviceFile);
                }
              },
              child: Text(tr(
                  "app.account.my.edit.field.avatar.dialog.action.select_and_crop"))),
          FlatButton(
              onPressed: () {
                dismissDialog(context);
              },
              child: Text(
                  tr("app.account.my.edit.field.avatar.dialog.action.cancel"))),
        ],
      ));
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
