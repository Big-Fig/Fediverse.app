import 'package:fedi_app/app/account/repository/account_repository_impl.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatDatabaseMockHelper {
// ignore_for_file: no-magic-number
  static Future<DbChat> createTestDbChat({
    required String seed,
    String? remoteId,
    int? unread,
    DateTime? updatedAt,
    required DbAccount dbAccount,
  }) async =>
      DbChat(
        id: null,
        remoteId: remoteId ?? seed + 'remoteId1',
        unread: unread ?? seed.hashCode,
        updatedAt: updatedAt ?? DateTime(seed.hashCode % 2000),
        accountRemoteId: dbAccount.remoteId,
      );

  static Future<DbUnifediChatPopulated> createTestDbChatPopulated(
    DbChat dbChat,
    AccountRepository accountRepository,
  ) async {
    var dbChatPopulated = DbUnifediChatPopulated(
      dbChat: dbChat,
      dbAccount: (await accountRepository.findByRemoteIdInDbType(
        dbChat.accountRemoteId,
      ))!,
    );

    return dbChatPopulated;
  }

  static void expectDbChat(IUnifediChat? actual, DbChat? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);
    expect(actual.unread, expected.unread);
    expect(actual.updatedAt, expected.updatedAt);
  }
}
