import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/media/attachment/upload/metadata/upload_media_attachment_metadata_model.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UploadedUploadMediaAttachmentBloc extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  @override
  final IUnifediApiMediaAttachment unifediApiMediaAttachment;

  UploadedUploadMediaAttachmentBloc({
    required this.unifediApiMediaAttachment,
  });

  @override
  Future<void> startUploadIfPossible() async {
    throw UnsupportedError('UploadMediaAttachmentUploadedBloc always uploaded');
  }

  @override
  UploadMediaAttachmentState get uploadState =>
      const UploadMediaAttachmentState(
        type: UploadMediaAttachmentStateType.uploaded,
      );

  @override
  Stream<UploadMediaAttachmentState> get uploadStateStream =>
      Stream.value(uploadState);

  @override
  Future<String?> calculateFilePath() async => unifediApiMediaAttachment.url;

  @override
  bool get isMedia => unifediApiMediaAttachment.typeAsUnifediApi.map(
        image: (_) => true,
        // ignore:no-equal-arguments
        gifv: (_) => true,
        // ignore:no-equal-arguments
        video: (_) => true,
        // ignore:no-equal-arguments
        audio: (_) => true,
        unknown: (_) => false,
      );

  @override
  int? get maximumFileSizeInBytes => null;

  @override
  void changeMetadata(UploadMediaAttachmentMetadata? metadata) {
    throw UnsupportedError('UploadMediaAttachmentUploadedBloc always uploaded');
  }

  @override
  UploadMediaAttachmentMetadata? get metadata =>
      unifediApiMediaAttachment.description != null
          ? UploadMediaAttachmentMetadata(
              description: unifediApiMediaAttachment.description,
            )
          : null;

  @override
  Stream<UploadMediaAttachmentMetadata?> get metadataStream =>
      Stream.value(metadata);

  @override
  bool get isUploaded => true;
}
