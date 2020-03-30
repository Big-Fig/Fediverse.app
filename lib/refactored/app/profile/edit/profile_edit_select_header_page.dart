import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/refactored/app/profile/edit/profile_edit_select_image_page.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditSelectHeaderPage extends ProfileEditSelectImagePage {
  ProfileEditSelectHeaderPage(
      {@required ImageFileSelectedCallback selectedCallback})
      : super(selectedCallback: selectedCallback);

  @override
  Widget createAppBarTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)
        .tr("app.profile.edit.select.header.title"));
  }

  @override
  onFileSelected(BuildContext context, FilePickerFile filePickerFile) {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text(AppLocalizations.of(context)
              .tr("app.profile.edit.select.header.dialog.title")),
          content: Image.file(filePickerFile.file),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  dismissDialog(context);
                  selectedCallback(filePickerFile);
                },
                child: Text(AppLocalizations.of(context).tr(
                    "app.profile.edit.select.header.dialog.action"
                        ".select"))),
            FlatButton(
                onPressed: () async {
                  File croppedFile =
                  await cropImage(filePickerFile.file, context);

                  dismissDialog(context);
                  if (croppedFile != null) {
                    if (filePickerFile.isNeedDeleteAfterUsage) {
                      filePickerFile.file.delete();
                    }

                    selectedCallback(FilePickerFile(
                        file: croppedFile,
                        type: filePickerFile.type,
                        isNeedDeleteAfterUsage: true));
                  } else {
                    selectedCallback(filePickerFile);
                  }
                },
                child: Text(AppLocalizations.of(context).tr(
                    "app.profile.edit.select.header.dialog.action"
                        ".crop"))),
            FlatButton(
                onPressed: () {
                  dismissDialog(context);
                },
                child: Text(AppLocalizations.of(context).tr(
                    "app.profile.edit.select.header.dialog.action"
                        ".cancel"))),
          ],
        ));
  }


  void dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
