// ignore_for_file: no-magic-number
import 'mastodon_api_media_attachment_size_model_impl.dart';

class MastodonApiMediaAttachmentSizeMockHelper {
  static MastodonApiMediaAttachmentSize generate({
    required String seed,
  }) =>
      MastodonApiMediaAttachmentSize(
        width: seed.hashCode + 1,
        height: seed.hashCode + 2,
        size: seed + 'size',
        aspect: seed.hashCode / 3,
      );
}
