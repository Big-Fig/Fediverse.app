import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../account/database/account_database_model_helper.dart';
import '../notification/database/notification_database_model_helper.dart';

void main() {
  AppDatabase database;
  File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v5.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();
  });

  test('test dismissed', () async {
    var notificationDao = database.notificationDao;

    await notificationDao.clear();

    expect((await notificationDao.getAll().get()).isNotEmpty, false);

    var testDbNotification = await createTestDbNotification(
        seed: "seed1", dbAccount: await createTestDbAccount(seed: "seed2"));
    await notificationDao.insert(testDbNotification);

    expect((await notificationDao.getAll().get()).isNotEmpty, true);

    await notificationDao.markAsDismissed(
        remoteId: testDbNotification.remoteId);

    expect((await notificationDao.getAll().get()).isNotEmpty, true);

    var query = notificationDao.startSelectQuery();
    notificationDao.addOnlyNotDismissedWhere(query);
    expect((await query.get()).isNotEmpty, false);
  });
}
