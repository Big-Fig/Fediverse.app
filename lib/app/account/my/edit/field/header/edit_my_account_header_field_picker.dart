import 'dart:io';

import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<IMediaDeviceFile> showEditMyAccountHeaderFieldPicker(
  BuildContext context,
  IMediaDeviceFile mediaDeviceFile,
) =>
    showDialog(
      context: context,
      child: Provider<IMediaDeviceFile>.value(
        value: mediaDeviceFile,
        child: const _EditMyAccountHeaderFieldPickerBody(),
      ),
    );

class _EditMyAccountHeaderFieldPickerBody extends StatelessWidget {
  const _EditMyAccountHeaderFieldPickerBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(
          S.of(context).app_account_my_edit_field_header_dialog_title,
        ),
        content: const _EditMyAccountHeaderFieldPickerContent(),
        actions: <Widget>[
          const _EditMyAccountHeaderFieldPickerSelectAction(),
          const _EditMyAccountHeaderFieldPickerSelectAndCropAction(),
          const _EditMyAccountHeaderFieldPickerCancelAction(),
        ],
      );
}

class _EditMyAccountHeaderFieldPickerSelectAndCropAction
    extends StatelessWidget {
  const _EditMyAccountHeaderFieldPickerSelectAndCropAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatButton(
        onPressed: () async {
          var mediaDeviceFile = Provider.of<IMediaDeviceFile>(
            context,
            listen: false,
          );
          File croppedFile =
              await cropImage(await mediaDeviceFile.loadFile(), context);

          if (croppedFile != null) {
            if (mediaDeviceFile.isNeedDeleteAfterUsage) {
              await mediaDeviceFile.delete();
            }

            Navigator.of(context).pop(
              FileMediaDeviceFile(
                  originalFile: croppedFile,
                  type: mediaDeviceFile.type,
                  isNeedDeleteAfterUsage: true),
            );
          } else {
            Navigator.of(context).pop(mediaDeviceFile);
          }
        },
        child: Text(
          S.of(context).app_account_my_edit_field_header_dialog_action_crop,
        ),
      );
}

class _EditMyAccountHeaderFieldPickerSelectAction extends StatelessWidget {
  const _EditMyAccountHeaderFieldPickerSelectAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatButton(
        onPressed: () {
          var mediaDeviceFile = Provider.of<IMediaDeviceFile>(
            context,
            listen: false,
          );
          Navigator.of(context).pop(mediaDeviceFile);
        },
        child: Text(S
            .of(context)
            .app_account_my_edit_field_header_dialog_action_select),
      );
}

class _EditMyAccountHeaderFieldPickerContent extends StatelessWidget {
  const _EditMyAccountHeaderFieldPickerContent({
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

class _EditMyAccountHeaderFieldPickerCancelAction extends StatelessWidget {
  const _EditMyAccountHeaderFieldPickerCancelAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop(null);
      },
      child: Text(
          S.of(context).app_account_my_edit_field_header_dialog_action_cancel),
    );
  }
}
