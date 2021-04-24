import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/account_test_helper.dart';
import 'database/chat_message_database_test_helper.dart';

Function _eq = const ListEquality().equals;

class ChatMessageTestHelper {
  static Future<DbPleromaChatMessagePopulatedWrapper> createTestChatMessage({
    required String seed,
    String? remoteId,
    DateTime? createdAt,
    String? chatRemoteId,
    DbAccountPopulatedWrapper? account,
  }) async {
    account = account ?? await AccountTestHelper.createTestAccount(seed: seed);
    var dbAccount = account.dbAccount;
    return DbPleromaChatMessagePopulatedWrapper(
      dbChatMessagePopulated: DbChatMessagePopulated(
        dbChatMessage:
            await ChatMessageDatabaseTestHelper.createTestDbChatMessage(
          createdAt: createdAt,
          seed: seed,
          remoteId: remoteId,
          chatRemoteId: chatRemoteId,
          dbAccount: dbAccount,
        ),
        dbAccount: dbAccount,
      ),
    );
  }

  static void expectChatMessage(
    IPleromaChatMessage? actual,
    IPleromaChatMessage? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    if (actual != null) {
      expect(actual.remoteId, expected!.remoteId);

      expect(actual.createdAt, expected.createdAt);

      expect(actual.content, expected.content);

      expect(actual.emojis, expected.emojis);
      expect(
        _eq(
          actual.mediaAttachments,
          expected.mediaAttachments,
        ),
        true,
      );
      expect(actual.chatRemoteId, expected.chatRemoteId);

      AccountTestHelper.expectAccount(actual.account, expected.account);
    }
  }
}
