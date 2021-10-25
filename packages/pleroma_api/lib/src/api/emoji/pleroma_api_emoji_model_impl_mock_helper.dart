import 'pleroma_api_emoji_model_impl.dart';

class PleromaApiEmojiMockHelper {
  static PleromaApiEmoji generate({
    required String seed,
  }) =>
      PleromaApiEmoji(
        shortcode: seed + 'shortcode',
        url: seed + 'url',
        staticUrl: seed + 'staticUrl',
        // ignore: no-magic-number
        visibleInPicker: seed.hashCode % 2 == 0,
        category: seed + 'category',
      );
}
