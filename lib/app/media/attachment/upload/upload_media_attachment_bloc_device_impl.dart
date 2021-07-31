import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('device_upload_media_attachment_bloc_impl.dart');

class UploadMediaAttachmentBlocDevice extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  final IPleromaApiMediaAttachmentService pleromaMediaAttachmentService;

  @override
  final int? maximumFileSizeInBytes;

  final IMediaDeviceFile mediaDeviceFile;
  @override
  IPleromaApiMediaAttachment? pleromaMediaAttachment;

  // ignore: close_sinks
  BehaviorSubject<UploadMediaAttachmentState> uploadStateSubject =
      BehaviorSubject.seeded(
    UploadMediaAttachmentState(
      type: UploadMediaAttachmentStateType.notUploaded,
    ),
  );

  @override
  Stream<UploadMediaAttachmentState> get uploadStateStream =>
      uploadStateSubject.stream;

  @override
  UploadMediaAttachmentState? get uploadState => uploadStateSubject.valueOrNull;

  UploadMediaAttachmentBlocDevice({
    required this.pleromaMediaAttachmentService,
    required this.mediaDeviceFile,
    required this.maximumFileSizeInBytes,
  }) {
    uploadStateSubject.disposeWith(this);
    addCustomDisposable(
      () async {
        if (mediaDeviceFile.isNeedDeleteAfterUsage) {
          await mediaDeviceFile.delete();
        }
      },
    );
  }

  @override
  Future startUpload() async {
    assert(uploadState!.type == UploadMediaAttachmentStateType.notUploaded ||
        uploadState!.type == UploadMediaAttachmentStateType.failed);

    var file = await mediaDeviceFile.loadFile();
    var fileLength = await file.length();

    if (maximumFileSizeInBytes != null &&
        maximumFileSizeInBytes != 0 &&
        fileLength > maximumFileSizeInBytes!) {
      uploadStateSubject.add(
        UploadMediaAttachmentState(
          type: UploadMediaAttachmentStateType.failed,
          error: UploadMediaExceedFileSizeLimitException(
            currentFileSizeInBytes: fileLength,
            maximumFileSizeInBytes: maximumFileSizeInBytes,
            file: file,
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
        .uploadMedia(file: await mediaDeviceFile.loadFile())
        .then((pleromaMediaAttachment) {
      this.pleromaMediaAttachment = pleromaMediaAttachment;
      uploadStateSubject.add(
        UploadMediaAttachmentState(
          type: UploadMediaAttachmentStateType.uploaded,
        ),
      );
    }).catchError((error, stackTrace) {
      _logger.severe(() => 'error during uploading', error, stackTrace);
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
  Future<String> calculateFilePath() => mediaDeviceFile.calculateFilePath();

  @override
  bool get isMedia => mediaDeviceFile.metadata.isMedia;
}
