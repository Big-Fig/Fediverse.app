import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';

class NotificationDatabaseTestHelper {
  static Future<DbNotification> createTestDbNotification({
    required String seed,
    String? remoteId,
    required DbAccount dbAccount,
    DbStatus? dbStatus,
    bool unread = false,
    DateTime? createdAt,
    String type = 'reblog',
  }) async {
    var dbNotification = DbNotification(
      id: null,
      remoteId: remoteId ?? seed + 'remoteId',
      createdAt: createdAt ?? DateTime(1),
      accountRemoteId: dbAccount.remoteId,
      statusRemoteId: dbStatus?.remoteId,
      unread: unread,
      type: type,
      dismissed: false,
    );

    return dbNotification;
  }

  static void expectDbNotificationPopulated(
    INotification actual,
    DbNotificationPopulated expected,
  ) {
    expect(actual.localId != null, true);
    var dbNotification = expected.dbNotification;
    NotificationDatabaseTestHelper.expectDbNotification(actual, dbNotification);

    AccountDatabaseTestHelper.expectDbAccount(
      actual.account,
      expected.dbAccount,
    );
    StatusDatabaseTestHelper.expectDbStatusPopulated(
      actual.status,
      expected.dbStatusPopulated,
    );
  }

  static void expectDbNotification(
    INotification actual,
    DbNotification dbNotification,
  ) {
    expect(
      actual.remoteId,
      dbNotification.remoteId,
    );

    expect(
      actual.status?.remoteId,
      dbNotification.statusRemoteId,
    );

    expect(
      actual.createdAt,
      dbNotification.createdAt,
    );
    expect(
      actual.type,
      dbNotification.type,
    );
    expect(
      actual.chatMessageRemoteId,
      dbNotification.chatMessageRemoteId,
    );
    expect(
      actual.chatRemoteId,
      dbNotification.chatRemoteId,
    );
    expect(
      actual.unread,
      dbNotification.unread,
    );
    expect(
      actual.target,
      dbNotification.target,
    );

    expect(
      actual.report,
      dbNotification.report,
    );

    expect(
      actual.chatMessage,
      dbNotification.chatMessage,
    );
  }

  static Future<DbNotificationPopulated> createTestNotificationPopulated(
    DbNotification dbNotification,
    AccountRepository accountRepository,
  ) async {
    var dbNotificationPopulated = DbNotificationPopulated(
      dbNotification: dbNotification,
      dbAccount: (await accountRepository.findByRemoteIdInDbType(
        dbNotification.accountRemoteId!,
      ))!,
      reblogDbStatus: null,
      replyReblogDbStatus: null,
      replyDbStatus: null,
      replyReblogDbStatusAccount: null,
      dbStatusAccount: null,
      reblogDbStatusAccount: null,
      dbStatus: null,
      replyDbStatusAccount: null,
    );

    return dbNotificationPopulated;
  }
}
