import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbConversation> createTestConversation({@required String seed}) async =>
    DbConversation(
      id: null,
      remoteId: seed + "remoteId1",
      unread: false,
    );

expectDbConversation(IConversation actual, DbConversation expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.localId != null, true);
  expect(actual.remoteId, expected.remoteId);
  expect(actual.unread, expected.unread);
}

DbConversationWrapper createFakeConversationWithRemoteId(String remoteId) {
  return DbConversationWrapper(
      DbConversation(id: null, remoteId: remoteId, unread: false));
}
