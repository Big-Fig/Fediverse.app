import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';

class PleromaApiEmojiTestHelper {
  static PleromaApiEmoji createTestPleromaApiEmoji({
    required String seed,
  }) =>
      PleromaApiEmoji(
        shortcode: seed + "shortcode",
        url: seed + "url",
        staticUrl: seed + "staticUrl",
        // ignore: no-magic-number
        visibleInPicker: seed.hashCode % 2 == 0,
        category: seed + "category",
      );

  static PleromaApiCustomEmoji createTestPleromaApiCustomEmoji({
    required String seed,
  }) =>
      PleromaApiCustomEmoji(
        tags: [
          seed + "1",
          seed + "2",
        ],
        imageUrl: seed + "imageUrl",
        name: seed + "name",
      );
}
