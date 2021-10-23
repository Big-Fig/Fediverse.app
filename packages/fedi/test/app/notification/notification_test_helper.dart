import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account/account_test_helper.dart';
import '../status/status_test_helper.dart';
import 'database/notification_database_test_helper.dart';

class NotificationMockHelper {
  static Future<DbNotificationPopulatedWrapper> createTestNotification({
    required String seed,
    String? remoteId,
    DbAccountPopulatedWrapper? account,
    DbStatusPopulated? status,
    DateTime? createdAt,
  }) async {
    var actualAccount =
        account ?? await AccountMockHelper.createTestAccount(seed: seed);
    var dbAccount = actualAccount.dbAccount;

    return DbNotificationPopulatedWrapper(
      dbNotificationPopulated: DbNotificationPopulated.statusPopulated(
        dbNotification:
            await NotificationDatabaseMockHelper.createTestDbNotification(
          seed: seed,
          remoteId: remoteId,
          dbAccount: dbAccount,
          createdAt: createdAt,
        ),
        dbAccount: dbAccount,
        dbStatusPopulated: status,
      ),
    );
  }

  static void expectNotification(
    INotification? actual,
    INotification? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);

    expect(actual.createdAt, expected.createdAt);
    expect(actual.type, expected.type);
    expect(actual.unread, expected.unread);
    expect(actual.chatMessageRemoteId, expected.chatMessageRemoteId);
    expect(actual.chatRemoteId, expected.chatRemoteId);
    AccountMockHelper.expectAccount(actual.account, expected.account);
    StatusMockHelper.expectStatus(actual.status, expected.status);
  }
}
