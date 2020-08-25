import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUploadMediaAttachmentBloc implements Disposable {
  static IUploadMediaAttachmentBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IUploadMediaAttachmentBloc>(context, listen: listen);

  FilePickerFile get filePickerFile;

  IPleromaMediaAttachment get pleromaMediaAttachment;

  UploadMediaAttachmentState get uploadState;

  Stream<UploadMediaAttachmentState> get uploadStateStream;

  void startUpload();
}
