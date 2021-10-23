import 'package:fedi/app/media/attachment/upload/list/non_media/upload_media_attachment_list_non_media_item_widget.dart';
import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadMediaAttachmentListNonMediaWidget extends StatelessWidget {
  const UploadMediaAttachmentListNonMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);

    return StreamBuilder<List<IUploadMediaAttachmentBloc>>(
      stream: mediaAttachmentsCollectionBloc.onlyNonMediaAttachmentBlocsStream,
      builder: (context, snapshot) {
        var mediaItemBlocs = snapshot.data;

        if (mediaItemBlocs?.isNotEmpty == true) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: FediSizes.bigPadding,
              vertical: FediSizes.smallPadding,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...mediaItemBlocs!
                      .map(
                        (mediaItemBloc) =>
                            Provider<IUploadMediaAttachmentBloc>.value(
                          value: mediaItemBloc,
                          child: const Padding(
                            padding: EdgeInsets.only(
                              bottom: FediSizes.smallPadding,
                            ),
                            child:
                                UploadMediaAttachmentListNonMediaItemWidget(),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
