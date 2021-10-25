import 'mastodon_api_emoji_model_impl.dart';

class MastodonApiEmojiMockHelper {
  static MastodonApiEmoji generate({
    required String seed,
  }) =>
      MastodonApiEmoji(
        shortcode: seed + 'shortcode',
        url: seed + 'url',
        staticUrl: seed + 'staticUrl',
        // ignore: no-magic-number
        visibleInPicker: seed.hashCode % 2 == 0,
        category: seed + 'category',
      );
}
