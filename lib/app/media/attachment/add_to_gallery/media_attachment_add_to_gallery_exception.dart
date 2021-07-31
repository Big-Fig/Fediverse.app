import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';

class MediaAttachmentCantAddToGalleryException implements Exception {
  final IMastodonApiMediaAttachment? mediaAttachment;
  MediaAttachmentCantAddToGalleryException(this.mediaAttachment);
}
