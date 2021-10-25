import 'dart:io';

import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v9.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + '.temp');
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    expect(database.migrationsFromExecuted, 9);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test(
    'test dbMigration v9->v10 dbAccounts acceptsChatMessages',
    () async {
      var accountDao = database.accountDao;

      await accountDao.clear(batchTransaction: null);

      expect((await accountDao.getAll()).isNotEmpty, false);

      var dbAccount =
          await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed');

      var acceptsChatMessages = true;
      dbAccount = dbAccount.copyWith(
        acceptsChatMessages: acceptsChatMessages,
      );

      await accountDao.insert(entity: dbAccount, mode: null);

      expect((await accountDao.getAll()).length, 1);

      expect(
        (await accountDao.findByRemoteIdPopulated(dbAccount.remoteId))
            ?.dbAccount
            .acceptsChatMessages,
        acceptsChatMessages,
      );

      await accountDao.updateByRemoteId(
        dbAccount.remoteId,
        dbAccount.copyWith(
          acceptsChatMessages: false,
        ),
      );

      expect((await accountDao.getAll()).length, 1);

      expect(
        (await accountDao.findByRemoteIdPopulated(dbAccount.remoteId))
            ?.dbAccount
            .acceptsChatMessages,
        false,
      );
    },
  );
}
