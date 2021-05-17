import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';

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

    // ignore: no-magic-number
    expect(database.migrationsFromExecuted, 9);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test(
    'test dbMigration v9->v10 dbAccounts pleromaAcceptsChatMessages',
    () async {
      var accountDao = database.accountDao;

      await accountDao.clear(batchTransaction: null);

      expect((await accountDao.getAll()).isNotEmpty, false);

      var dbAccount =
          await AccountDatabaseTestHelper.createTestDbAccount(seed: 'seed');

      var pleromaAcceptsChatMessages = true;
      dbAccount = dbAccount.copyWith(
        pleromaAcceptsChatMessages: pleromaAcceptsChatMessages,
      );

      await accountDao.insert(entity: dbAccount, mode: null);

      expect((await accountDao.getAll()).length, 1);

      expect(
        (await accountDao.findByRemoteIdPopulated(dbAccount.remoteId))
            ?.dbAccount
            .pleromaAcceptsChatMessages,
        pleromaAcceptsChatMessages,
      );

      await accountDao.updateByRemoteId(
        dbAccount.remoteId,
        dbAccount.copyWith(
          pleromaAcceptsChatMessages: false,
        ),
      );

      expect((await accountDao.getAll()).length, 1);

      expect(
        (await accountDao.findByRemoteIdPopulated(dbAccount.remoteId))
            ?.dbAccount
            .pleromaAcceptsChatMessages,
        false,
      );
    },
  );
}
