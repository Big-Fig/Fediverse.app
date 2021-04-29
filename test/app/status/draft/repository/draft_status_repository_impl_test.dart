import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_impl.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/draft_status_model_adapter.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../database/draft_status_database_test_helper.dart';
import '../draft_status_test_helper.dart';
import 'draft_status_repository_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late AppDatabase database;
  late DraftStatusRepository draftStatusRepository;

  DbDraftStatus? dbDraftStatus;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());

    draftStatusRepository =
        DraftStatusRepository(appDatabase: database);

    dbDraftStatus =
        await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
            seed: "seed4");
  });

  tearDown(() async {
    await draftStatusRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await draftStatusRepository.insertInDbType(
      dbDraftStatus!,
      mode: null,
    );
    assert(id > 0, true);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      await draftStatusRepository.findByDbIdInAppType(id),
      dbDraftStatus,
    );
  });

  test('upsertAll', () async {
    var dbDraftStatus1 =
        (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
                seed: "seed5"))
            .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbDraftStatus2 =
        (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
                seed: "seed6"))
            .copyWith(remoteId: "remoteId1");

    await draftStatusRepository.upsertAllInDbType(
      [dbDraftStatus1],
      batchTransaction: null,
    );

    expect((await draftStatusRepository.getAllInAppType()).length, 1);

    await draftStatusRepository.upsertAllInDbType(
      [dbDraftStatus2],
      batchTransaction: null,
    );
    expect((await draftStatusRepository.getAllInAppType()).length, 1);

    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      (await draftStatusRepository.getAllInAppType()).first,
      dbDraftStatus2,
    );
  });

  test('updateById', () async {
    var id = await draftStatusRepository.insertInDbType(
      dbDraftStatus!,
      mode: null,
    );
    assert(id > 0, true);

    await draftStatusRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbDraftStatus!.copyWith(remoteId: "newRemoteId"),
      batchTransaction: null,
    );

    expect(
      (await draftStatusRepository.findByDbIdInDbType(id))?.remoteId,
      "newRemoteId",
    );
  });

  test('updateLocalDraftStatusByRemoteDraftStatus', () async {
    var id = await draftStatusRepository.insertInDbType(
      dbDraftStatus!.copyWith(remoteId: "oldRemoteId"),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalDraftStatus = DbDraftStatusPopulatedWrapper(
      dbDraftStatusPopulated: DbDraftStatusPopulated(
        dbDraftStatus: dbDraftStatus!.copyWith(id: id),
      ),
    );

    var newRemoteId = "newRemoteId";
    var newRemoteDraftStatus = DbDraftStatusPopulatedWrapper(
      dbDraftStatusPopulated: DbDraftStatusPopulated(
        dbDraftStatus: dbDraftStatus!.copyWith(
          id: id,
          remoteId: newRemoteId,
        ),
      ),
    ).toPleromaDraftStatus();
    await draftStatusRepository.updateAppTypeByRemoteType(
      appItem: oldLocalDraftStatus,
      remoteItem: newRemoteDraftStatus,
      batchTransaction: null,
    );

    expect(
      (await draftStatusRepository.findByDbIdInDbType(id))?.remoteId,
      newRemoteId,
    );
  });

  test('findByRemoteId', () async {
    await draftStatusRepository.insertInDbType(
      dbDraftStatus!,
      mode: null,
    );
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      await draftStatusRepository
          .findByRemoteIdInAppType(dbDraftStatus!.remoteId),
      dbDraftStatus,
    );
  });
  test('markAsCanceled', () async {
    var id = await draftStatusRepository.insertInDbType(
      dbDraftStatus!,
      mode: null,
    );
    dbDraftStatus = dbDraftStatus!.copyWith(id: id);
    expect(
      (await draftStatusRepository
              .findByRemoteIdInAppType(dbDraftStatus!.remoteId))!
          .canceled,
      false,
    );
    await draftStatusRepository.markAsCanceled(
      draftStatus: DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus: dbDraftStatus!,
        ),
      ),
      batchTransaction: null,
    );

    expect(
      (await draftStatusRepository
              .findByRemoteIdInAppType(dbDraftStatus!.remoteId))!
          .canceled,
      true,
    );
  });

  test('upsertRemoteDraftStatus', () async {
    expect(await draftStatusRepository.countAll(), 0);

    await draftStatusRepository.upsertInRemoteType(
      DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus: dbDraftStatus!,
        ),
      ).toPleromaDraftStatus(),
    );

    expect(await draftStatusRepository.countAll(), 1);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      await draftStatusRepository
          .findByRemoteIdInAppType(dbDraftStatus!.remoteId),
      dbDraftStatus,
    );
    // item with same id updated

    await draftStatusRepository.upsertInRemoteType(
      DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus: dbDraftStatus!,
        ),
      ).toPleromaDraftStatus(),
    );
    expect(await draftStatusRepository.countAll(), 1);

    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      await draftStatusRepository
          .findByRemoteIdInAppType(dbDraftStatus!.remoteId),
      dbDraftStatus,
    );
  });

  test('upsertRemoteDraftStatuses', () async {
    expect(await draftStatusRepository.countAll(), 0);
    await draftStatusRepository.upsertInRemoteType(
      DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus: dbDraftStatus!,
        ),
      ).toPleromaDraftStatus(),
    );

    expect(await draftStatusRepository.countAll(), 1);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      await draftStatusRepository
          .findByRemoteIdInAppType(dbDraftStatus!.remoteId),
      dbDraftStatus,
    );

    await draftStatusRepository.upsertInRemoteType(
      DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus: dbDraftStatus!,
        ),
      ).toPleromaDraftStatus(),
    );
    // update item with same id
    expect(await draftStatusRepository.countAll(), 1);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
      await draftStatusRepository
          .findByRemoteIdInAppType(dbDraftStatus!.remoteId),
      dbDraftStatus,
    );
  });

  test('createQuery empty', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    expect((await query.get()).length, 0);

    await draftStatusRepository.insertInDbType(
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
        seed: "seed1",
      ))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 1);

    await draftStatusRepository.insertInDbType(
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
        seed: "seed2",
      ))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 2);

    await draftStatusRepository.insertInDbType(
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
        seed: "seed3",
      ))
          .copyWith(),
      mode: null,
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery excludeCanceled', () async {
    var query = draftStatusRepository.createQuery(
      filters: DraftStatusRepositoryFilters(
        excludeCanceled: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    var draftStatus =
        (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
      seed: "seed2",
      canceled: false,
    ))
            .copyWith(remoteId: "remoteId4");
    draftStatus =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      draftStatus,
    );

    expect((await query.get()).length, 1);

    await draftStatusRepository.markAsCanceled(
      draftStatus: DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: DbDraftStatusPopulated(
          dbDraftStatus: draftStatus,
        ),
      ),
      batchTransaction: null,
    );
    expect((await query.get()).length, 0);
  });
  test('createQuery excludeScheduleAtExpired', () async {
    var query = draftStatusRepository.createQuery(
      filters: DraftStatusRepositoryFilters(
        excludeScheduleAtExpired: true,
      ),
      pagination: null,
      orderingTermData: null,
    );

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
        seed: "seed2",
        draftAt: DateTime.now().add(Duration(minutes: 1)),
      ))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 1);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
        seed: "seed3",
        draftAt: DateTime.now().subtract(Duration(minutes: 1)),
      ))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 1);
  });

  test('createQuery newerThan', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem:
            await DraftStatusTestHelper.createTestDraftStatus(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: DraftStatusRepositoryOrderingTermData.remoteIdDesc,
    );

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 0);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 0);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 1);
    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId7"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem:
            await DraftStatusTestHelper.createTestDraftStatus(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: DraftStatusRepositoryOrderingTermData.remoteIdDesc,
    );

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);
    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan & newerThan', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem:
            await DraftStatusTestHelper.createTestDraftStatus(
          seed: "remoteId2",
          remoteId: "remoteId2",
        ),
        olderThanItem:
            await DraftStatusTestHelper.createTestDraftStatus(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: DraftStatusRepositoryOrderingTermData.remoteIdDesc,
    );

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );

    expect((await query.get()).length, 0);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );

    expect((await query.get()).length, 0);
    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    expect((await query.get()).length, 1);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed4"))
          .copyWith(remoteId: "remoteId4"),
    );

    expect((await query.get()).length, 2);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed5"))
          .copyWith(remoteId: "remoteId5"),
    );

    expect((await query.get()).length, 2);

    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed6"))
          .copyWith(remoteId: "remoteId6"),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: DraftStatusRepositoryOrderingTermData.remoteIdAsc,
    );

    var draftStatus2 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    var draftStatus1 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    var draftStatus3 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = await query.get();

    expect(actualList.length, 3);

    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[0], draftStatus1);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[1], draftStatus2);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[2], draftStatus3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: DraftStatusRepositoryOrderingTermData.remoteIdDesc,
    );

    var draftStatus2 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    var draftStatus1 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    var draftStatus3 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );
    var actualList = await query.get();

    expect(actualList.length, 3);

    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[0], draftStatus3);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[1], draftStatus2);
    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[2], draftStatus1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = draftStatusRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: DraftStatusRepositoryOrderingTermData.remoteIdAsc,
    );

    var draftStatus2 =
        await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed2"))
          .copyWith(remoteId: "remoteId2"),
    );
    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed1"))
          .copyWith(remoteId: "remoteId1"),
    );
    await DraftStatusRepositoryTestHelper.insertDbDraftStatus(
      draftStatusRepository,
      (await DraftStatusDatabaseTestHelper.createTestDbDraftStatus(
              seed: "seed3"))
          .copyWith(remoteId: "remoteId3"),
    );

    var actualList = await query.get();

    expect(actualList.length, 1);

    DraftStatusDatabaseTestHelper.expectDbDraftStatus(
        actualList[0], draftStatus2);
  });
}
