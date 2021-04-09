import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../account/database/account_database_model_helper.dart';

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
  });

  test('test pleromaBackgroundImage', () async {
    var accountDao = database.accountDao;

    await accountDao.clear();

    expect((await accountDao.getAll().get()).isNotEmpty, false);

    var pleromaBackgroundImage = "pleromaBackgroundImage11";
    var testDbAccount = await createTestDbAccount(seed: "seed1");
    testDbAccount =
        testDbAccount.copyWith(pleromaBackgroundImage: pleromaBackgroundImage);
    await accountDao.insert(
      entity: testDbAccount,
      mode: null,
    );

    expect(
      (await accountDao.findByRemoteId(testDbAccount.remoteId).getSingle())
          .pleromaBackgroundImage,
      pleromaBackgroundImage,
    );
  });
}
