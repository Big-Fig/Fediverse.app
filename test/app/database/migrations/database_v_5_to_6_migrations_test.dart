import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../../account/database/account_database_test_helper.dart';
import '../../notification/database/notification_database_test_helper.dart';

void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v5.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    // ignore: no-magic-number
    expect(database.migrationsFromExecuted, 5);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v5->v6 notification dismissed', () async {
    var notificationDao = database.notificationDao;

    await notificationDao.clear(batchTransaction: null);

    expect((await notificationDao.getAll()).isNotEmpty, false);

    var testDbNotification =
        await NotificationDatabaseTestHelper.createTestDbNotification(
      seed: "seed1",
      dbAccount:
          await AccountDatabaseTestHelper.createTestDbAccount(seed: "seed2"),
    );
    await notificationDao.insert(
      entity: testDbNotification,
      mode: null,
    );

    expect((await notificationDao.getAll()).isNotEmpty, true);

    await notificationDao.markAsDismissed(
      remoteId: testDbNotification.remoteId,
    );

    expect((await notificationDao.getAll()).isNotEmpty, true);

    var query = notificationDao.startSelectQuery();
    notificationDao.addOnlyNotDismissedWhere(query);
    expect((await query.get()).isNotEmpty, false);
  });
}
