import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showConfirmRemoveAssetDialog(BuildContext context) {
  var mediaItemBloc = IUploadMediaAttachmentBloc.of(context, listen: false);
  var attachmentsBloc =
      IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        content: Text(
          S.of(context).app_media_attachment_upload_remove_dialog_content,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              S
                  .of(context)
                  .app_media_attachment_upload_remove_dialog_action_cancel,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ), // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text(
              S
                  .of(context)
                  .app_media_attachment_upload_remove_dialog_action_remove,
            ),
            onPressed: () {
              attachmentsBloc.detachMediaAttachmentBloc(mediaItemBloc);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
