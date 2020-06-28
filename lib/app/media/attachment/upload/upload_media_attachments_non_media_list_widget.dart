import 'package:fedi/app/media/attachment/media_attachment_non_media_item_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_remove_dialog.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadMediaAttachmentsNonMediaListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaAttachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
    return StreamBuilder<List<IUploadMediaAttachmentBloc>>(
        stream:
            mediaAttachmentsCollectionBloc.onlyNonMediaAttachmentBlocsStream,
        initialData: mediaAttachmentsCollectionBloc.onlyNonMediaAttachmentBlocs,
        builder: (context, snapshot) {
          var mediaItemBlocs = snapshot.data;

          if (mediaItemBlocs.isEmpty) {
            return SizedBox.shrink();
          }

          return Container(
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: [
                ...mediaItemBlocs.map((mediaItemBloc) {
                  var actionsWidget = buildActionsWidget(
                      mediaItemBloc, mediaAttachmentsCollectionBloc);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: StreamBuilder<UploadMediaAttachmentState>(
                        stream: mediaItemBloc.uploadStateStream,
                        initialData: mediaItemBloc.uploadState,
                        builder: (context, snapshot) {
                          var uploadState = snapshot.data;
                          return MediaAttachmentNonMediaItemWidget(
                              opacity: uploadState ==
                                      UploadMediaAttachmentState.uploaded
                                  ? 1
                                  : 0.5,
                              filePath: mediaItemBloc.filePickerFile.file.path,
                              actionsWidget: actionsWidget);
                        }),
                  );
                }).toList(),
              ],
            ),
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
