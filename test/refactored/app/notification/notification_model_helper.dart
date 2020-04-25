import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account/account_model_helper.dart';
import '../status/status_model_helper.dart';
import 'database/notification_database_model_helper.dart';

Future<DbNotificationPopulatedWrapper> createTestNotification(
    {@required String seed,
    String remoteId,
    DbAccountWrapper account,
    DbStatusPopulated status}) async {
  account = account ?? await createTestAccount(seed: seed);
  var dbAccount = account.dbAccount;
  return DbNotificationPopulatedWrapper(DbNotificationPopulated(
    dbNotification: await createTestDbNotification(
        seed: seed, remoteId: remoteId, dbAccount: dbAccount),
    dbAccount: dbAccount,
    dbStatusPopulated: status,
  ));
}

expectNotification(INotification actual, INotification expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);

  expect(actual.createdAt, expected.createdAt);
  expect(actual.type, expected.type);
  expect(actual.unread, expected.unread);
  expectAccount(actual.account, expected.account);
  expectStatus(actual.status, expected.status);
}
