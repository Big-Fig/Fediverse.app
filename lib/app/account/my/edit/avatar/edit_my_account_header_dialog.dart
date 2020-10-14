import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditMyAccountHeaderDialog(
    BuildContext context,
    IMediaDeviceFile mediaDeviceFile,
    MediaDeviceFileCallback onFileSelectedCallback) {
  showDialog(
      context: context,
      child: AlertDialog(
        title: Text(tr("app.account.my.edit.field.header.dialog.title")),
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
              onPressed: () {
                dismissDialog(context);
                onFileSelectedCallback(mediaDeviceFile);
              },
              child: Text(tr("app.account.my.edit.field.header.dialog.action"
                  ".select"))),
          FlatButton(
              onPressed: () async {
                File croppedFile =
                    await cropImage(await mediaDeviceFile.loadFile(), context);

                dismissDialog(context);
                if (croppedFile != null) {
                  if (mediaDeviceFile.isNeedDeleteAfterUsage) {
                    await mediaDeviceFile.delete();
                  }

                  onFileSelectedCallback(
                    FileMediaDeviceFile(
                        originalFile: croppedFile,
                        type: mediaDeviceFile.type,
                        isNeedDeleteAfterUsage: true),
                  );
                } else {
                  onFileSelectedCallback(mediaDeviceFile);
                }
              },
              child: Text(tr("app.account.my.edit.field.header.dialog.action"
                  ".crop"))),
          FlatButton(
              onPressed: () {
                dismissDialog(context);
              },
              child: Text(tr("app.account.my.edit.field.header.dialog.action"
                  ".cancel"))),
        ],
      ));
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
