import 'dart:io';

import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<IMediaDeviceFile> showEditMyAccountPleromaBackgroundFieldPicker(
  BuildContext context,
  IMediaDeviceFile mediaDeviceFile,
) =>
    showDialog(
      context: context,
      child: Provider<IMediaDeviceFile>.value(
        value: mediaDeviceFile,
        child: const _EditMyAccountPleromaBackgroundFieldPickerBody(),
      ),
    );

class _EditMyAccountPleromaBackgroundFieldPickerBody extends StatelessWidget {
  const _EditMyAccountPleromaBackgroundFieldPickerBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(
          S
              .of(context)
              .app_account_my_edit_field_pleroma_background_dialog_title,
        ),
        content: const _EditMyAccountPleromaBackgroundFieldPickerContent(),
        actions: <Widget>[
          const _EditMyAccountPleromaBackgroundFieldPickerSelectAction(),
          const _EditMyAccountPleromaBackgroundFieldPickerSelectAndCropAction(),
          const _EditMyAccountPleromaBackgroundFieldPickerCancelAction(),
        ],
      );
}

class _EditMyAccountPleromaBackgroundFieldPickerSelectAndCropAction
    extends StatelessWidget {
  const _EditMyAccountPleromaBackgroundFieldPickerSelectAndCropAction({
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
        },
        child: Text(
          S
              .of(context)
              .app_account_my_edit_field_pleroma_background_dialog_action_crop,
        ),
      );
}

class _EditMyAccountPleromaBackgroundFieldPickerSelectAction
    extends StatelessWidget {
  const _EditMyAccountPleromaBackgroundFieldPickerSelectAction({
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
            .app_account_my_edit_field_pleroma_background_dialog_action_select),
      );
}

class _EditMyAccountPleromaBackgroundFieldPickerContent
    extends StatelessWidget {
  const _EditMyAccountPleromaBackgroundFieldPickerContent({
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

class _EditMyAccountPleromaBackgroundFieldPickerCancelAction
    extends StatelessWidget {
  const _EditMyAccountPleromaBackgroundFieldPickerCancelAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop(null);
      },
      child: Text(S
          .of(context)
          .app_account_my_edit_field_pleroma_background_dialog_action_cancel),
    );
  }
}
