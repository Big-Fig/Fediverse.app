import '../../mastodon_api_model.dart';
import 'meta/mastodon_api_media_attachment_meta_model.dart';
import 'type/mastodon_api_media_attachment_type_sealed.dart';

abstract class IMastodonApiMediaAttachment implements IMastodonApiResponse {
  String? get description;

  String get id;

  String? get previewUrl;

  String? get remoteUrl;

  String? get textUrl;

  String get type;

  String? get url;

  String? get blurhash;

  IMastodonApiMediaAttachmentMeta? get meta;
}

extension IMastodonApiMediaAttachmentTypeExtension
    on IMastodonApiMediaAttachment {
  MastodonApiMediaAttachmentType get typeAsMastodonApi =>
      type.toMastodonApiMediaAttachmentType();
}
