import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class MediaAttachmentReuploadService extends DisposableOwner
    implements IMediaAttachmentReuploadService {
  final IPleromaApiMediaAttachmentService pleromaMediaAttachmentService;
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
