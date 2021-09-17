

class MediaAttachmentCantAddToGalleryException implements Exception {
  final IUnifediApiMediaAttachment? mediaAttachment;
  MediaAttachmentCantAddToGalleryException(this.mediaAttachment);
}
