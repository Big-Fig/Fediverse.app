import 'package:fedi_app/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi_app/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showConfirmRemoveAssetDialog(BuildContext context) {
  var mediaItemBloc = IUploadMediaAttachmentBloc.of(context, listen: false);
  var attachmentsBloc =
      IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);

  FediConfirmAlertDialog(
    context: context,
    contentText:
        S.of(context).app_media_attachment_upload_remove_dialog_content,
    okActionLabel:
        S.of(context).app_media_attachment_upload_remove_dialog_action_remove,
    onAction: (context) async {
      attachmentsBloc.detachMediaAttachmentBloc(mediaItemBloc);
      Navigator.of(context).pop();
    },
  ).show<void>(context);
}
