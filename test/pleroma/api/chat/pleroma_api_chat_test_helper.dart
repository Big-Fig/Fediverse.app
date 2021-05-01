// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';

import '../../../date_time/date_time_test_helper.dart';
import '../account/pleroma_api_account_test_helper.dart';
import 'message/pleroma_api_chat_message_test_helper.dart';

class PleromaApiChatTestHelper {
  static PleromaApiChat createTestPleromaApiChat({
    required String seed,
  }) =>
      PleromaApiChat(
        id: seed + "id",
        unread: seed.hashCode % 10,
        account:
            PleromaApiAccountTestHelper.createTestPleromaApiAccount(seed: seed),
        updatedAt: DateTimeTestHelper.createTestDateTime(seed: seed),
        lastMessage:
            PleromaApiChatMessageTestHelper.createTestPleromaApiChatMessage(
          seed: seed,
        ),
      );
}
