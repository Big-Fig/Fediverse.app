import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';

class MediaAttachmentCantAddToGalleryException implements Exception {
  final IMastodonApiMediaAttachment? mediaAttachment;
  MediaAttachmentCantAddToGalleryException(this.mediaAttachment);
}