// ignore_for_file: no-magic-number
import '../focus/mastodon_api_media_attachment_focus_model_impl_mock_helper.dart';
import '../size/mastodon_api_media_attachment_size_model_impl_mock_helper.dart';
import 'mastodon_api_media_attachment_meta_model_impl.dart';

class MastodonApiMediaAttachmentMetaMockHelper {
  static MastodonApiMediaAttachmentMeta generate({
    required String seed,
  }) =>
      MastodonApiMediaAttachmentMeta(
        focus: MastodonApiMediaAttachmentFocusMockHelper.generate(
          seed: seed + 'focus',
        ),
        original: MastodonApiMediaAttachmentSizeMockHelper.generate(
          seed: seed + 'original',
        ),
        small: MastodonApiMediaAttachmentSizeMockHelper.generate(
          seed: seed + 'small',
        ),
      );
}
