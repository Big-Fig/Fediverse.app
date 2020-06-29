import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_media_item_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_page.dart';
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
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 220,
                ),
                child: Provider<IUploadMediaAttachmentBloc>.value(
                    value: mediaItemBlocs.first,
                    child: UploadMediaAttachmentMediaItemWidget(
                      contentPadding: const EdgeInsets.all(8.0),
                    )),
              ),
            );
          }

          return Container(
          height: 90.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
//              shrinkWrap: true,
              children: [
                ...mediaItemBlocs.map((mediaItemBloc) {
                  // don't dispose media bloc here
                  // it is disposed in parent Status bloc

                  return _buildItem(
                    Provider<IUploadMediaAttachmentBloc>.value(
                      value: mediaItemBloc,
                      child: UploadMediaAttachmentMediaItemWidget(
                        contentPadding: const EdgeInsets.all(7.0),
                      ),
                    ),
                  );
                }).toList(),
//                _buildGridItem(
//                  buildAddTile(context, mediaAttachmentsCollectionBloc),
//                )
              ],
            ),
          );
        });
  }

  Widget _buildItem(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, top: 6.0),
      child: Container(
        width: 90,
        height: 90,
        child: child,
      ),
    );
  }

//  Widget buildAddTile(
//      BuildContext context, IUploadMediaAttachmentsCollectionBloc bloc) {
//    return GestureDetector(
//      behavior: HitTestBehavior.opaque,
//      onTap: () {
//        _openAttachPage(context, bloc);
//      },
//      child: ClipRRect(
//        borderRadius: BorderRadius.all(Radius.circular(16.0)),
//        child: Container(
//          color: Colors.blue,
//          child: Center(
//            child: IconButton(
//              iconSize: 30,
//              icon: Icon(
//                Icons.add_photo_alternate,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                _openAttachPage(context, bloc);
//              },
//            ),
//          ),
//          width: 100,
//          height: 100,
//        ),
//      ),
//    );
//  }

  void _openAttachPage(
      BuildContext context, IUploadMediaAttachmentsCollectionBloc bloc) {
    goToSingleFilePickerPage(context,
        fileSelectedCallback: (FilePickerFile filePickerFile) {
      bloc.attachMedia(filePickerFile);
      Navigator.of(context).pop();
    }, startActiveTab: FilePickerTab.gallery);
  }

  const UploadMediaAttachmentsMediaListWidget();
}
