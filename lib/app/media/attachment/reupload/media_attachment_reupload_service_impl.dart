import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';

class MediaAttachmentReuploadService extends DisposableOwner
    implements IMediaAttachmentReuploadService {
  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;
  final IFilesCacheService filesCacheService;

  MediaAttachmentReuploadService({
    required this.pleromaMediaAttachmentService,
    required this.filesCacheService,
  });

  @override
  Future<IPleromaApiMediaAttachment> reuploadMediaAttachment({
    required IPleromaApiMediaAttachment originalMediaAttachment,
  }) async {
    var url = originalMediaAttachment.url;

    var file = await filesCacheService.getImageByUrl(imageUrl: url);

    var pleromaApiMediaAttachment =
        await pleromaMediaAttachmentService.uploadMedia(file: file);

    return pleromaApiMediaAttachment;
  }
}
