import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/media/attachment/upload/metadata/upload_media_attachment_metadata_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class UploadedUploadMediaAttachmentBloc extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  @override
  final IPleromaApiMediaAttachment pleromaMediaAttachment;

  UploadedUploadMediaAttachmentBloc({
    required this.pleromaMediaAttachment,
  });

  @override
  Future startUpload() async {
    throw UnsupportedError('UploadMediaAttachmentUploadedBloc always uploaded');
  }

  @override
  UploadMediaAttachmentState get uploadState => UploadMediaAttachmentState(
        type: UploadMediaAttachmentStateType.uploaded,
      );

  @override
  Stream<UploadMediaAttachmentState> get uploadStateStream =>
      Stream.value(uploadState);

  @override
  Future<String?> calculateFilePath() async => pleromaMediaAttachment.url;

  @override
  bool get isMedia {
    switch (pleromaMediaAttachment.typeAsMastodonApi) {
      case MastodonApiMediaAttachmentType.image:
      case MastodonApiMediaAttachmentType.gifv:
      case MastodonApiMediaAttachmentType.video:
      case MastodonApiMediaAttachmentType.audio:
        return true;
      case MastodonApiMediaAttachmentType.unknown:
      default:
        return false;
    }
  }

  @override
  int? get maximumFileSizeInBytes => null;

  @override
  void changeMetadata(UploadMediaAttachmentMetadata? metadata) {
    throw UnsupportedError('UploadMediaAttachmentUploadedBloc always uploaded');
  }

  @override
  UploadMediaAttachmentMetadata? get metadata =>
      pleromaMediaAttachment.description != null
          ? UploadMediaAttachmentMetadata(
              description: pleromaMediaAttachment.description,
            )
          : null;

  @override
  Stream<UploadMediaAttachmentMetadata?> get metadataStream =>
      Stream.value(metadata);

  @override
  bool get isUploaded => true;
}
