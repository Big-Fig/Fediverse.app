// ignore_for_file: no-magic-number
import 'pleroma_api_post_chat_message_model_impl.dart';

class PleromaApiPostChatMessageMockHelper {
  static PleromaApiPostChatMessage generate({
    required String seed,
  }) =>
      PleromaApiPostChatMessage(
        content: seed + 'content',
        mediaId: seed + 'mediaId',
      );
}
