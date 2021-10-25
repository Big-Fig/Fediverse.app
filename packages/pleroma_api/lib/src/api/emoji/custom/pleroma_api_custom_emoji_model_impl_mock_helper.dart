import 'pleroma_api_custom_emoji_model_impl.dart';

class PleromaApiCustomEmojiMockHelper {
  static PleromaApiCustomEmoji generate({
    required String seed,
  }) =>
      PleromaApiCustomEmoji(
        tags: [
          seed + '1',
          seed + '2',
        ],
        imageUrl: seed + 'imageUrl',
        name: seed + 'name',
      );
}
