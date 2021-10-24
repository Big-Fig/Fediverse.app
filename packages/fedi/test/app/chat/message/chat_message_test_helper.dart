import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/account_test_helper.dart';
import 'database/chat_message_database_test_helper.dart';

class ChatMessageMockHelper {
  static Future<DbUnifediChatMessagePopulatedWrapper> createTestChatMessage({
    required String seed,
    String? remoteId,
    DateTime? createdAt,
    String? chatRemoteId,
    DbAccountPopulatedWrapper? account,
  }) async {
    var actualAccount =
        account ?? await AccountMockHelper.createTestAccount(seed: seed);
    var dbAccount = actualAccount.dbAccount;

    return DbUnifediChatMessagePopulatedWrapper(
      dbChatMessagePopulated: DbChatMessagePopulated(
        dbChatMessage:
            await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
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
    IUnifediChatMessage? actual,
    IUnifediChatMessage? expected,
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
        listEquals(
          actual.mediaAttachments,
          expected.mediaAttachments,
        ),
        true,
      );
      expect(actual.chatRemoteId, expected.chatRemoteId);

      AccountMockHelper.expectAccount(actual.account, expected.account);
    }
  }
}
