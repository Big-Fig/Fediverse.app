import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../database/filter_database_test_helper.dart';
import '../filter_test_helper.dart';
import 'filter_repository_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword

const String baseUrl = 'https://pleroma.com';

void main() {
  late AppDatabase database;
  late FilterRepository filterRepository;

  late DbFilterPopulated dbFilterPopulated;
  late DbFilter dbFilter;

  setUp(() async {
    database = AppDatabase(
      VmDatabase.memory(
        logStatements: false,
      ),
    );
    filterRepository = FilterRepository(
      appDatabase: database,
    );

    dbFilter = await FilterDatabaseTestHelper.createTestDbFilter(
      seed: 'seed4',
    );

    dbFilterPopulated = DbFilterPopulated(
      dbFilter: dbFilter,
    );
  });

  tearDown(() async {
    await filterRepository.dispose();
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await filterRepository.insertInDbType(
      dbFilter,
      mode: null,
    );
    assert(id > 0, true);
    FilterDatabaseTestHelper.expectDbFilterPopulated(
      (await filterRepository.findByDbIdInAppType(id))!,
      dbFilterPopulated,
    );
  });

  test('upsertAll', () async {
    var dbFilter1 =
        (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed5'))
            .copyWith(remoteId: 'remoteId1');
    // same remote id
    var dbFilter2 =
        (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed6'))
            .copyWith(remoteId: 'remoteId1');

    await filterRepository.upsertAllInDbType(
      [dbFilter1],
      batchTransaction: null,
    );

    expect((await filterRepository.getAllInAppType()).length, 1);

    await filterRepository.upsertAllInDbType(
      [dbFilter2],
      batchTransaction: null,
    );
    expect((await filterRepository.getAllInAppType()).length, 1);

    FilterDatabaseTestHelper.expectDbFilterPopulated(
      (await filterRepository.getAllInAppType()).first,
      await FilterDatabaseTestHelper.createTestFilterPopulated(dbFilter2),
    );
  });

  test('updateById', () async {
    var id = await filterRepository.insertInDbType(
      dbFilter,
      mode: null,
    );
    assert(id > 0, true);

    await filterRepository.updateByDbIdInDbType(
      dbId: id,
      dbItem: dbFilter.copyWith(remoteId: 'newRemoteId'),
      batchTransaction: null,
    );

    expect(
      (await filterRepository.findByDbIdInAppType(id))!.remoteId,
      'newRemoteId',
    );
  });

  test('updateLocalFilterByRemoteFilter', () async {
    var id = await filterRepository.insertInDbType(
      dbFilter.copyWith(phrase: 'phrase2'),
      mode: null,
    );
    assert(id > 0, true);

    var oldLocalFilter = DbFilterPopulatedWrapper(
      dbFilterPopulated: DbFilterPopulated(
        dbFilter: dbFilter.copyWith(id: id),
      ),
    );
    var newRemoteFilter = DbFilterPopulatedWrapper(
      dbFilterPopulated: DbFilterPopulated(
        dbFilter: dbFilter.copyWith(id: id, phrase: 'phrase3'),
      ),
    ).toPleromaFilter();
    await filterRepository.updateAppTypeByRemoteType(
      appItem: oldLocalFilter,
      remoteItem: newRemoteFilter,
      batchTransaction: null,
    );

    expect((await filterRepository.findByDbIdInAppType(id))!.phrase, 'phrase3');
  });

  test('findByRemoteId', () async {
    await filterRepository.insertInDbType(
      dbFilter,
      mode: null,
    );
    FilterDatabaseTestHelper.expectDbFilterPopulated(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilterPopulated,
    );
  });

  test('upsertRemoteFilter', () async {
    expect(await filterRepository.countAll(), 0);

    await filterRepository.upsertInRemoteType(
      DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
          .toPleromaFilter(),
    );

    expect(await filterRepository.countAll(), 1);

    FilterDatabaseTestHelper.expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );

    // item with same id updated
    await filterRepository.upsertInRemoteType(
      DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
          .toPleromaFilter(),
    );
    expect(await filterRepository.countAll(), 1);

    FilterDatabaseTestHelper.expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );
  });

  test('upsertRemoteFilters', () async {
    expect(await filterRepository.countAll(), 0);
    await filterRepository.upsertAllInRemoteType(
      [
        DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
            .toPleromaFilter(),
      ],
      batchTransaction: null,
    );

    expect(await filterRepository.countAll(), 1);

    FilterDatabaseTestHelper.expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );

    await filterRepository.upsertAllInRemoteType(
      [
        DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
            .toPleromaFilter(),
      ],
      batchTransaction: null,
    );

    // update item with same id
    expect(await filterRepository.countAll(), 1);
    FilterDatabaseTestHelper.expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );
  });

  test('createQuery empty', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: null,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(),
    );

    expect((await query.get()).length, 1);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyWithContextTypes single', () async {
    var query = filterRepository.createQuery(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonApiFilterContextType.homeAndCustomLists,
        ],
      ),
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(
        context: [],
      ),
    );

    expect((await query.get()).length, 0);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(context: ['home', 'notifications']),
    );
    expect((await query.get()).length, 1);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed3'))
          .copyWith(context: ['public']),
    );
    expect((await query.get()).length, 1);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed4'))
          .copyWith(context: ['public', 'home', 'unknown']),
    );
    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed5'))
          .copyWith(context: ['unknown']),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyWithContextTypes several', () async {
    var query = filterRepository.createQuery(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonApiFilterContextType.homeAndCustomLists,
          MastodonApiFilterContextType.public,
        ],
      ),
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(
        context: [],
      ),
    );

    expect((await query.get()).length, 0);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(context: ['home', 'notifications']),
    );
    expect((await query.get()).length, 1);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed3'))
          .copyWith(context: ['public']),
    );
    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed4'))
          .copyWith(context: ['public', 'home', 'unknown']),
    );
    expect((await query.get()).length, 3);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed5'))
          .copyWith(context: ['unknown']),
    );
    expect((await query.get()).length, 3);
  });

  test('createQuery notExpired', () async {
    var query = filterRepository.createQuery(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonApiFilterContextType.homeAndCustomLists,
        ],
        notExpired: true,
      ),
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(
        seed: 'seed1',
        expiresAt: null,
      )),
    );

    expect((await query.get()).length, 1);
    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(
        seed: 'seed2',
        expiresAt: DateTime(3000),
      )),
    );

    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(
        seed: 'seed3',
        expiresAt: DateTime(1990),
      )),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanFilter', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await FilterTestHelper.createTestFilter(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
        ),
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(
        remoteId: 'remoteId4',
      ),
    );

    expect((await query.get()).length, 0);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(
        remoteId: 'remoteId5',
      ),
    );

    expect((await query.get()).length, 0);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(
        remoteId: 'remoteId6',
      ),
    );

    expect((await query.get()).length, 1);
    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(
        remoteId: 'remoteId7',
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanFilter', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await FilterTestHelper.createTestFilter(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
        ),
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(
        remoteId: 'remoteId3',
      ),
    );

    expect((await query.get()).length, 1);
    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(
        remoteId: 'remoteId4',
      ),
    );

    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(
        remoteId: 'remoteId5',
      ),
    );

    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(
        remoteId: 'remoteId6',
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanFilter & newerThanFilter', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await FilterTestHelper.createTestFilter(
          seed: 'remoteId5',
          remoteId: 'remoteId5',
        ),
        newerThanItem: await FilterTestHelper.createTestFilter(
          seed: 'remoteId2',
          remoteId: 'remoteId2',
        ),
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(
        remoteId: 'remoteId1',
      ),
    );

    expect((await query.get()).length, 0);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(
        remoteId: 'remoteId2',
      ),
    );

    expect((await query.get()).length, 0);
    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(
        seed: 'seed3',
      ))
          .copyWith(
        remoteId: 'remoteId3',
      ),
    );

    expect((await query.get()).length, 1);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed4'))
          .copyWith(
        remoteId: 'remoteId4',
      ),
    );

    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed5'))
          .copyWith(
        remoteId: 'remoteId5',
      ),
    );

    expect((await query.get()).length, 2);

    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed6'))
          .copyWith(
        remoteId: 'remoteId6',
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery orderingTermData remoteId asc no limit', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdAsc,
    );

    var filter2 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );
    var filter1 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId1'),
    );
    var filter3 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();

    expect(actualList.length, 3);

    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[0].toDbFilter(),
        ),
      ),
      filter1,
    );
    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[1].toDbFilter(),
        ),
      ),
      filter2,
    );
    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[2].toDbFilter(),
        ),
      ),
      filter3,
    );
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    var filter2 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );
    var filter1 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId1'),
    );
    var filter3 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 3);

    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[0].toDbFilter(),
        ),
      ),
      filter3,
    );
    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[1].toDbFilter(),
        ),
      ),
      filter2,
    );
    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[2].toDbFilter(),
        ),
      ),
      filter1,
    );
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        limit: 1,
        offset: 1,
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    var filter2 = await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed2'))
          .copyWith(remoteId: 'remoteId2'),
    );
    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed1'))
          .copyWith(remoteId: 'remoteId1'),
    );
    await FilterRepositoryTestHelper.insertDbFilter(
      filterRepository,
      (await FilterDatabaseTestHelper.createTestDbFilter(seed: 'seed3'))
          .copyWith(remoteId: 'remoteId3'),
    );

    var actualList = await query.get();
    expect(actualList.length, 1);

    FilterDatabaseTestHelper.expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[0].toDbFilter(),
        ),
      ),
      filter2,
    );
  });
}
