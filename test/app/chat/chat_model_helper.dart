import 'package:fedi/app/chat/chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/chat_database_model_helper.dart';

Future<DbChatWrapper> createTestChat(
        {@required String seed,
        String remoteId,
        int unread,
        DateTime updatedAt}) async =>
    DbChatWrapper(await createTestDbChat(
        seed: seed, remoteId: remoteId, unread: unread, updatedAt: updatedAt));

void expectChat(IChat actual, IChat expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);
  expect(actual.unread, expected.unread);
  expect(actual.updatedAt, expected.updatedAt);
}
