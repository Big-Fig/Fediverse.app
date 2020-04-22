import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/media/video/media_video_player_widget.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadMediaAttachmentGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uploadMediaAttachmentBloc =
        IUploadMediaAttachmentBloc.of(context, listen: false);

    return Stack(
      children: <Widget>[
        buildMediaPreview(uploadMediaAttachmentBloc.filePickerFile),
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
    );
  }

  Widget buildMediaPreview(FilePickerFile asset) {
    var type = asset.type;
    switch (type) {
      case FilePickerFileType.image:
        return Image.file(asset.file);
        break;
      case FilePickerFileType.video:
        return MediaVideoPlayerWidget(
          file: asset.file,
        );
        break;
      case FilePickerFileType.other:
      default:
        throw "Not supported FilePickerFileType $type";
        break;
    }
  }
}
