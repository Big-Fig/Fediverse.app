import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("upload_media_attachment_bloc_impl.dart");

class UploadMediaAttachmentBloc extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;

  @override
  final int maximumFileSizeInBytes;

  final FilePickerFile filePickerFile;
  @override
  IPleromaMediaAttachment pleromaMediaAttachment;

  // ignore: close_sinks
  BehaviorSubject<UploadMediaAttachmentState> uploadStateSubject =
      BehaviorSubject.seeded(
    UploadMediaAttachmentState(
        type: UploadMediaAttachmentStateType.notUploaded),
  );

  @override
  Stream<UploadMediaAttachmentState> get uploadStateStream =>
      uploadStateSubject.stream;

  @override
  UploadMediaAttachmentState get uploadState => uploadStateSubject.value;

  UploadMediaAttachmentBloc({
    @required this.pleromaMediaAttachmentService,
    @required this.filePickerFile,
    @required this.maximumFileSizeInBytes,
  }) {
    assert(pleromaMediaAttachmentService != null);
    addDisposable(subject: uploadStateSubject);
    addDisposable(disposable: CustomDisposable(() async {
      if (filePickerFile.isNeedDeleteAfterUsage) {
        await filePickerFile.file.delete();
      }
    }));
  }

  @override
  Future startUpload() async {
    assert(uploadState.type == UploadMediaAttachmentStateType.notUploaded ||
        uploadState.type == UploadMediaAttachmentStateType.failed);

    var fileLength = await filePickerFile.file.length();

    if (fileLength > maximumFileSizeInBytes) {
      uploadStateSubject.add(
        UploadMediaAttachmentState(
          type: UploadMediaAttachmentStateType.failed,
          error: UploadMediaExceedFileSizeLimitException(
            currentFileSizeInBytes: fileLength,
            maximumFileSizeInBytes: maximumFileSizeInBytes,
            file: filePickerFile.file,
          ),
          stackTrace: null,
        ),
      );
    }

    uploadStateSubject.add(
      UploadMediaAttachmentState(
        type: UploadMediaAttachmentStateType.uploading,
      ),
    );

    await pleromaMediaAttachmentService
        .uploadMedia(file: filePickerFile.file)
        .then((pleromaMediaAttachment) {
      this.pleromaMediaAttachment = pleromaMediaAttachment;
      uploadStateSubject.add(
        UploadMediaAttachmentState(
          type: UploadMediaAttachmentStateType.uploaded,
        ),
      );
    }).catchError((error, stackTrace) {
      _logger.severe(() => "error during uploading", error, stackTrace);
      uploadStateSubject.add(
        UploadMediaAttachmentState(
          type: UploadMediaAttachmentStateType.failed,
          error: error,
          stackTrace: stackTrace,
        ),
      );
    });
  }

  @override
  String get filePath => filePickerFile.file.path;

  @override
  bool get isMedia => filePickerFile.isMedia;
}
