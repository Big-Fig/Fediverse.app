import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/media/attachment/upload/metadata/upload_media_attachment_metadata_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('device_upload_media_attachment_bloc_impl.dart');

class UploadMediaAttachmentBlocDevice extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  final IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService;

  @override
  final int? maximumFileSizeInBytes;

  final IMediaDeviceFile mediaDeviceFile;
  @override
  IUnifediApiMediaAttachment? unifediApiMediaAttachment;

  BehaviorSubject<UploadMediaAttachmentMetadata?> metadataSubject =
      BehaviorSubject();

  @override
  UploadMediaAttachmentMetadata? get metadata => metadataSubject.valueOrNull;

  @override
  Stream<UploadMediaAttachmentMetadata?> get metadataStream =>
      metadataSubject.stream;

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
  bool get isUploaded =>
      uploadState.type == UploadMediaAttachmentStateType.uploaded;

  @override
  UploadMediaAttachmentState get uploadState => uploadStateSubject.value;

  UploadMediaAttachmentBlocDevice({
    required this.unifediApiMediaAttachmentService,
    required this.mediaDeviceFile,
    required this.maximumFileSizeInBytes,
  }) {
    uploadStateSubject.disposeWith(this);
    metadataSubject.disposeWith(this);
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
    var type = uploadState.type;
    _logger.finest(() => 'startUpload $type');
    if (type == UploadMediaAttachmentStateType.uploaded) {
      return;
    }

    if (type == UploadMediaAttachmentStateType.uploading) {
      await waitUntilUploadFinishes();

      return;
    }

    assert(type == UploadMediaAttachmentStateType.notUploaded ||
        type == UploadMediaAttachmentStateType.failed);

    var file = await mediaDeviceFile.loadFile();
    var fileLength = await file.length();

    if (maximumFileSizeInBytes != null &&
        maximumFileSizeInBytes != 0 &&
        fileLength > maximumFileSizeInBytes!) {
      _logger.finest(() => 'startUpload exceed size');
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

    _logger.finest(() => 'startUpload uploading');

    uploadStateSubject.add(
      UploadMediaAttachmentState(
        type: UploadMediaAttachmentStateType.uploading,
      ),
    );

    await unifediApiMediaAttachmentService
        .uploadMedia(
      file: await mediaDeviceFile.loadFile(),
      description: metadata?.description,
    )
        .then((unifediApiMediaAttachment) {
      this.unifediApiMediaAttachment = unifediApiMediaAttachment;
      uploadStateSubject.add(
        UploadMediaAttachmentState(
          type: UploadMediaAttachmentStateType.uploaded,
        ),
      );
      _logger.finest(() => 'startUpload uploaded');
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

  Future<void> waitUntilUploadFinishes() async {
    _logger.finest(() => 'waitUntilUploadFinishes');
    var completer = Completer();

    var started = DateTime.now();
    var timer = Timer.periodic(Duration(milliseconds: 1), (_) {
      if (uploadState.type != UploadMediaAttachmentStateType.uploading) {
        completer.complete();
      } else {
        var dateTime = DateTime.now();
        var diff = dateTime.difference(started).abs();
        if (diff > Duration(seconds: 10)) {
          completer.complete();
        }
      }
    });

    await completer.future;
    timer.cancel();
    _logger.finest(() => 'waitUntilUploadFinishes finish');
  }

  @override
  Future<String> calculateFilePath() => mediaDeviceFile.calculateFilePath();

  @override
  bool get isMedia => mediaDeviceFile.metadata.isMedia;

  @override
  void changeMetadata(UploadMediaAttachmentMetadata? metadata) {
    metadataSubject.add(metadata);
    // re-upload
    // don't re-upload files
    // change only metadata via API
    unifediApiMediaAttachment = null;
    uploadStateSubject.add(
      UploadMediaAttachmentState(
        type: UploadMediaAttachmentStateType.notUploaded,
      ),
    );
  }
}
