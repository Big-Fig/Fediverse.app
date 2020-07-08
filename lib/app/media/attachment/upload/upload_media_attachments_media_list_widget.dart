import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_media_item_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadMediaAttachmentsMediaListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaAttachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
    return StreamBuilder<List<IUploadMediaAttachmentBloc>>(
        stream: mediaAttachmentsCollectionBloc.onlyMediaAttachmentBlocsStream,
        initialData: mediaAttachmentsCollectionBloc.onlyMediaAttachmentBlocs,
        builder: (context, snapshot) {
          var mediaItemBlocs = snapshot.data;

          if (mediaItemBlocs.isEmpty) {
            return SizedBox.shrink();
          }

          if (mediaItemBlocs.length == 1) {
            return Padding(
              padding: const EdgeInsets.only(
                left: FediSizes.bigPadding,
                right: FediSizes.bigPadding,
                top: FediSizes.smallPadding,
                bottom: FediSizes.bigPadding,
              ),
              child: Container(
                height: FediSizes.mediaAttachmentSingleHeight,
                child: Provider<IUploadMediaAttachmentBloc>.value(
                    value: mediaItemBlocs.first,
                    child: UploadMediaAttachmentMediaItemWidget(
                      contentPadding: FediPadding.allSmallPadding,
                    )),
              ),
            );
          }

          return Container(
            height: FediSizes.mediaAttachmentRowItemSize,
            child: ListView(
              scrollDirection:
                  Axis.horizontal, //              shrinkWrap: true,
              children: [
                ...mediaItemBlocs.map((mediaItemBloc) {
                  // don't dispose media bloc here
                  // it is disposed in parent Status bloc

                  return _buildItem(
                    Provider<IUploadMediaAttachmentBloc>.value(
                      value: mediaItemBloc,
                      child: UploadMediaAttachmentMediaItemWidget(
                        contentPadding: FediPadding.allSmallPadding,
                      ),
                    ),
                  );
                }).toList(), //                _buildGridItem(
              ],
            ),
          );
        });
  }

  Widget _buildItem(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(
        left: FediSizes.smallPadding,
        top: FediSizes.smallPadding,
      ),
      child: Container(
        width: FediSizes.mediaAttachmentRowItemSize,
        height: FediSizes.mediaAttachmentRowItemSize,
        child: child,
      ),
    );
  }

  const UploadMediaAttachmentsMediaListWidget();
}
