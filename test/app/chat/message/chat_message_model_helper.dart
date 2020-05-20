import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/account_model_helper.dart';
import 'database/chat_message_database_model_helper.dart';

Future<DbChatMessagePopulatedWrapper> createTestChatMessage(
    {@required String seed,
    String remoteId,
    DateTime createdAt,
    String chatRemoteId,
    DbAccountWrapper account}) async {
  account = account ?? await createTestAccount(seed: seed);
  var dbAccount = account.dbAccount;
  return DbChatMessagePopulatedWrapper(DbChatMessagePopulated(
    dbChatMessage: await createTestDbChatMessage(
        createdAt: createdAt,
        seed: seed,
        remoteId: remoteId,
        chatRemoteId: chatRemoteId,
        dbAccount: dbAccount),
    dbAccount: dbAccount,
  ));
}

void expectChatMessage(IChatMessage actual, IChatMessage expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);

  expect(actual.createdAt, expected.createdAt);

  expect(actual.content, expected.content);

  expect(actual.emojis, expected.emojis);
  expect(actual.mediaAttachment, expected.mediaAttachment);
  expect(actual.chatRemoteId, expected.chatRemoteId);

  expectAccount(actual.account, expected.account);
}
