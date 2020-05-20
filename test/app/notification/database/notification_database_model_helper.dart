import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/database/account_database_model_helper.dart';
import '../../status/database/status_database_model_helper.dart';

Future<DbNotification> createTestDbNotification({
  @required String seed,
  String remoteId,
  @required DbAccount dbAccount,
  DbStatus dbStatus,
  bool unread = false,
  DateTime createdAt  ,
  String type = "reblog",
}) async {
  DbNotification dbNotification = DbNotification(
      id: null,
      remoteId: remoteId ?? seed + "remoteId",
      createdAt: createdAt ?? DateTime(1),
      accountRemoteId: dbAccount.remoteId,
      statusRemoteId: dbStatus?.remoteId,
      unread: unread,
      type: type);
  return dbNotification;
}

void expectDbNotificationPopulated(
    INotification actual, DbNotificationPopulated expected) {
  expect(actual.localId != null, true);
  var dbNotification = expected.dbNotification;
  expectDbNotification(actual, dbNotification);

  expectDbAccount(actual.account, expected.dbAccount);
  expectDbStatusPopulated(actual.status, expected.dbStatusPopulated);
}

void expectDbNotification(INotification actual, DbNotification dbNotification) {
  expect(actual.remoteId, dbNotification.remoteId);

  expect(actual.status?.remoteId, dbNotification.statusRemoteId);

  expect(actual.createdAt, dbNotification.createdAt);
  expect(actual.type, dbNotification.type);
  expect(actual.chatMessageRemoteId, dbNotification.chatMessageRemoteId);
  expect(actual.chatRemoteId, dbNotification.chatRemoteId);
  expect(actual.unread, dbNotification.unread);
}

Future<DbNotificationPopulated> createTestNotificationPopulated(
    DbNotification dbNotification, AccountRepository accountRepository) async {
  DbNotificationPopulated dbNotificationPopulated = DbNotificationPopulated(
    dbNotification: dbNotification,
    dbAccount:
        (await accountRepository.findByRemoteId(dbNotification.accountRemoteId))
            .dbAccount,
    dbStatusPopulated: null,
  );
  return dbNotificationPopulated;
}
