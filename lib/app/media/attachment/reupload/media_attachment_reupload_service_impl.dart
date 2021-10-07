import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentReuploadService extends DisposableOwner
    implements IMediaAttachmentReuploadService {
  final IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService;
  final IFilesCacheService filesCacheService;

  MediaAttachmentReuploadService({
    required this.unifediApiMediaAttachmentService,
    required this.filesCacheService,
  });

  @override
  Future<IUnifediApiMediaAttachment> reuploadMediaAttachment({
    required IUnifediApiMediaAttachment originalMediaAttachment,
  }) async {
    var url = originalMediaAttachment.url;

    var file = await filesCacheService.getImageByUrl(imageUrl: url!);

    var unifediApiMediaAttachment =
        await unifediApiMediaAttachmentService.uploadMedia(
      file: file,
      thumbnail: null,
      description: null,
      focus: null,
      processInBackground: null,
    );

    return unifediApiMediaAttachment;
  }
}
