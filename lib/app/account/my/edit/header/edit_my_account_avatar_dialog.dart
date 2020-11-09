import 'dart:io';

import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
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
        title: Text(
          S.of(context).app_account_my_edit_field_avatar_dialog_title,
        ),
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
                  context,
                  FileMediaDeviceFile(
                    originalFile: croppedFile,
                    type: mediaDeviceFile.type,
                    isNeedDeleteAfterUsage: true,
                  ),
                );
              } else {
                selectedCallback(
                  context,
                  mediaDeviceFile,
                );
              }
            },
            child: Text(S
                .of(context)
                .app_account_my_edit_field_avatar_dialog_action_selectAndCrop),
          ),
          FlatButton(
            onPressed: () {
              dismissDialog(context);
            },
            child: Text(S
                .of(context)
                .app_account_my_edit_field_avatar_dialog_action_cancel),
          ),
        ],
      ));
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
