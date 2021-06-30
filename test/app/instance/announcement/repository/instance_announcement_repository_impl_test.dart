import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model_adapter.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_impl.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../database/instance_announcement_database_test_helper.dart';
import '../instance_announcement_test_helper.dart';
import 'instance_announcement_repository_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword

const String baseUrl = 'https://pleroma.com';

void main() {
  late AppDatabase database;
  late InstanceAnnouncementRepository instanceAnnouncementRepository;

  late DbInstanceAnnouncementPopulated dbInstanceAnnouncementPopulated;
  late DbInstanceAnnouncement dbInstanceAnnouncement;

  setUp(() async {
    database = AppDatabase(
      VmDatabase.memory(
        logStatements: false,
      ),
    );
    instanceAnnouncementRepository = InstanceAnnouncementRepository(
      appDatabase: database,
    );

    dbInstanceAnnouncement =
        InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
      seed: 'seed4',
    );

    dbInstanceAnnouncementPopulated = DbInstanceAnnouncementPopulated(
      dbInstanceAnnouncement: dbInstanceAnnouncement,
    );
  });

  tearDown(() async {
    await instanceAnnouncementRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await instanceAnnouncementRepository.insertInDbType(
      dbInstanceAnnouncement,
      mode: null,
    );
    assert(id > 0, true);
    InstanceAnnouncementDatabaseTestHelper
        .expectDbInstanceAnnouncementPopulated(
      (await instanceAnnouncementRepository.findByDbIdInAppType(id))!,
      dbInstanceAnnouncementPopulated,
    );
  });

  test('upsertAll', () async {
    var dbInstanceAnnouncement1 = (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(seed: 'seed5'))
        .copyWith(remoteId: 'remoteId1');
    // same remote id
    var dbInstanceAnnouncement2 = (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(seed: 'seed6'))
        .copyWith(remoteId: 'remoteId1');

    await instanceAnnouncementRepository.upsertAllInDbType(
      [dbInstanceAnnouncement1],
      batchTransaction: null,
    );

    expect((await instanceAnnouncementRepository.getAllInAppType()).length, 1);

    await instanceAnnouncementRepository.upsertAllInDbType(
      [dbInstanceAnnouncement2],
      batchTransaction: null,
    );
    expect((await instanceAnnouncementRepository.getAllInAppType()).length, 1);

    InstanceAnnouncementDatabaseTestHelper
        .expectDbInstanceAnnouncementPopulated(
      (await instanceAnnouncementRepository.getAllInAppType()).first,
      await InstanceAnnouncementDatabaseTestHelper
          .createTestInstanceAnnouncementPopulated(dbInstanceAnnouncement2),
    );
  });

  test('updateById', () async {
    var id = await instanceAnnouncementRepository.insertInDbType(
      dbInstanceAnnouncement,
      mode: null,
    );
    assert(id > 0, true);

    await instanceAnnouncementRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbInstanceAnnouncement.copyWith(remoteId: 'newRemoteId'),
      batchTransaction: null,
    );

    expect(
      (await instanceAnnouncementRepository.findByDbIdInAppType(id))!.remoteId,
      'newRemoteId',
    );
  });

  test('updateLocalInstanceAnnouncementByRemoteInstanceAnnouncement', () async {
    var id = await instanceAnnouncementRepository.insertInDbType(
      dbInstanceAnnouncement.copyWith(content: 'phrase2'),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalInstanceAnnouncement = DbInstanceAnnouncementPopulatedWrapper(
      dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
        dbInstanceAnnouncement: dbInstanceAnnouncement.copyWith(id: id),
      ),
    );
    var newRemoteInstanceAnnouncement = DbInstanceAnnouncementPopulatedWrapper(
      dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
        dbInstanceAnnouncement: dbInstanceAnnouncement.copyWith(
          id: id,
          content: 'phrase3',
        ),
      ),
    ).toPleromaInstanceAnnouncement();
    await instanceAnnouncementRepository.updateAppTypeByRemoteType(
      appItem: oldLocalInstanceAnnouncement,
      remoteItem: newRemoteInstanceAnnouncement,
      batchTransaction: null,
    );

    expect(
      (await instanceAnnouncementRepository.findByDbIdInAppType(id))!.content,
      'phrase3',
    );
  });

  test('findByRemoteId', () async {
    await instanceAnnouncementRepository.insertInDbType(
      dbInstanceAnnouncement,
      mode: null,
    );
    InstanceAnnouncementDatabaseTestHelper
        .expectDbInstanceAnnouncementPopulated(
      (await instanceAnnouncementRepository
          .findByRemoteIdInAppType(dbInstanceAnnouncement.remoteId))!,
      dbInstanceAnnouncementPopulated,
    );
  });

  test('upsertRemoteInstanceAnnouncement', () async {
    expect(await instanceAnnouncementRepository.countAll(), 0);

    await instanceAnnouncementRepository.upsertInRemoteType(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: dbInstanceAnnouncementPopulated,
      ).toPleromaInstanceAnnouncement(),
    );

    expect(await instanceAnnouncementRepository.countAll(), 1);

    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      (await instanceAnnouncementRepository
          .findByRemoteIdInAppType(dbInstanceAnnouncement.remoteId))!,
      dbInstanceAnnouncement,
    );

    // item with same id updated
    await instanceAnnouncementRepository.upsertInRemoteType(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: dbInstanceAnnouncementPopulated,
      ).toPleromaInstanceAnnouncement(),
    );
    expect(await instanceAnnouncementRepository.countAll(), 1);

    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      (await instanceAnnouncementRepository
          .findByRemoteIdInAppType(dbInstanceAnnouncement.remoteId))!,
      dbInstanceAnnouncement,
    );
  });

  test('upsertRemoteInstanceAnnouncements', () async {
    expect(await instanceAnnouncementRepository.countAll(), 0);
    await instanceAnnouncementRepository.upsertAllInRemoteType(
      [
        DbInstanceAnnouncementPopulatedWrapper(
          dbInstanceAnnouncementPopulated: dbInstanceAnnouncementPopulated,
        ).toPleromaInstanceAnnouncement(),
      ],
      batchTransaction: null,
    );

    expect(await instanceAnnouncementRepository.countAll(), 1);

    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      (await instanceAnnouncementRepository
          .findByRemoteIdInAppType(dbInstanceAnnouncement.remoteId))!,
      dbInstanceAnnouncement,
    );

    await instanceAnnouncementRepository.upsertAllInRemoteType(
      [
        DbInstanceAnnouncementPopulatedWrapper(
          dbInstanceAnnouncementPopulated: dbInstanceAnnouncementPopulated,
        ).toPleromaInstanceAnnouncement(),
      ],
      batchTransaction: null,
    );

    // update item with same id
    expect(await instanceAnnouncementRepository.countAll(), 1);
    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      (await instanceAnnouncementRepository
          .findByRemoteIdInAppType(dbInstanceAnnouncement.remoteId))!,
      dbInstanceAnnouncement,
    );
  });

  test('createQuery empty', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(),
    );

    expect(
      (await query.get()).length,
      1,
    );

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(),
    );
    expect(
      (await query.get()).length,
      2,
    );
  });

  test('createQuery newerThanInstanceAnnouncement', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem:
            await InstanceAnnouncementTestHelper.createTestInstanceAnnouncement(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
        ),
      ),
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(
        remoteId: 'remoteId4',
      ),
    );

    expect((await query.get()).length, 0);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(
        remoteId: 'remoteId5',
      ),
    );

    expect((await query.get()).length, 0);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(
        remoteId: 'remoteId6',
      ),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(
        remoteId: 'remoteId7',
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanInstanceAnnouncement', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem:
            await InstanceAnnouncementTestHelper.createTestInstanceAnnouncement(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
        ),
      ),
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(
        remoteId: 'remoteId3',
      ),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(
        remoteId: 'remoteId4',
      ),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(
        remoteId: 'remoteId5',
      ),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(
        remoteId: 'remoteId6',
      ),
    );

    expect((await query.get()).length, 2);
  });

  test(
    'createQuery notNewerThanInstanceAnnouncement & newerThanInstanceAnnouncement',
    () async {
      var query = instanceAnnouncementRepository.createQuery(
        filters: null,
        pagination: RepositoryPagination(
          olderThanItem: await InstanceAnnouncementTestHelper
              .createTestInstanceAnnouncement(
            seed: 'remoteId5',
            remoteId: 'remoteId5',
          ),
          newerThanItem: await InstanceAnnouncementTestHelper
              .createTestInstanceAnnouncement(
            seed: 'remoteId2',
            remoteId: 'remoteId2',
          ),
        ),
        orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
      );

      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed1',
        )).copyWith(
          remoteId: 'remoteId1',
        ),
      );

      expect((await query.get()).length, 0);

      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed2',
        )).copyWith(
          remoteId: 'remoteId2',
        ),
      );

      expect((await query.get()).length, 0);
      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed3',
        )).copyWith(
          remoteId: 'remoteId3',
        ),
      );

      expect((await query.get()).length, 1);

      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed4',
        )).copyWith(
          remoteId: 'remoteId4',
        ),
      );

      expect((await query.get()).length, 2);

      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed5',
        )).copyWith(
          remoteId: 'remoteId5',
        ),
      );

      expect((await query.get()).length, 2);

      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed6',
        )).copyWith(
          remoteId: 'remoteId6',
        ),
      );

      expect((await query.get()).length, 2);
    },
  );

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdAsc,
    );

    var instanceAnnouncement2 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(remoteId: 'remoteId2'),
    );
    var instanceAnnouncement1 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(remoteId: 'remoteId1'),
    );
    var instanceAnnouncement3 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
      )).copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();

    expect(actualList.length, 3);

    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[0].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement1,
    );
    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[1].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement2,
    );
    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[2].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement3,
    );
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var instanceAnnouncement2 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(remoteId: 'remoteId2'),
    );
    var instanceAnnouncement1 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(remoteId: 'remoteId1'),
    );
    var instanceAnnouncement3 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
      )).copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 3);

    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[0].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement3,
    );
    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[1].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement2,
    );
    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[2].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement1,
    );
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var instanceAnnouncement2 = await InstanceAnnouncementRepositoryTestHelper
        .insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
      )).copyWith(remoteId: 'remoteId2'),
    );
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
      )).copyWith(remoteId: 'remoteId1'),
    );
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
      )).copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 1);

    InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
      DbInstanceAnnouncementPopulatedWrapper(
        dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
          dbInstanceAnnouncement: actualList[0].toDbInstanceAnnouncement(),
        ),
      ),
      instanceAnnouncement2,
    );
  });
  test(
    'createQuery orderingTermData updatedAt desc & limit & offset',
    () async {
      var query = instanceAnnouncementRepository.createQuery(
        filters: null,
        pagination: RepositoryPagination(
          limit: 1,
          offset: 1,
        ),
        orderingTermData: InstanceAnnouncementOrderingTermData.updatedAtDesc,
      );

      var instanceAnnouncement2 = await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed2',
        )).copyWith(updatedAt: DateTime(2002)),
      );
      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed1',
        )).copyWith(updatedAt: DateTime(2001)),
      );
      await InstanceAnnouncementRepositoryTestHelper
          .insertDbInstanceAnnouncement(
        instanceAnnouncementRepository,
        (InstanceAnnouncementDatabaseTestHelper
            .createTestDbInstanceAnnouncement(
          seed: 'seed3',
        )).copyWith(updatedAt: DateTime(2003)),
      );

      var actualList = await query.get();
      expect(actualList.length, 1);

      InstanceAnnouncementDatabaseTestHelper.expectDbInstanceAnnouncement(
        DbInstanceAnnouncementPopulatedWrapper(
          dbInstanceAnnouncementPopulated: DbInstanceAnnouncementPopulated(
            dbInstanceAnnouncement: actualList[0].toDbInstanceAnnouncement(),
          ),
        ),
        instanceAnnouncement2,
      );
    },
  );

  test('createQuery no withDismissed', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withDismissed: false,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        read: false,
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        read: true,
      )),
    );

    expect((await query.get()).length, 1);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        read: false,
      )),
    );

    expect((await query.get()).length, 2);
  });
  test('createQuery withDismissed', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withDismissed: true,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        read: false,
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        read: true,
      )),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        read: false,
      )),
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery no withExpired allDay=false', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withExpired: false,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var now = DateTime.now();

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        allDay: false,
        endsAt: now.add(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        allDay: false,
        endsAt: now.subtract(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        allDay: false,
        endsAt: null,
      )),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery no withExpired allDay=true', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withExpired: false,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var now = DateTime.now();

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        allDay: true,
        endsAt: now.add(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        allDay: true,
        endsAt: now.subtract(
          Duration(seconds: 1),
        ),
      )),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        allDay: true,
        endsAt: null,
      )),
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery withExpired', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withExpired: true,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var now = DateTime.now();

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        allDay: false,
        endsAt: now.add(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        allDay: false,
        endsAt: now.subtract(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        allDay: false,
        endsAt: null,
      )),
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery no withNotStartedYet allDay=false', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withNotStartedYet: false,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var now = DateTime.now();

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        allDay: false,
        startsAt: now.subtract(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        allDay: false,
        startsAt: now.add(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        allDay: false,
        startsAt: null,
      )),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery no withNotStartedYet allDay=true', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withNotStartedYet: false,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var now = DateTime.now();

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        allDay: true,
        startsAt: now.subtract(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        allDay: true,
        startsAt: now.add(
          Duration(seconds: 1),
        ),
      )),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        allDay: true,
        startsAt: null,
      )),
    );

    expect((await query.get()).length, 3);
  });

  test('createQuery withNotStartedYet allDay=false', () async {
    var query = instanceAnnouncementRepository.createQuery(
      filters: InstanceAnnouncementRepositoryFilters(
        withNotStartedYet: true,
      ),
      pagination: null,
      orderingTermData: InstanceAnnouncementOrderingTermData.remoteIdDesc,
    );

    var now = DateTime.now();

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed1',
        allDay: false,
        startsAt: now.subtract(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 1);
    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed2',
        allDay: false,
        startsAt: now.add(
          Duration(days: 1),
        ),
      )),
    );

    expect((await query.get()).length, 2);

    await InstanceAnnouncementRepositoryTestHelper.insertDbInstanceAnnouncement(
      instanceAnnouncementRepository,
      (InstanceAnnouncementDatabaseTestHelper.createTestDbInstanceAnnouncement(
        seed: 'seed3',
        allDay: false,
        startsAt: null,
      )),
    );

    expect((await query.get()).length, 3);
  });
}
