import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentCantAddToGalleryException implements Exception {
  final IUnifediApiMediaAttachment? mediaAttachment;
  MediaAttachmentCantAddToGalleryException(this.mediaAttachment);
}
