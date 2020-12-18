import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

void main() {
  AppDatabase database;
  File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v2.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();
  });

  test('test scheduled', () async {
    var scheduledStatusDao = database.scheduledStatusDao;
    // sqldump should have old scheduled
    expect((await scheduledStatusDao.getAll().get()).isNotEmpty, true);

    await scheduledStatusDao.clear();

    expect((await scheduledStatusDao.getAll().get()).isNotEmpty, false);

    await scheduledStatusDao.insert(DbScheduledStatus(
        scheduledAt: DateTime.now(),
        canceled: false,
        id: null,
        remoteId: "asda"));

    expect((await scheduledStatusDao.getAll().get()).isNotEmpty, true);
  });

  test('test draft', () async {
    var draftStatusDao = database.draftStatusDao;

    await draftStatusDao.clear();
    expect((await draftStatusDao.getAll().get()).isNotEmpty, false);

    await draftStatusDao.insert(DbDraftStatus(
        id: null,
        updatedAt: DateTime.now(),
        data: PostStatusData(
            subject: null,
            text: null,
            scheduledAt: null,
            visibility: null,
            to: null,
            mediaAttachments: null,
            poll: null,
            inReplyToPleromaStatus: null,
            inReplyToConversationId: null,
            isNsfwSensitiveEnabled: null)));

    expect((await draftStatusDao.getAll().get()).isNotEmpty, true);
  });
}
