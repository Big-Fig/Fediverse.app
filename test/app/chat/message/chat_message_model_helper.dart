import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/account_model_helper.dart';
import 'database/chat_message_database_model_helper.dart';

Function eq = const ListEquality().equals;

Future<DbPleromaChatMessagePopulatedWrapper> createTestChatMessage({
  required String seed,
  String? remoteId,
  DateTime? createdAt,
  String? chatRemoteId,
  DbAccountPopulatedWrapper? account,
}) async {
  account = account ?? await createTestAccount(seed: seed);
  var dbAccount = account.dbAccount;
  return DbPleromaChatMessagePopulatedWrapper(
    dbChatMessagePopulated: DbChatMessagePopulated(
      dbChatMessage: await createTestDbChatMessage(
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

void expectChatMessage(
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
      eq(
        actual.mediaAttachments,
        expected.mediaAttachments,
      ),
      true,
    );
    expect(actual.chatRemoteId, expected.chatRemoteId);

    expectAccount(actual.account, expected.account);
  }
}
