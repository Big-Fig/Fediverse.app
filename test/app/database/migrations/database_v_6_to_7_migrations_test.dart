import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../conversation/database/conversation_database_model_helper.dart';

void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v6.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    // ignore: no-magic-number
    expect(database.migrationsFromExecuted, 6);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v6->v7 dbConversation updatedAt', () async {
    var conversationDao = database.conversationDao;

    await conversationDao.clear(batchTransaction: null);

    expect((await conversationDao.getAll()).isNotEmpty, false);

    var dbConversation = await createTestDbConversation(seed: "seed");

    var dateTime = DateTime(
      // ignore: no-magic-number
      2000,
    );
    dbConversation = dbConversation.copyWith(
      updatedAt: dateTime,
    );

    await conversationDao.insert(entity: dbConversation, mode: null);

    expect((await conversationDao.getAll()).length, 1);

    expect(
      (await conversationDao.findByRemoteIdPopulated(dbConversation.remoteId))
          ?.dbConversation
          .updatedAt,
      dateTime,
    );

    await conversationDao.updateByRemoteId(
      dbConversation.remoteId,
      dbConversation.copyWith(
        // ignore: no-magic-number
        updatedAt: DateTime(2001),
      ),
    );

    expect((await conversationDao.getAll()).length, 1);

    expect(
      (await conversationDao.findByRemoteIdPopulated(dbConversation.remoteId))
          ?.dbConversation
          .updatedAt,
      // ignore: no-magic-number
      DateTime(2001),
    );
  });
}
