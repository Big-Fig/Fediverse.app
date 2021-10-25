// ignore_for_file: no-magic-number
import 'mastodon_api_media_attachment_focus_model_impl.dart';

class MastodonApiMediaAttachmentFocusMockHelper {
  static MastodonApiMediaAttachmentFocus generate({
    required String seed,
  }) =>
      MastodonApiMediaAttachmentFocus(
        x: seed.hashCode + 1,
        y: seed.hashCode + 2,
      );
}
