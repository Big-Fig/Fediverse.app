import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/conversation_database_test_helper.dart';

class ConversationMockHelper {
  static Future<DbConversationChatPopulatedWrapper> createTestConversation({
    required String seed,
    String? remoteId,
  }) async =>
      DbConversationChatPopulatedWrapper(
        dbConversationPopulated: DbConversationPopulated(
          dbConversation:
              await ConversationDatabaseMockHelper.createTestDbConversation(
            seed: seed,
            remoteId: remoteId,
          ),
        ),
      );

  static void expectConversation(
    IConversationChat? actual,
    IConversationChat? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);
    expect(actual.unread, expected.unread);
  }
}
