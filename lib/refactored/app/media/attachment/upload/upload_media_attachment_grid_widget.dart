import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_item_widget.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/file/picker/single/single_file_picker_page.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadMediaAttachmentGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);
    return StreamBuilder<List<IUploadMediaAttachmentBloc>>(
        stream: postStatusBloc.mediaAttachmentBlocsStream,
        initialData: postStatusBloc.mediaAttachmentBlocs,
        builder: (context, snapshot) {
          var mediaItemBlocs = snapshot.data;

          if (mediaItemBlocs.isEmpty) {
            return SizedBox.shrink();
          }

          var count = mediaItemBlocs.length < 4
              ? mediaItemBlocs.length + 1
              : mediaItemBlocs.length;
          return Container(
            height: 100,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                print("$count == $index");
                if (count == index + 1 && mediaItemBlocs.length != 4) {
                  return buildAddTile(context, postStatusBloc);
                }
                var mediaItemBloc = mediaItemBlocs[index];

                // don't dispose media bloc here
                // it is disposed in parent Status bloc
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 100,
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Provider<IUploadMediaAttachmentBloc>(
                          create: (_) => mediaItemBloc,
                          child: UploadMediaAttachmentGridItem()),
                      Align(
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: IconButton(
                              icon: Icon(Icons.close),
                              iconSize: 15,
                              color: Colors.white,
                              onPressed: () {
                                askToRemoveAsset(
                                    context, postStatusBloc, mediaItemBloc);
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            ),
          );
        });
  }

  Widget buildAddTile(BuildContext context, IPostStatusBloc postStatusBloc) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _openAttachPage(context, postStatusBloc);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        color: Colors.blue,
        child: Center(
          child: IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
            ),
            onPressed: () {
              _openAttachPage(context, postStatusBloc);
            },
          ),
        ),
        width: 100,
        height: 100,
      ),
    );
  }

  void _openAttachPage(BuildContext context, IPostStatusBloc postStatusBloc) {
    goToSingleFilePickerPage(context,
        fileSelectedCallback: (FilePickerFile filePickerFile) {
      postStatusBloc.attachMedia(filePickerFile);
      Navigator.of(context).pop();
    }, startActiveTab: FilePickerTab.gallery);
  }

  askToRemoveAsset(BuildContext context, IPostStatusBloc postStatusBloc,
      IUploadMediaAttachmentBloc mediaItemBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text(AppLocalizations.of(context)
              .tr("app.media.attachment.upload.remove.dialog.content")),
          actions: <Widget>[
            FlatButton(
              child: new Text(AppLocalizations.of(context)
                  .tr("app.media.attachment.upload.remove.dialog.content"
                      ".action.cancel")),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text(AppLocalizations.of(context)
                  .tr("app.media.attachment.upload.remove.dialog.content"
                      ".action.remove")),
              onPressed: () {
                postStatusBloc.detachMedia(mediaItemBloc.filePickerFile);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
