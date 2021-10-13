import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../chat/message/database/chat_message_database_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late AppDatabase database;
  late File dbFile;
  late DbAccount dbAccount;

  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v13.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + '.temp');
    database = AppDatabase(VmDatabase(dbFile, logStatements: false));
    dbAccount =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed');
    await database.accountDao.insert(entity: dbAccount, mode: null);
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    expect(database.migrationsFromExecuted, 13);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v13->v14 dbStatus hiddenLocallyOnDevice', () async {
    var statusDao = database.statusDao;

    await statusDao.clear(batchTransaction: null);

    expect((await statusDao.getAll()).isNotEmpty, false);

    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seed1',
      dbAccount: dbAccount,
    );

    var hiddenLocallyOnDevice = false;
    dbStatus = dbStatus.copyWith(
      hiddenLocallyOnDevice: hiddenLocallyOnDevice,
    );

    await statusDao.insert(entity: dbStatus, mode: null);

    var all = await statusDao.getAll();
    expect(all.length, 1);

    var findByRemoteId =
        await statusDao.findByRemoteIdPopulated(dbStatus.remoteId);

    var actual = findByRemoteId?.dbStatus;
    expect(
      actual?.hiddenLocallyOnDevice,
      hiddenLocallyOnDevice,
    );

    await statusDao.updateByRemoteId(
      dbStatus.remoteId,
      dbStatus.copyWith(
        hiddenLocallyOnDevice: true,
      ),
    );

    expect((await statusDao.getAll()).length, 1);

    expect(
      (await statusDao.findByRemoteIdPopulated(dbStatus.remoteId))
          ?.dbStatus
          .hiddenLocallyOnDevice,
      true,
    );
  });

  test(
    'test dbMigration v13->v14 dbStatus wasSentWithIdempotencyKey',
    () async {
      var statusDao = database.statusDao;

      await statusDao.clear(batchTransaction: null);

      expect((await statusDao.getAll()).isNotEmpty, false);

      var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
        seed: 'seed1',
        dbAccount: dbAccount,
      );

      var wasSentWithIdempotencyKey = 'wasSentWithIdempotencyKey1';
      dbStatus = dbStatus.copyWith(
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
      );

      await statusDao.insert(entity: dbStatus, mode: null);

      var all = await statusDao.getAll();
      expect(all.length, 1);

      var findByRemoteId =
          await statusDao.findByRemoteIdPopulated(dbStatus.remoteId);

      var actual = findByRemoteId?.dbStatus;
      expect(
        actual?.wasSentWithIdempotencyKey,
        wasSentWithIdempotencyKey,
      );

      await statusDao.updateByRemoteId(
        dbStatus.remoteId,
        dbStatus.copyWith(
          wasSentWithIdempotencyKey: 'wasSentWithIdempotencyKey2',
        ),
      );

      expect((await statusDao.getAll()).length, 1);

      expect(
        (await statusDao.findByRemoteIdPopulated(dbStatus.remoteId))
            ?.dbStatus
            .wasSentWithIdempotencyKey,
        'wasSentWithIdempotencyKey2',
      );
    },
  );
  test(
    'test dbMigration v13->v14 dbChatMessage hiddenLocallyOnDevice',
    () async {
      var chatMessageDao = database.chatMessageDao;

      await chatMessageDao.clear(batchTransaction: null);

      expect((await chatMessageDao.getAll()).isNotEmpty, false);

      var dbChatMessage =
          await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      );

      var hiddenLocallyOnDevice = false;
      dbChatMessage = dbChatMessage.copyWith(
        hiddenLocallyOnDevice: hiddenLocallyOnDevice,
      );

      await chatMessageDao.insert(entity: dbChatMessage, mode: null);

      var all = await chatMessageDao.getAll();
      expect(all.length, 1);

      var findByRemoteId =
          await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId);

      var actual = findByRemoteId?.dbChatMessage;
      expect(
        actual?.hiddenLocallyOnDevice,
        hiddenLocallyOnDevice,
      );

      await chatMessageDao.updateByRemoteId(
        dbChatMessage.remoteId,
        dbChatMessage.copyWith(
          hiddenLocallyOnDevice: true,
        ),
      );

      expect((await chatMessageDao.getAll()).length, 1);

      expect(
        (await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId))
            ?.dbChatMessage
            .hiddenLocallyOnDevice,
        true,
      );
    },
  );

  test(
    'test dbMigration v13->v14 dbChatMessage wasSentWithIdempotencyKey',
    () async {
      var chatMessageDao = database.chatMessageDao;

      await chatMessageDao.clear(batchTransaction: null);

      expect((await chatMessageDao.getAll()).isNotEmpty, false);

      var dbChatMessage =
          await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
        seed: 'seed1',
        dbAccount: dbAccount,
      );

      var wasSentWithIdempotencyKey = 'wasSentWithIdempotencyKey1';
      dbChatMessage = dbChatMessage.copyWith(
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
      );

      await chatMessageDao.insert(entity: dbChatMessage, mode: null);

      var all = await chatMessageDao.getAll();
      expect(all.length, 1);

      var findByRemoteId =
          await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId);

      var actual = findByRemoteId?.dbChatMessage;
      expect(
        actual?.wasSentWithIdempotencyKey,
        wasSentWithIdempotencyKey,
      );

      await chatMessageDao.updateByRemoteId(
        dbChatMessage.remoteId,
        dbChatMessage.copyWith(
          wasSentWithIdempotencyKey: 'wasSentWithIdempotencyKey2',
        ),
      );

      expect((await chatMessageDao.getAll()).length, 1);

      expect(
        (await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId))
            ?.dbChatMessage
            .wasSentWithIdempotencyKey,
        'wasSentWithIdempotencyKey2',
      );
    },
  );
}
