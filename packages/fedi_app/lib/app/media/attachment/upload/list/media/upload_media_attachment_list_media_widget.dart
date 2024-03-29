import 'package:fedi_app/app/media/attachment/upload/list/media/upload_media_attachment_list_media_item_widget.dart';
import 'package:fedi_app/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const mediaAttachmentSingleHeight = 220.0;
const _mediaAttachmentRowItemSize = 90.0;

class UploadMediaAttachmentListMediaWidget extends StatelessWidget {
  const UploadMediaAttachmentListMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);

    return StreamBuilder<List<IUploadMediaAttachmentBloc>?>(
      stream: mediaAttachmentsCollectionBloc.onlyMediaAttachmentBlocsStream,
      builder: (context, snapshot) {
        var mediaItemBlocs = snapshot.data;

        if (mediaItemBlocs?.isNotEmpty == true) {
          if (mediaItemBlocs!.length == 1) {
            return Padding(
              padding: const EdgeInsets.only(
                left: FediSizes.bigPadding,
                right: FediSizes.bigPadding,
                top: FediSizes.smallPadding,
                // ignore: no-equal-arguments
                bottom: FediSizes.bigPadding,
              ),
              child: SizedBox(
                height: mediaAttachmentSingleHeight,
                child: Provider<IUploadMediaAttachmentBloc>.value(
                  value: mediaItemBlocs.first,
                  child: const UploadMediaAttachmentListMediaItemWidget(
                    contentPadding: FediPadding.allSmallPadding,
                  ),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: _mediaAttachmentRowItemSize,
              child: ListView(
                scrollDirection: Axis.horizontal,
                //              shrinkWrap: true,
                children: [
                  ...mediaItemBlocs
                      .map(
                        (mediaItemBloc) => Padding(
                          padding: const EdgeInsets.only(
                            left: FediSizes.smallPadding,
                            // ignore: no-equal-arguments
                            top: FediSizes.smallPadding,
                          ),
                          child: SizedBox(
                            width: _mediaAttachmentRowItemSize,
                            // ignore: no-equal-arguments
                            height: _mediaAttachmentRowItemSize,
                            child: Provider<IUploadMediaAttachmentBloc>.value(
                              value: mediaItemBloc,
                              child:
                                  const UploadMediaAttachmentListMediaItemWidget(
                                contentPadding: FediPadding.allSmallPadding,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(), //                _buildGridItem(
                ],
              ),
            );
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
