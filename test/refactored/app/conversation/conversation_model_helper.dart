import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'database/conversation_database_model_helper.dart';

Future<DbConversationWrapper> createTestConversation(
        {@required String seed, String remoteId}) async =>
    DbConversationWrapper(
        await createTestDbConversation(seed: seed, remoteId: remoteId));

expectConversation(IConversation actual, IConversation expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);
  expect(actual.unread, expected.unread);
}
