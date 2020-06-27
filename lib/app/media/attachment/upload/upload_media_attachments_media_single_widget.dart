import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/media/media_video_player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UploadMediaAttachmentMediaSingleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uploadMediaAttachmentBloc =
        IUploadMediaAttachmentBloc.of(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                bottom: 0.0,
                child:
                    buildMediaPreview(uploadMediaAttachmentBloc.filePickerFile),
              ),
              StreamBuilder<UploadMediaAttachmentState>(
                  stream: uploadMediaAttachmentBloc.uploadStateStream,
                  initialData: uploadMediaAttachmentBloc.uploadState,
                  builder: (context, snapshot) {
                    var uploadState = snapshot.data;

                    switch (uploadState) {
                      case UploadMediaAttachmentState.notUploaded:
                        // nothing to show, uploading start automatically
                        return SizedBox.shrink();
                        break;
                      case UploadMediaAttachmentState.uploading:
                        return Center(child: CircularProgressIndicator());
                        break;
                      case UploadMediaAttachmentState.uploaded:
                        return Center(child: Icon(Icons.done));
                        break;
                      case UploadMediaAttachmentState.failed:
                        return Center(
                          child: IconButton(
                              icon: Icon(Icons.error),
                              onPressed: () {
                                uploadMediaAttachmentBloc.startUpload();
                              }),
                        );
                        break;
                    }

                    throw "Unsupported uploadState $uploadState";
                  })
            ],
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
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
                    askToRemoveAsset(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void askToRemoveAsset(BuildContext context) {
    var bloc = IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
    var mediaItemBloc = IUploadMediaAttachmentBloc.of(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content:
              Text(tr("app.media.attachment.upload.remove.dialog.content")),
          actions: <Widget>[
            FlatButton(
              child: Text(tr("app.media.attachment.upload.remove.dialog"
                  ".action.cancel")),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(tr("app.media.attachment.upload.remove.dialog"
                  ".action.remove")),
              onPressed: () {
                bloc.detachMedia(mediaItemBloc.filePickerFile);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildMediaPreview(FilePickerFile asset) {
    var type = asset.type;
    var file = asset.file;
    switch (type) {
      case FilePickerFileType.image:
        return Image.file(
          file,
          fit: BoxFit.cover,
        );
        break;
      case FilePickerFileType.video:
        return MediaVideoPlayerWidget.localFile(
          localFile: file,
        );
        break;
      case FilePickerFileType.other:
      default:
        var path = file.path;
        var filename = basename(path);
        return Text(filename);
        break;
    }
  }
}
