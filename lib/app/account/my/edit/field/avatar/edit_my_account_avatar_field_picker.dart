import 'package:fedi/app/account/my/edit/field/image/edit_my_account_image_confirm_dialog.dart';
import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<IMediaDeviceFile?> showEditMyAccountAvatarFieldPicker(
  BuildContext context,
  IMediaDeviceFile mediaDeviceFile,
) =>
    showEditMyAccountImageConfirmDialog(
      title: S.of(context).app_account_my_edit_field_avatar_dialog_title,
      context: context,
      mediaDeviceFile: mediaDeviceFile,
      actions: [
        DialogAction(
          label: S
              .of(context)
              .app_account_my_edit_field_avatar_dialog_action_selectAndCrop,
          onAction: (context) => _selectAndCrop(
            context,
            mediaDeviceFile,
          ),
        ),
      ],
    );

Future<void> _selectAndCrop(
  BuildContext context,
  IMediaDeviceFile mediaDeviceFile,
) async {
  var croppedFile = await goToCropImagePage(
    context: context,
    file: await mediaDeviceFile.loadFile(),
    isForceCropToSquare: true,
  );

  if (croppedFile != null) {
    if (mediaDeviceFile.isNeedDeleteAfterUsage) {
      await mediaDeviceFile.delete();
    }

    var mediaDeviceFileMetadata = FileMediaDeviceFileMetadata(
      originalFile: croppedFile,
      type: mediaDeviceFile.metadata.type,
      isNeedDeleteAfterUsage: true,
    );
    var resultMediaDeviceFile =
        await mediaDeviceFileMetadata.loadMediaDeviceFile();
    Navigator.of(context).pop(
      resultMediaDeviceFile,
    );
  } else {
    Navigator.of(context).pop(mediaDeviceFile);
  }
}
