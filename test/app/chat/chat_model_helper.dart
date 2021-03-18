import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account/account_model_helper.dart';
import 'database/chat_database_model_helper.dart';

Future<DbPleromaChatPopulatedWrapper> createTestChat(
    {required String seed,
    String? remoteId,
    int? unread,
    DateTime? updatedAt,
    DbAccountWrapper? account}) async {
  account = account ?? await createTestAccount(seed: seed);
  var dbAccount = account.dbAccount;
  return DbPleromaChatPopulatedWrapper(dbChatPopulated:DbPleromaChatPopulated(
    dbChat: await createTestDbChat(
        seed: seed,
        remoteId: remoteId,
        unread: unread,
        updatedAt: updatedAt,
        dbAccount: dbAccount),
    dbAccount: dbAccount,
  ));
}

void expectChat(IPleromaChat? actual, IPleromaChat? expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual!.remoteId, expected!.remoteId);
  expect(actual.unread, expected.unread);
  expect(actual.updatedAt, expected.updatedAt);
}
