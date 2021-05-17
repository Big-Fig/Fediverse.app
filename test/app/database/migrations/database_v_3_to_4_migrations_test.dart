import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';

void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v3.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + '.temp');
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    // ignore: no-magic-number
    expect(database.migrationsFromExecuted, 3);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v3->v4 deleted', () async {
    var statusDao = database.statusDao;

    await statusDao.clear(batchTransaction: null);

    expect((await statusDao.getAll()).isNotEmpty, false);

    var testDbStatus = await StatusDatabaseTestHelper.createTestDbStatus(
      seed: 'seed1',
      dbAccount:
          await AccountDatabaseTestHelper.createTestDbAccount(seed: 'seed2'),
    );
    await statusDao.insert(
      entity: testDbStatus,
      mode: null,
    );

    expect((await statusDao.getAll()).isNotEmpty, true);

    await statusDao.markAsDeleted(remoteId: testDbStatus.remoteId);

    expect((await statusDao.getAll()).isNotEmpty, true);

    var query = statusDao.startSelectQuery();
    statusDao.addOnlyNotDeletedWhere(query);
    expect((await query.get()).isNotEmpty, false);
  });
}
