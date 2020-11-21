import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbConversation> createTestDbConversation(
        {@required String seed, String remoteId}) async =>
    DbConversation(
      id: null,
      remoteId: remoteId ?? seed + "remoteId1",
      unread: false,
    );

void expectDbConversation(IConversationChat actual, DbConversation expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.localId != null, true);
  expect(actual.remoteId, expected.remoteId);
  expect(actual.unread > 0, expected.unread);
}
