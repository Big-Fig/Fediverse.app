import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_impl.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../database/scheduled_status_database_model_helper.dart';
import '../scheduled_status_model_helper.dart';
import 'scheduled_status_repository_model_helper.dart';

void main() {
  AppDatabase database;
  ScheduledStatusRepository scheduledStatusRepository;

  DbScheduledStatus dbScheduledStatus;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());

    scheduledStatusRepository =
        ScheduledStatusRepository(appDatabase: database);

    dbScheduledStatus = await createTestDbScheduledStatus(seed: "seed4");
  });

  tearDown(() async {
    scheduledStatusRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await scheduledStatusRepository.insert(dbScheduledStatus);
    assert(id != null, true);
    expectDbScheduledStatus(
        await scheduledStatusRepository.findById(id), dbScheduledStatus);
  });

  test('upsertAll', () async {
    var dbScheduledStatus1 = (await createTestDbScheduledStatus(seed: "seed5"))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbScheduledStatus2 = (await createTestDbScheduledStatus(seed: "seed6"))
        .copyWith(remoteId: "remoteId1");

    await scheduledStatusRepository.upsertAll([dbScheduledStatus1]);

    expect((await scheduledStatusRepository.getAll()).length, 1);

    await scheduledStatusRepository.upsertAll([dbScheduledStatus2]);
    expect((await scheduledStatusRepository.getAll()).length, 1);

    expectDbScheduledStatus(
        (await scheduledStatusRepository.getAll()).first, dbScheduledStatus2);
  });

  test('updateById', () async {
    var id = await scheduledStatusRepository.insert(dbScheduledStatus);
    assert(id != null, true);

    await scheduledStatusRepository.updateById(
        id, dbScheduledStatus.copyWith(remoteId: "newRemoteId"));

    expect(
        (await scheduledStatusRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('updateLocalScheduledStatusByRemoteScheduledStatus', () async {
    var id = await scheduledStatusRepository
        .insert(dbScheduledStatus.copyWith(remoteId: "oldRemoteId"));
    assert(id != null, true);

    var oldLocalScheduledStatus =
        DbScheduledStatusWrapper(dbScheduledStatus.copyWith(id: id));

    var newRemoteId = "newRemoteId";
    var newRemoteScheduledStatus =
        mapLocalScheduledStatusToRemoteScheduledStatus(DbScheduledStatusWrapper(
            dbScheduledStatus.copyWith(id: id, remoteId: newRemoteId)));
    await scheduledStatusRepository
        .updateLocalScheduledStatusByRemoteScheduledStatus(
      oldLocalScheduledStatus: oldLocalScheduledStatus,
      newRemoteScheduledStatus: newRemoteScheduledStatus,
    );

    expect(
        (await scheduledStatusRepository.findById(id)).remoteId, newRemoteId);
  });

  test('findByRemoteId', () async {
    await scheduledStatusRepository.insert(dbScheduledStatus);
    expectDbScheduledStatus(
        await scheduledStatusRepository
            .findByRemoteId(dbScheduledStatus.remoteId),
        dbScheduledStatus);
  });
  test('markAsCanceled', () async {
    var id = await scheduledStatusRepository.insert(dbScheduledStatus);
    dbScheduledStatus = dbScheduledStatus.copyWith(id: id);
    expect(
        (await scheduledStatusRepository
                .findByRemoteId(dbScheduledStatus.remoteId))
            .canceled,
        false);
    await scheduledStatusRepository.markAsCanceled(
        scheduledStatus: DbScheduledStatusWrapper(dbScheduledStatus));

    expect(
        (await scheduledStatusRepository
                .findByRemoteId(dbScheduledStatus.remoteId))
            .canceled,
        true);
  });

  test('upsertRemoteScheduledStatus', () async {
    expect(await scheduledStatusRepository.countAll(), 0);

    await scheduledStatusRepository.upsertRemoteScheduledStatus(
        mapLocalScheduledStatusToRemoteScheduledStatus(
      DbScheduledStatusWrapper(dbScheduledStatus),
    ));

    expect(await scheduledStatusRepository.countAll(), 1);
    expectDbScheduledStatus(
        await scheduledStatusRepository
            .findByRemoteId(dbScheduledStatus.remoteId),
        dbScheduledStatus);
    // item with same id updated

    await scheduledStatusRepository.upsertRemoteScheduledStatus(
      mapLocalScheduledStatusToRemoteScheduledStatus(
          DbScheduledStatusWrapper(dbScheduledStatus)),
    );
    expect(await scheduledStatusRepository.countAll(), 1);

    expectDbScheduledStatus(
        await scheduledStatusRepository
            .findByRemoteId(dbScheduledStatus.remoteId),
        dbScheduledStatus);
  });

  test('upsertRemoteScheduledStatuses', () async {
    expect(await scheduledStatusRepository.countAll(), 0);
    await scheduledStatusRepository.upsertRemoteScheduledStatuses([
      mapLocalScheduledStatusToRemoteScheduledStatus(
          DbScheduledStatusWrapper(dbScheduledStatus)),
    ]);

    expect(await scheduledStatusRepository.countAll(), 1);
    expectDbScheduledStatus(
        await scheduledStatusRepository
            .findByRemoteId(dbScheduledStatus.remoteId),
        dbScheduledStatus);

    await scheduledStatusRepository.upsertRemoteScheduledStatuses([
      mapLocalScheduledStatusToRemoteScheduledStatus(
          DbScheduledStatusWrapper(dbScheduledStatus)),
    ]);
    // update item with same id
    expect(await scheduledStatusRepository.countAll(), 1);
    expectDbScheduledStatus(
        await scheduledStatusRepository
            .findByRemoteId(dbScheduledStatus.remoteId),
        dbScheduledStatus);
  });

  test('createQuery empty', () async {
    var query = scheduledStatusRepository.createQuery(
        olderThan: null,
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    expect((await query.get()).length, 0);

    await scheduledStatusRepository
        .insert((await createTestDbScheduledStatus(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await scheduledStatusRepository
        .insert((await createTestDbScheduledStatus(seed: "seed2")).copyWith());

    expect((await query.get()).length, 2);

    await scheduledStatusRepository
        .insert((await createTestDbScheduledStatus(seed: "seed3")).copyWith());

    expect((await query.get()).length, 3);
  });

  test('createQuery newerThan', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: await createTestScheduledStatus(
            seed: "remoteId5", remoteId: "remoteId5"),
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThan: null,
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 0);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 0);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 1);
    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId7"));

    expect((await query.get()).length, 2);
  });

  test('createQuery excludeCanceled', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThan: null,
        excludeCanceled: true,
        excludeScheduleAtExpired: null);

    var scheduledStatus =
        (await createTestDbScheduledStatus(seed: "seed2", canceled: false))
            .copyWith(remoteId: "remoteId4");
    scheduledStatus = await insertDbScheduledStatus(
        scheduledStatusRepository, scheduledStatus);

    expect((await query.get()).length, 1);

    await scheduledStatusRepository.markAsCanceled(
        scheduledStatus: DbScheduledStatusWrapper(scheduledStatus));
    expect((await query.get()).length, 0);
  });
  test('createQuery excludeScheduleAtExpired', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThan: null,
        excludeCanceled: null,
        excludeScheduleAtExpired: true);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(
                seed: "seed2",
                scheduledAt: DateTime.now().add(Duration(minutes: 1))))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 1);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(
                seed: "seed3",
                scheduledAt: DateTime.now().subtract(Duration(minutes: 1))))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 1);
  });

  test('createQuery notNewerThan', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThan: await createTestScheduledStatus(
            seed: "remoteId5", remoteId: "remoteId5"),
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);
    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThan & newerThan', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: await createTestScheduledStatus(
            seed: "remoteId2", remoteId: "remoteId2"),
        limit: null,
        offset: null,
        orderingTermData: null,
        olderThan: await createTestScheduledStatus(
            seed: "remoteId5", remoteId: "remoteId5"),
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));

    expect((await query.get()).length, 0);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));

    expect((await query.get()).length, 0);
    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    expect((await query.get()).length, 1);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed4"))
            .copyWith(remoteId: "remoteId4"));

    expect((await query.get()).length, 2);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed5"))
            .copyWith(remoteId: "remoteId5"));

    expect((await query.get()).length, 2);

    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed6"))
            .copyWith(remoteId: "remoteId6"));

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: ScheduledStatusOrderingTermData(
            orderByType: ScheduledStatusOrderByType.remoteId,
            orderingMode: OrderingMode.asc),
        olderThan: null,
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    var scheduledStatus2 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var scheduledStatus1 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var scheduledStatus3 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbScheduledStatuses = await query.get();
    var actualList = dbScheduledStatuses
        .map((dbScheduledStatus) => scheduledStatusRepository
            .mapDataClassToItem(scheduledStatusRepository.dao
                .typedResultToPopulated(dbScheduledStatus)))
        .toList();
    expect(actualList.length, 3);

    expectDbScheduledStatus(actualList[0], scheduledStatus1);
    expectDbScheduledStatus(actualList[1], scheduledStatus2);
    expectDbScheduledStatus(actualList[2], scheduledStatus3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: null,
        limit: null,
        offset: null,
        orderingTermData: ScheduledStatusOrderingTermData(
            orderByType: ScheduledStatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThan: null,
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    var scheduledStatus2 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var scheduledStatus1 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var scheduledStatus3 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbScheduledStatuses = await query.get();
    var actualList = dbScheduledStatuses
        .map((dbScheduledStatus) => scheduledStatusRepository
            .mapDataClassToItem(scheduledStatusRepository.dao
                .typedResultToPopulated(dbScheduledStatus)))
        .toList();
    expect(actualList.length, 3);

    expectDbScheduledStatus(actualList[0], scheduledStatus3);
    expectDbScheduledStatus(actualList[1], scheduledStatus2);
    expectDbScheduledStatus(actualList[2], scheduledStatus1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = scheduledStatusRepository.createQuery(
        newerThan: null,
        limit: 1,
        offset: 1,
        orderingTermData: ScheduledStatusOrderingTermData(
            orderByType: ScheduledStatusOrderByType.remoteId,
            orderingMode: OrderingMode.desc),
        olderThan: null,
        excludeCanceled: null,
        excludeScheduleAtExpired: null);

    var scheduledStatus2 = await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    await insertDbScheduledStatus(
        scheduledStatusRepository,
        (await createTestDbScheduledStatus(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    var dbScheduledStatuses = await query.get();
    var actualList = dbScheduledStatuses
        .map((dbScheduledStatus) => scheduledStatusRepository
            .mapDataClassToItem(scheduledStatusRepository.dao
                .typedResultToPopulated(dbScheduledStatus)))
        .toList();
    expect(actualList.length, 1);

    expectDbScheduledStatus(actualList[0], scheduledStatus2);
  });
}
