import 'dart:async';

import 'package:fedi/app/media/attachment/media_attachment_non_media_item_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_failed_notification_overlay.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_remove_dialog.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_remove_icon_in_circle_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
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
      if (state.type == UploadMediaAttachmentStateType.failed) {
        showMediaAttachmentFailedNotificationOverlay(context, state.error);
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
          return FutureBuilder(
            future: mediaItemBloc.calculateFilePath(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              var filePath = snapshot.data;

              return MediaAttachmentNonMediaItemWidget(
                  opacity: uploadState.type ==
                          UploadMediaAttachmentStateType.uploaded
                      ? 1
                      : 0.5,
                  filePath: filePath ?? "",
                  actionsWidget: actionsWidget);
            },
          );
        });
  }

  Widget buildActionsWidget(IUploadMediaAttachmentBloc mediaItemBloc,
      IUploadMediaAttachmentsCollectionBloc mediaAttachmentsCollectionBloc) {
    return StreamBuilder<UploadMediaAttachmentState>(
        stream: mediaItemBloc.uploadStateStream,
        initialData: mediaItemBloc.uploadState,
        builder: (context, snapshot) {
          var uploadState = snapshot.data;

          switch (uploadState.type) {
            case UploadMediaAttachmentStateType.uploading:
              return buildLoading();
              break;
            case UploadMediaAttachmentStateType.notUploaded:
            case UploadMediaAttachmentStateType.uploaded:
              return buildRemoveButton(context, mediaItemBloc);
            case UploadMediaAttachmentStateType.failed:
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildErrorButton(context, mediaItemBloc),
                  const FediSmallHorizontalSpacer(),
                  buildRemoveButton(context, mediaItemBloc),
                ],
              );
            default:
              throw "Invalid state uploadState ${uploadState}";
              break;
          }
        });
  }

  ClipRRect buildLoading() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        width: 24,
        height: 24,
        color: FediColors.darkGrey.withOpacity(0.8),
        child: const FediCircularProgressIndicator(
          color: FediColors.white,
          size: 20.0,
        ),
      ),
    );
  }

  Widget buildRemoveButton(
          BuildContext context, IUploadMediaAttachmentBloc mediaItemBloc) =>
      FediRemoveIconInCircleButton(
        onPressed: () {
          showConfirmRemoveAssetDialog(context, mediaItemBloc);
        },
      );

  Widget buildErrorButton(
      BuildContext context, IUploadMediaAttachmentBloc mediaItemBloc) {
    return InkWell(
      onTap: () {
        mediaItemBloc.startUpload();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          width: 24,
          height: 24,
          color: FediColors.error.withOpacity(0.8),
          child: Icon(
            FediIcons.failed,
            color: FediColors.white,
            size: 14.0,
          ),
        ),
      ),
    );
  }
}
