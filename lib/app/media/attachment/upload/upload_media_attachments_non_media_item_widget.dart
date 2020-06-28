import 'dart:async';

import 'package:fedi/app/media/attachment/media_attachment_non_media_item_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_remove_dialog.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadMediaAttachmentsNonMediaItemWidget extends StatefulWidget {
  @override
  _UploadMediaAttachmentsNonMediaItemWidgetState createState() =>
      _UploadMediaAttachmentsNonMediaItemWidgetState();
}

class _UploadMediaAttachmentsNonMediaItemWidgetState
    extends State<UploadMediaAttachmentsNonMediaItemWidget> {
  StreamSubscription streamSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var uploadMediaAttachmentBloc =
        IUploadMediaAttachmentBloc.of(context, listen: false);

    streamSubscription =
        uploadMediaAttachmentBloc.uploadStateStream.listen((state) {
      if (state == UploadMediaAttachmentState.failed) {
        showMediaAttachmentFailedNotification(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var mediaItemBloc = IUploadMediaAttachmentBloc.of(context);
    var mediaAttachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
    var actionsWidget =
        buildActionsWidget(mediaItemBloc, mediaAttachmentsCollectionBloc);

    return StreamBuilder<UploadMediaAttachmentState>(
        stream: mediaItemBloc.uploadStateStream,
        initialData: mediaItemBloc.uploadState,
        builder: (context, snapshot) {
          var uploadState = snapshot.data;
          return MediaAttachmentNonMediaItemWidget(
              opacity:
                  uploadState == UploadMediaAttachmentState.uploaded ? 1 : 0.5,
              filePath: mediaItemBloc.filePickerFile.file.path,
              actionsWidget: actionsWidget);
        });
  }

  Widget buildActionsWidget(IUploadMediaAttachmentBloc mediaItemBloc,
      IUploadMediaAttachmentsCollectionBloc mediaAttachmentsCollectionBloc) {
    return StreamBuilder<UploadMediaAttachmentState>(
        stream: mediaItemBloc.uploadStateStream,
        initialData: mediaItemBloc.uploadState,
        builder: (context, snapshot) {
          var uploadState = snapshot.data;

          switch (uploadState) {
            case UploadMediaAttachmentState.uploading:
              return const FediCircularProgressIndicator(
                size: 30.0,
              );
              break;
            case UploadMediaAttachmentState.notUploaded:
            case UploadMediaAttachmentState.uploaded:
            case UploadMediaAttachmentState.failed:
            default:
              return IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  showConfirmRemoveAssetDialog(context, mediaItemBloc);
                },
                icon: Icon(
                  FediIcons.close,
                  size: 22.0,
                ),
              );
              break;
          }
        });
  }
}
