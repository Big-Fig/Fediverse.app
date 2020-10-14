import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showConfirmRemoveAssetDialog(
    BuildContext context, IUploadMediaAttachmentBloc mediaItemBloc) {
  var attachmentsBloc =
      IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        content: Text(tr("app.media.attachment.upload.remove.dialog.content")),
        actions: <Widget>[
          FlatButton(
            child: Text(tr("app.media.attachment.upload.remove.dialog"
                ".action.cancel")),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ), // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text(tr("app.media.attachment.upload.remove.dialog"
                ".action.remove")),
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
