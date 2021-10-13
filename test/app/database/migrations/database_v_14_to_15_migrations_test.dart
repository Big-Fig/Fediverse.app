import 'dart:io';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../account/account_test_helper.dart';
import '../../chat/message/chat_message_test_helper.dart';
import '../../notification/database/notification_database_test_helper.dart';
import '../../status/status_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword

void main() {
  late AppDatabase database;
  late File dbFile;

  late INotificationRepository notificationRepository;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;
  late IPleromaChatMessageRepository chatMessageRepository;

  late DbAccountPopulatedWrapper account1;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v14.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + '.temp');
    database = AppDatabase(VmDatabase(dbFile));

    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    notificationRepository = NotificationRepository(
      appDatabase: database,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      chatMessageRepository: chatMessageRepository,
    );

    account1 =
        await AccountMockHelper.createTestAccount(seed: 'reportAccount1');
    await accountRepository.upsertInRemoteType(account1.toUnifediApiAccount());
  });

  tearDown(() async {
    await notificationRepository.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await statusRepository.dispose();
    await database.close();
    await dbFile.delete();

    expect(database.migrationsFromExecuted, 14);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v14->v15 notification report', () async {
    var notificationDao = database.notificationDao;

    await notificationDao.clear(batchTransaction: null);

    expect((await notificationDao.getAll()).isNotEmpty, false);

    var testDbNotification =
        await NotificationDatabaseMockHelper.createTestDbNotification(
      seed: 'seed1',
      dbAccount: account1.dbAccount,
    );

    testDbNotification = testDbNotification.copyWith(
      report: UnifediApiAccountReport(
        account: account1.toUnifediApiAccount(),
        statuses: [
          (await StatusMockHelper.createTestStatus(seed: 'status1'))
              .toUnifediApiStatus(),
          (await StatusMockHelper.createTestStatus(seed: 'status2'))
              .toUnifediApiStatus(),
        ],
        user: (await AccountMockHelper.createTestAccount(seed: 'reportUser'))
            .toUnifediApiAccount(),
      ),
    );
    await notificationDao.insert(
      entity: testDbNotification,
      mode: null,
    );
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(testDbNotification.remoteId))!,
      testDbNotification,
    );
  });

  test('test dbMigration v14->v15 notification target', () async {
    var notificationDao = database.notificationDao;

    await notificationDao.clear(batchTransaction: null);

    expect((await notificationDao.getAll()).isNotEmpty, false);

    var testDbNotification =
        await NotificationDatabaseMockHelper.createTestDbNotification(
      seed: 'seed1',
      dbAccount: account1.dbAccount,
    );

    testDbNotification = testDbNotification.copyWith(
      target: account1.toUnifediApiAccount(),
    );
    await notificationDao.insert(
      entity: testDbNotification,
      mode: null,
    );
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(testDbNotification.remoteId))!,
      testDbNotification,
    );
  });
  test('test dbMigration v14->v15 notification chatMessage', () async {
    var notificationDao = database.notificationDao;

    await notificationDao.clear(batchTransaction: null);

    expect((await notificationDao.getAll()).isNotEmpty, false);

    var testDbNotification =
        await NotificationDatabaseMockHelper.createTestDbNotification(
      seed: 'seed1',
      dbAccount: account1.dbAccount,
    );

    testDbNotification = testDbNotification.copyWith(
      chatMessage:
          (await ChatMessageMockHelper.createTestChatMessage(seed: 'seed1'))
              .toUnifediApiChatMessage(),
    );
    await notificationDao.insert(
      entity: testDbNotification,
      mode: null,
    );
    NotificationDatabaseMockHelper.expectDbNotification(
      (await notificationRepository
          .findByRemoteIdInAppType(testDbNotification.remoteId))!,
      testDbNotification,
    );
  });
}
