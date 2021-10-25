import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account/account_test_helper.dart';
import 'database/chat_database_test_helper.dart';

class ChatMockHelper {
  static Future<DbUnifediChatPopulatedWrapper> createTestChat({
    required String seed,
    String? remoteId,
    int? unread,
    DateTime? updatedAt,
    DbAccountPopulatedWrapper? account,
  }) async {
    var actualAccount =
        account ?? await AccountMockHelper.createTestAccount(seed: seed);
    var dbAccount = actualAccount.dbAccount;

    return DbUnifediChatPopulatedWrapper(
      dbChatPopulated: DbUnifediChatPopulated(
        dbChat: await ChatDatabaseMockHelper.createTestDbChat(
          seed: seed,
          remoteId: remoteId,
          unread: unread,
          updatedAt: updatedAt,
          dbAccount: dbAccount,
        ),
        dbAccount: dbAccount,
      ),
    );
  }

  static void expectChat(IUnifediChat? actual, IUnifediChat? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);
    expect(actual.unread, expected.unread);
    expect(actual.updatedAt, expected.updatedAt);
  }
}
