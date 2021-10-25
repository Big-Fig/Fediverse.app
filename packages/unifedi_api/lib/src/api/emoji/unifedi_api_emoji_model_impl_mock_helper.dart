import 'unifedi_api_emoji_model_impl.dart';

class UnifediApiEmojiMockHelper {
  static UnifediApiEmoji generate({
    required String seed,
  }) =>
      UnifediApiEmoji(
        name: seed + 'name',
        url: seed + 'url',
        staticUrl: seed + 'staticUrl',
        // ignore: no-magic-number
        visibleInPicker: seed.hashCode % 2 == 0,
        tags: [
          seed + 'tag1',
          seed + 'tag2',
        ],
      );
}
