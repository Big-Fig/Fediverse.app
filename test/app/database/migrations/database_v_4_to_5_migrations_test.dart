import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_model_helper.dart';

void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v4.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    // ignore: no-magic-number
    expect(database.migrationsFromExecuted, 4);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v4->v5 pleromaBackgroundImage', () async {
    var accountDao = database.accountDao;

    await accountDao.clear(batchTransaction: null);

    expect((await accountDao.getAll()).isNotEmpty, false);

    var pleromaBackgroundImage = "pleromaBackgroundImage11";
    var testDbAccount = await createTestDbAccount(seed: "seed1");
    testDbAccount =
        testDbAccount.copyWith(pleromaBackgroundImage: pleromaBackgroundImage);
    await accountDao.insert(
      entity: testDbAccount,
      mode: null,
    );

    expect(
      (await accountDao.findByRemoteId(testDbAccount.remoteId))!
          .pleromaBackgroundImage,
      pleromaBackgroundImage,
    );
  });
}
