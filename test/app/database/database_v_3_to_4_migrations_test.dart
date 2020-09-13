import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../account/database/account_database_model_helper.dart';
import '../status/database/status_database_model_helper.dart';

void main() {
  AppDatabase database;
  File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v3.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();
  });

  test('test deleted', () async {
    var statusDao = database.statusDao;

    await statusDao.clear();

    expect((await statusDao.getAll()).isNotEmpty, false);

    var testDbStatus = await createTestDbStatus(
        seed: "seed1", dbAccount: await createTestDbAccount(seed: "seed2"));
    await statusDao.insert(testDbStatus);

    expect((await statusDao.getAll()).isNotEmpty, true);

    await statusDao.markAsDeleted(remoteId: testDbStatus.remoteId);

    expect((await statusDao.getAll()).isNotEmpty, true);

    var query = statusDao.startSelectQuery();
    statusDao.addOnlyNotDeletedWhere(query);
    expect((await query.get()).isNotEmpty, false);
  });
}
