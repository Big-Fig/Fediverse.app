// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../card/pleroma_api_card_model_impl_mock_helper.dart';
import '../../emoji/pleroma_api_emoji_model_impl_mock_helper.dart';
import '../../media/attachment/pleroma_api_media_attachment_model_impl_mock_helper.dart';
import 'pleroma_api_chat_message_model_impl.dart';

class PleromaApiChatMessageMockHelper {
  static PleromaApiChatMessage generate({
    required String seed,
  }) =>
      PleromaApiChatMessage(
        id: seed + 'id',
        chatId: seed + 'chatId',
        accountId: seed + 'accountId',
        content: seed + 'content',
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        emojis: [
          PleromaApiEmojiMockHelper.generate(seed: seed + '1'),
          PleromaApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        mediaAttachment: PleromaApiMediaAttachmentMockHelper.generate(
          seed: seed,
        ),
        card: PleromaApiCardMockHelper.generate(
          seed: seed + 'card',
        ),
      );
}
