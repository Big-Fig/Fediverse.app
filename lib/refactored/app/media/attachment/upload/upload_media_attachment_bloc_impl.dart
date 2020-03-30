import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("upload_media_attachment_bloc_impl.dart");

class UploadMediaAttachmentBloc extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;
  @override
  final FilePickerFile filePickerFile;
  @override
  IPleromaMediaAttachment pleromaMediaAttachment;

  // ignore: close_sinks
  BehaviorSubject<UploadMediaAttachmentState> uploadStateSubject =
      BehaviorSubject.seeded(UploadMediaAttachmentState.notUploaded);

  @override
  Stream<UploadMediaAttachmentState> get uploadStateStream =>
      uploadStateSubject.stream;

  @override
  UploadMediaAttachmentState get uploadState => uploadStateSubject.value;

  UploadMediaAttachmentBloc(
      {@required this.pleromaMediaAttachmentService,
      @required this.filePickerFile}) {
    assert(pleromaMediaAttachmentService != null);
    addDisposable(subject: uploadStateSubject);
    addDisposable(disposable: CustomDisposable(() async {
      if (filePickerFile.isNeedDeleteAfterUsage) {
        await filePickerFile.file.delete();
      }
    }));
  }

  @override
  startUpload() {
    assert(uploadState == UploadMediaAttachmentState.notUploaded ||
        uploadState == UploadMediaAttachmentState.failed);
    uploadStateSubject.add(UploadMediaAttachmentState.uploading);

    pleromaMediaAttachmentService
        .uploadMedia(file: filePickerFile.file)
        .then((pleromaMediaAttachment) {
      this.pleromaMediaAttachment = pleromaMediaAttachment;
      uploadStateSubject.add(UploadMediaAttachmentState.uploaded);
    }).catchError((error, stackTrace) {
      _logger.severe(() => "error during uploading", error, stackTrace);
      uploadStateSubject.add(UploadMediaAttachmentState.failed);
    });
  }
}
