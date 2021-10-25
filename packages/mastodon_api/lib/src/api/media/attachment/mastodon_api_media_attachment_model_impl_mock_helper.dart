// ignore_for_file: no-magic-number
import 'mastodon_api_media_attachment_model_impl.dart';
import 'meta/mastodon_api_media_attachment_meta_model_impl_mock_helper.dart';
import 'type/mastodon_api_media_attachment_type_sealed_mock_helper.dart';

class MastodonApiMediaAttachmentMockHelper {
  static MastodonApiMediaAttachment generate({
    required String seed,
  }) =>
      MastodonApiMediaAttachment(
        blurhash: seed + 'blurhash',
        description: seed + 'desc',
        id: seed + 'id',
        previewUrl: seed + 'previewUrl',
        remoteUrl: seed + 'remoteUrl',
        textUrl: seed + 'textUrl',
        type: MastodonApiMediaAttachmentTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        url: seed + 'url',
        meta: MastodonApiMediaAttachmentMetaMockHelper.generate(
          seed: seed + 'meta',
        ),
      );
}
