import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../chat/message/database/chat_message_database_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v12.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + '.temp');
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    expect(database.migrationsFromExecuted, 12);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v5->v6 chatMessage deleted', () async {
    var chatMessageDao = database.chatMessageDao;

    await chatMessageDao.clear(batchTransaction: null);

    expect((await chatMessageDao.getAll()).isNotEmpty, false);

    var testDbChatMessage =
        await ChatMessageDatabaseTestHelper.createTestDbChatMessage(
      seed: 'seed1',
      dbAccount:
          await AccountDatabaseTestHelper.createTestDbAccount(seed: 'seed2'),
    );
    await chatMessageDao.insert(
      entity: testDbChatMessage,
      mode: null,
    );

    expect((await chatMessageDao.getAll()).isNotEmpty, true);

    await chatMessageDao.markAsDeleted(
      remoteId: testDbChatMessage.remoteId,
    );

    expect((await chatMessageDao.getAll()).isNotEmpty, true);

    var query = chatMessageDao.startSelectQuery();
    chatMessageDao.addOnlyNotDeletedWhere(query);
    expect((await query.get()).isNotEmpty, false);
  });
}
