// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';

import '../../../../date_time/date_time_test_helper.dart';
import '../../card/pleroma_api_card_test_helper.dart';
import '../../emoji/pleroma_api_emoji_test_helper.dart';
import '../../media/pleroma_api_media_test_helper.dart';

class PleromaApiChatMessageTestHelper {
  static PleromaApiChatMessage createTestPleromaApiChatMessage({
    required String seed,
  }) =>
      PleromaApiChatMessage(
        id: seed + "id",
        chatId: seed + "chatId",
        accountId: seed + "accountId",
        content: seed + "content",
        createdAt: DateTimeTestHelper.createTestDateTime(seed: seed),
        emojis: [
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(seed: seed + "1"),
          PleromaApiEmojiTestHelper.createTestPleromaApiEmoji(seed: seed + "2"),
        ],
        mediaAttachment:
            PleromaApiMediaTestHelper.createTestPleromaApiMediaAttachment(
          seed: seed,
        ),
        card: PleromaApiCardTestHelper.createTestPleromaApiCard(
          seed: seed,
        ),
      );

  static PleromaApiChatMessageSendData createTestPleromaApiChatMessageSendData({
    required String seed,
  }) =>
      PleromaApiChatMessageSendData(
        content: seed + "content",
        mediaId: seed + "mediaId",
        idempotencyKey: seed + "idempotencyKey",
      );
}
