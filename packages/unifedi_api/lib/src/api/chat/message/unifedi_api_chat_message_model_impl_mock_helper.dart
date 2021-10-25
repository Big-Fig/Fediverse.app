// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../../card/unifedi_api_card_model_impl_mock_helper.dart';
import '../../emoji/unifedi_api_emoji_model_impl_mock_helper.dart';
import '../../media/attachment/unifedi_api_media_attachment_model_impl_mock_helper.dart';
import 'unifedi_api_chat_message_model_impl.dart';

class UnifediApiChatMessageMockHelper {
  static UnifediApiChatMessage generate({
    required String seed,
  }) =>
      UnifediApiChatMessage(
        id: seed + 'id',
        chatId: seed + 'chatId',
        accountId: seed + 'accountId',
        content: seed + 'content',
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        emojis: [
          UnifediApiEmojiMockHelper.generate(seed: seed + '1'),
          UnifediApiEmojiMockHelper.generate(seed: seed + '2'),
        ],
        mediaAttachment: UnifediApiMediaAttachmentMockHelper.generate(
          seed: seed,
        ),
        card: UnifediApiCardMockHelper.generate(
          seed: seed + 'card',
        ),
      );
}
