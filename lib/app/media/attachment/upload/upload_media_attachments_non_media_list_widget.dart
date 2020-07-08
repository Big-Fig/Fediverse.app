import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_non_media_item_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FediSizes.bigPadding,
              vertical: FediSizes.smallPadding,
            ),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...mediaItemBlocs.map((mediaItemBloc) {
                    return Provider.value(
                        value: mediaItemBloc,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
                          child: UploadMediaAttachmentsNonMediaItemWidget(),
                        ));
                  }).toList(),
                ],
              ),
            ),
          );
        });
  }
}
