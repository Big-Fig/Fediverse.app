import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account/account_model_helper.dart';
import 'database/chat_database_model_helper.dart';

Future<DbChatPopulatedWrapper> createTestChat(
    {@required String seed,
    String remoteId,
    int unread,
    DateTime updatedAt,
    DbAccountWrapper account}) async {
  account = account ?? await createTestAccount(seed: seed);
  var dbAccount = account.dbAccount;
  return DbChatPopulatedWrapper(DbChatPopulated(
    dbChat: await createTestDbChat(
        seed: seed,
        remoteId: remoteId,
        unread: unread,
        updatedAt: updatedAt,
        dbAccount: dbAccount),
    dbAccount: dbAccount,
  ));
}

void expectChat(IChat actual, IChat expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);
  expect(actual.unread, expected.unread);
  expect(actual.updatedAt, expected.updatedAt);
}
