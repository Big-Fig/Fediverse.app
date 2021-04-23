import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

void main() {
  late AppDatabase database;
  late File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v2.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();

    // hack because we don't have too old v2 db dump
    // ignore: no-magic-number
    expect(database.migrationsFromExecuted, 3);
    expect(database.migrationsToExecuted, database.schemaVersion);
  });

  test('test dbMigration v2->v3 scheduled', () async {
    var scheduledStatusDao = database.scheduledStatusDao;

    await scheduledStatusDao.clear(batchTransaction: null);

    expect((await scheduledStatusDao.getAll()).isNotEmpty, false);

    await scheduledStatusDao.insert(
      entity: DbScheduledStatus(
        scheduledAt: DateTime.now(),
        canceled: false,
        id: null,
        remoteId: "asda",
        params: PleromaScheduledStatusParams.only(
          sensitive: true,
          visibility: PleromaVisibility.private.toJsonValue(),
          scheduledAt: DateTime.now(),
        ),
      ),
      mode: null,
    );

    expect((await scheduledStatusDao.getAll()).isNotEmpty, true);
  });

  test('test draft', () async {
    var draftStatusDao = database.draftStatusDao;

    await draftStatusDao.clear(batchTransaction: null);
    expect((await draftStatusDao.getAll()).isNotEmpty, false);

    await draftStatusDao.insert(
      entity: DbDraftStatus(
        id: null,
        updatedAt: DateTime.now(),
        data: PostStatusData.only(
          visibility: PleromaVisibility.private.toJsonValue(),
          isNsfwSensitiveEnabled: true,
        ),
      ),
      mode: null,
    );

    expect((await draftStatusDao.getAll()).isNotEmpty, true);
  });
}
