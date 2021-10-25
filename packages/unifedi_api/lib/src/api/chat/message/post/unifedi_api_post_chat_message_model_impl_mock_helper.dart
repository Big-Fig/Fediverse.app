// ignore_for_file: no-magic-number
import 'unifedi_api_post_chat_message_model_impl.dart';

class UnifediApiPostChatMessageMockHelper {
  static UnifediApiPostChatMessage generate({
    required String seed,
  }) =>
      UnifediApiPostChatMessage(
        content: seed + 'content',
        mediaId: seed + 'mediaId',
      );
}
