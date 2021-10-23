import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../chat/message/database/chat_message_database_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late AppDatabase database;
  late File dbFile;
  late DbAccount dbAccount;

  setUp(() async {
    // we don't have v11 dump because v11 and v12 was made in single commit
    var filePath = 'test_resources/app/database/fedi2_database_dump_v10.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + '.temp');
    database = AppDatabase(VmDatabase(dbFile));
    dbAccount =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed');
    await database.accountDao.insert(entity: dbAccount, mode: null);
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    expect(database.migrationsFromExecuted, 10);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v10->v11 dbStatus pendingState', () async {
    var statusDao = database.statusDao;

    await statusDao.clear(batchTransaction: null);

    expect((await statusDao.getAll()).isNotEmpty, false);

    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seed1',
      dbAccount: dbAccount,
    );

    var pendingState = PendingState.pending;
    dbStatus = dbStatus.copyWith(
      pendingState: pendingState,
    );

    await statusDao.insert(entity: dbStatus, mode: null);

    var all = await statusDao.getAll();
    expect(all.length, 1);

    var findByRemoteId =
        await statusDao.findByRemoteIdPopulated(dbStatus.remoteId);

    var actual = findByRemoteId?.dbStatus;
    expect(
      actual?.pendingState,
      pendingState,
    );

    await statusDao.updateByRemoteId(
      dbStatus.remoteId,
      dbStatus.copyWith(
        pendingState: PendingState.fail,
      ),
    );

    expect((await statusDao.getAll()).length, 1);

    expect(
      (await statusDao.findByRemoteIdPopulated(dbStatus.remoteId))
          ?.dbStatus
          .pendingState,
      PendingState.fail,
    );
  });

  test('test dbMigration v11->v12 dbStatus oldPendingRemoteId', () async {
    var statusDao = database.statusDao;

    await statusDao.clear(batchTransaction: null);

    expect((await statusDao.getAll()).isNotEmpty, false);

    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seed1',
      dbAccount: dbAccount,
    );

    var oldPendingRemoteId = 'oldPendingRemoteId1';
    dbStatus = dbStatus.copyWith(
      oldPendingRemoteId: oldPendingRemoteId,
    );

    await statusDao.insert(entity: dbStatus, mode: null);

    var all = await statusDao.getAll();
    expect(all.length, 1);

    var findByRemoteId =
        await statusDao.findByRemoteIdPopulated(dbStatus.remoteId);

    var actual = findByRemoteId?.dbStatus;
    expect(
      actual?.oldPendingRemoteId,
      oldPendingRemoteId,
    );

    await statusDao.updateByRemoteId(
      dbStatus.remoteId,
      dbStatus.copyWith(
        oldPendingRemoteId: 'oldPendingRemoteId2',
      ),
    );

    expect((await statusDao.getAll()).length, 1);

    expect(
      (await statusDao.findByRemoteIdPopulated(dbStatus.remoteId))
          ?.dbStatus
          .oldPendingRemoteId,
      'oldPendingRemoteId2',
    );
  });

  test('test dbMigration v10->v11 dbChatMessage pendingState', () async {
    var chatMessageDao = database.chatMessageDao;

    await chatMessageDao.clear(batchTransaction: null);

    expect((await chatMessageDao.getAll()).isNotEmpty, false);

    var dbChatMessage =
        await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed1',
      dbAccount: dbAccount,
    );

    var pendingState = PendingState.pending;
    dbChatMessage = dbChatMessage.copyWith(
      pendingState: pendingState,
    );

    await chatMessageDao.insert(entity: dbChatMessage, mode: null);

    var all = await chatMessageDao.getAll();
    expect(all.length, 1);

    var findByRemoteId =
        await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId);

    var actual = findByRemoteId?.dbChatMessage;
    expect(
      actual?.pendingState,
      pendingState,
    );

    await chatMessageDao.updateByRemoteId(
      dbChatMessage.remoteId,
      dbChatMessage.copyWith(
        pendingState: PendingState.fail,
      ),
    );

    expect((await chatMessageDao.getAll()).length, 1);

    expect(
      (await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId))
          ?.dbChatMessage
          .pendingState,
      PendingState.fail,
    );
  });

  test('test dbMigration v11->v12 dbChatMessage oldPendingRemoteId', () async {
    var chatMessageDao = database.chatMessageDao;

    await chatMessageDao.clear(batchTransaction: null);

    expect((await chatMessageDao.getAll()).isNotEmpty, false);

    var dbChatMessage =
        await ChatMessageDatabaseMockHelper.createTestDbChatMessage(
      seed: 'seed1',
      dbAccount: dbAccount,
    );

    var oldPendingRemoteId = 'oldPendingRemoteId1';
    dbChatMessage = dbChatMessage.copyWith(
      oldPendingRemoteId: oldPendingRemoteId,
    );

    await chatMessageDao.insert(entity: dbChatMessage, mode: null);

    var all = await chatMessageDao.getAll();
    expect(all.length, 1);

    var findByRemoteId =
        await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId);

    var actual = findByRemoteId?.dbChatMessage;
    expect(
      actual?.oldPendingRemoteId,
      oldPendingRemoteId,
    );

    await chatMessageDao.updateByRemoteId(
      dbChatMessage.remoteId,
      dbChatMessage.copyWith(
        oldPendingRemoteId: 'oldPendingRemoteId2',
      ),
    );

    expect((await chatMessageDao.getAll()).length, 1);

    expect(
      (await chatMessageDao.findByRemoteIdPopulated(dbChatMessage.remoteId))
          ?.dbChatMessage
          .oldPendingRemoteId,
      'oldPendingRemoteId2',
    );
  });
}
