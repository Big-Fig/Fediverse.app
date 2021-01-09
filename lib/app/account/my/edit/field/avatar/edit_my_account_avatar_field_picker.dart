import 'dart:io';

import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<IMediaDeviceFile> showEditMyAccountAvatarFieldPicker(
  BuildContext context,
  IMediaDeviceFile mediaDeviceFile,
) =>
    showDialog(
      context: context,
      child: Provider<IMediaDeviceFile>.value(
        value: mediaDeviceFile,
        child: const _EditMyAccountAvatarFieldPickerBody(),
      ),
    );

class _EditMyAccountAvatarFieldPickerBody extends StatelessWidget {
  const _EditMyAccountAvatarFieldPickerBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(
          S.of(context).app_account_my_edit_field_avatar_dialog_title,
        ),
        content: const _EditMyAccountAvatarFieldPickerContent(),
        actions: <Widget>[
          const _EditMyAccountAvatarFieldPickerSelectAndCropAction(),
          const _EditMyAccountAvatarFieldPickerCancelAction(),
        ],
      );
}

class _EditMyAccountAvatarFieldPickerContent extends StatelessWidget {
  const _EditMyAccountAvatarFieldPickerContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceFile = Provider.of<IMediaDeviceFile>(context);
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

class _EditMyAccountAvatarFieldPickerSelectAndCropAction
    extends StatelessWidget {
  const _EditMyAccountAvatarFieldPickerSelectAndCropAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        await _selectAndCrop(context);
      },
      child: Text(S
          .of(context)
          .app_account_my_edit_field_avatar_dialog_action_selectAndCrop),
    );
  }

  Future _selectAndCrop(BuildContext context) async {
     var mediaDeviceFile = Provider.of<IMediaDeviceFile>(
      context,
      listen: false,
    );
    
    File croppedFile =
        await cropImageToSquare(await mediaDeviceFile.loadFile(), context);
    
    if (croppedFile != null) {
      if (mediaDeviceFile.isNeedDeleteAfterUsage) {
        await mediaDeviceFile.delete();
      }
    
      Navigator.of(context).pop(
        FileMediaDeviceFile(
          originalFile: croppedFile,
          type: mediaDeviceFile.type,
          isNeedDeleteAfterUsage: true,
        ),
      );
    } else {
      Navigator.of(context).pop(mediaDeviceFile);
    }
  }
}

class _EditMyAccountAvatarFieldPickerCancelAction extends StatelessWidget {
  const _EditMyAccountAvatarFieldPickerCancelAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop(null);
      },
      child: Text(
          S.of(context).app_account_my_edit_field_avatar_dialog_action_cancel),
    );
  }
}
