import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_media_attachment_model.dart';

class UploadedUploadMediaAttachmentBloc extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  @override
  final IPleromaMediaAttachment pleromaMediaAttachment;

  UploadedUploadMediaAttachmentBloc({
    required this.pleromaMediaAttachment,
  });

  @override
  Future startUpload() async {
    throw UnsupportedError("UploadMediaAttachmentUploadedBloc always uploaded");
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
    switch (pleromaMediaAttachment.typeMastodon) {
      case MastodonMediaAttachmentType.image:
      case MastodonMediaAttachmentType.gifv:
      case MastodonMediaAttachmentType.video:
      case MastodonMediaAttachmentType.audio:
        return true;
      case MastodonMediaAttachmentType.unknown:
      default:
        return false;
    }
  }

  @override
  int? get maximumFileSizeInBytes => null;
}
