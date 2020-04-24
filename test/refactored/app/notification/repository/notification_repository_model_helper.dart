import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/database/account_database_model_helper.dart';
import '../../account/repository/account_repository_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';
import '../../status/repository/status_repository_model_helper.dart';


Future<DbNotification> createTestNotification({
  @required String seed,
  @required DbAccount dbAccount,
  DbStatus dbStatus,
  bool unread = false,
  MastodonNotificationType type = MastodonNotificationType.reblog,
}) async {
  DbNotification dbNotification = DbNotification(
      id: null,
      remoteId: seed + "remoteId",
      createdAt: DateTime(1),
      accountRemoteId: dbAccount.remoteId,
      statusRemoteId: dbStatus?.remoteId,
      unread: unread,
      type: type);
  return dbNotification;
}

expectDbNotificationPopulated(
    INotification actual, DbNotificationPopulated expected) {
  expect(actual.localId != null, true);
  var dbNotification = expected.notification;
  expectDbNotification(actual, dbNotification);

  expectDbAccount(actual.account, expected.account);
  expectDbStatusPopulated(actual.status, expected.statusPopulated);
}

void expectDbNotification(INotification actual, DbNotification dbNotification) {
  expect(actual.remoteId, dbNotification.remoteId);

  expect(actual.createdAt, dbNotification.createdAt);
  expect(actual.type, dbNotification.type);
  expect(actual.unread, dbNotification.unread);
}

DbNotificationPopulatedWrapper createFakePopulatedNotificationWithRemoteId(
    String remoteId) {
  return DbNotificationPopulatedWrapper(DbNotificationPopulated(
      notification: DbNotification(
          remoteId: remoteId,
          accountRemoteId: null,
          id: null,
          createdAt: null),
      account: null, statusPopulated: null));
}

Future<DbNotificationPopulated> createTestNotificationPopulated(
    DbNotification dbNotification, AccountRepository accountRepository) async {
  DbNotificationPopulated dbNotificationPopulated = DbNotificationPopulated(
    notification: dbNotification,
    account:
        (await accountRepository.findByRemoteId(dbNotification.accountRemoteId))
            .dbAccount, statusPopulated: null,

  );
  return dbNotificationPopulated;
}

void expectActualNotification(
    DbNotificationPopulated actualNotificationPopulated,
    DbNotification dbNotification,
    DbAccount dbAccount) {
  var actualNotification = actualNotificationPopulated.notification;
  expect(actualNotification, dbNotification);
  expect(actualNotificationPopulated.account, dbAccount);
}

Future<DbNotification> insertDbNotification(
  NotificationRepository notificationRepository,
  DbNotification notificationData,
) async {
  var id = await notificationRepository.insert(notificationData);
  assert(id != null, true);
  var dbNotification = notificationData.copyWith(id: id);
  return dbNotification;
}
