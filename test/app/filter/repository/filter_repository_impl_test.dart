import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/database/filter_database_dao.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../database/filter_database_model_helper.dart';
import '../filter_model_helper.dart';
import 'filter_repository_model_helper.dart';

final String baseUrl = "https://pleroma.com";

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

    dbFilter = await createTestDbFilter(
      seed: "seed4",
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
    var id = await filterRepository.insertInDbType(dbFilter);
    assert(id > 0, true);
    expectDbFilterPopulated(
      (await filterRepository.findByDbIdInAppType(id))!,
      dbFilterPopulated,
    );
  });

  test('upsertAll', () async {
    var dbFilter1 = (await createTestDbFilter(seed: "seed5"))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbFilter2 = (await createTestDbFilter(seed: "seed6"))
        .copyWith(remoteId: "remoteId1");

    await filterRepository.upsertAllInDbType([dbFilter1]);

    expect((await filterRepository.getAllInAppType()).length, 1);

    await filterRepository.upsertAllInDbType([dbFilter2]);
    expect((await filterRepository.getAllInAppType()).length, 1);

    expectDbFilterPopulated(
      (await filterRepository.getAllInAppType()).first,
      await createTestFilterPopulated(dbFilter2),
    );
  });

  test('updateById', () async {
    var id = await filterRepository.insertInDbType(dbFilter);
    assert(id > 0, true);

    await filterRepository.updateByDbIdInDbType(
      dbId:id,
      dbItem:dbFilter.copyWith(remoteId: "newRemoteId"),
    );

    expect(
      (await filterRepository.findByDbIdInAppType(id))!.remoteId,
      "newRemoteId",
    );
  });

  test('updateLocalFilterByRemoteFilter', () async {
    var id = await filterRepository.insertInDbType(
      dbFilter.copyWith(phrase: "phrase2"),
    );
    assert(id > 0, true);

    var oldLocalFilter = DbFilterPopulatedWrapper(
      dbFilterPopulated: DbFilterPopulated(
        dbFilter: dbFilter.copyWith(id: id),
      ),
    );
    var newRemoteFilter = DbFilterPopulatedWrapper(
      dbFilterPopulated: DbFilterPopulated(
        dbFilter: dbFilter.copyWith(id: id, phrase: "phrase3"),
      ),
    ).toPleromaFilter();
    await filterRepository.updateLocalFilterByRemoteFilter(
      oldLocalFilter: oldLocalFilter,
      newRemoteFilter: newRemoteFilter,
    );

    expect((await filterRepository.findByDbIdInAppType(id))!.phrase, "phrase3");
  });

  test('findByRemoteId', () async {
    await filterRepository.insertInDbType(dbFilter);
    expectDbFilterPopulated(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilterPopulated,
    );
  });

  test('upsertRemoteFilter', () async {
    expect(await filterRepository.countAll(), 0);

    await filterRepository.upsertRemoteFilter(
      DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
          .toPleromaFilter(),
    );

    expect(await filterRepository.countAll(), 1);

    expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );

    // item with same id updated
    await filterRepository.upsertRemoteFilter(
      DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
          .toPleromaFilter(),
    );
    expect(await filterRepository.countAll(), 1);

    expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );
  });

  test('upsertRemoteFilters', () async {
    expect(await filterRepository.countAll(), 0);
    await filterRepository.upsertRemoteFilters(
      [
        DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
            .toPleromaFilter(),
      ],
    );

    expect(await filterRepository.countAll(), 1);

    expectDbFilter(
      (await filterRepository.findByRemoteIdInAppType(dbFilter.remoteId))!,
      dbFilter,
    );

    await filterRepository.upsertRemoteFilters(
      [
        DbFilterPopulatedWrapper(dbFilterPopulated: dbFilterPopulated)
            .toPleromaFilter(),
      ],
    );

    // update item with same id
    expect(await filterRepository.countAll(), 1);
    expectDbFilter(
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

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(),
    );

    expect((await query.get()).length, 1);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyWithContextTypes single', () async {
    var query = filterRepository.createQuery(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonFilterContextType.homeAndCustomLists,
        ],
      ),
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(
        context: [],
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2"))
          .copyWith(context: ["home", "notifications"]),
    );
    expect((await query.get()).length, 1);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed3")).copyWith(context: ["public"]),
    );
    expect((await query.get()).length, 1);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed4"))
          .copyWith(context: ["public", "home", "unknown"]),
    );
    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed5")).copyWith(context: ["unknown"]),
    );
    expect((await query.get()).length, 2);
  });

  test('createQuery onlyWithContextTypes several', () async {
    var query = filterRepository.createQuery(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonFilterContextType.homeAndCustomLists,
          MastodonFilterContextType.public,
        ],
      ),
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(
        context: [],
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2"))
          .copyWith(context: ["home", "notifications"]),
    );
    expect((await query.get()).length, 1);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed3")).copyWith(context: ["public"]),
    );
    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed4"))
          .copyWith(context: ["public", "home", "unknown"]),
    );
    expect((await query.get()).length, 3);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed5")).copyWith(context: ["unknown"]),
    );
    expect((await query.get()).length, 3);
  });

  test('createQuery notExpired', () async {
    var query = filterRepository.createQuery(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonFilterContextType.homeAndCustomLists,
        ],
        notExpired: true,
      ),
      pagination: null,
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(
        seed: "seed1",
        expiresAt: null,
      )),
    );

    expect((await query.get()).length, 1);
    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(
        seed: "seed2",
        expiresAt: DateTime(3000),
      )),
    );

    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(
        seed: "seed3",
        expiresAt: DateTime(1990),
      )),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery newerThanFilter', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        newerThanItem: await createTestFilter(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(
        remoteId: "remoteId4",
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(
        remoteId: "remoteId5",
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(
        remoteId: "remoteId6",
      ),
    );

    expect((await query.get()).length, 1);
    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(
        remoteId: "remoteId7",
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanFilter', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await createTestFilter(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(
        remoteId: "remoteId3",
      ),
    );

    expect((await query.get()).length, 1);
    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(
        remoteId: "remoteId4",
      ),
    );

    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(
        remoteId: "remoteId5",
      ),
    );

    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(
        remoteId: "remoteId6",
      ),
    );

    expect((await query.get()).length, 2);
  });

  test('createQuery notNewerThanFilter & newerThanFilter', () async {
    var query = filterRepository.createQuery(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: await createTestFilter(
          seed: "remoteId5",
          remoteId: "remoteId5",
        ),
        newerThanItem: await createTestFilter(
          seed: "remoteId2",
          remoteId: "remoteId2",
        ),
      ),
      orderingTermData: FilterOrderingTermData.remoteIdDesc,
    );

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(
        remoteId: "remoteId1",
      ),
    );

    expect((await query.get()).length, 0);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(
        remoteId: "remoteId2",
      ),
    );

    expect((await query.get()).length, 0);
    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(
        seed: "seed3",
      ))
          .copyWith(
        remoteId: "remoteId3",
      ),
    );

    expect((await query.get()).length, 1);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed4")).copyWith(
        remoteId: "remoteId4",
      ),
    );

    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed5")).copyWith(
        remoteId: "remoteId5",
      ),
    );

    expect((await query.get()).length, 2);

    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed6")).copyWith(
        remoteId: "remoteId6",
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

    var filter2 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(remoteId: "remoteId2"),
    );
    var filter1 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(remoteId: "remoteId1"),
    );
    var filter3 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed3")).copyWith(remoteId: "remoteId3"),
    );

    List<DbFilterPopulated> actualList = (await query.get())
        .toDbFilterPopulatedList(dao: filterRepository.dao);

    expect(actualList.length, 3);

    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[0].dbFilter,
        ),
      ),
      filter1,
    );
    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[1].dbFilter,
        ),
      ),
      filter2,
    );
    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[2].dbFilter,
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

    var filter2 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(remoteId: "remoteId2"),
    );
    var filter1 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(remoteId: "remoteId1"),
    );
    var filter3 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed3")).copyWith(remoteId: "remoteId3"),
    );

    List<DbFilterPopulated> actualList = (await query.get())
        .toDbFilterPopulatedList(dao: filterRepository.dao);
    expect(actualList.length, 3);

    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[0].dbFilter,
        ),
      ),
      filter3,
    );
    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[1].dbFilter,
        ),
      ),
      filter2,
    );
    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[2].dbFilter,
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

    var filter2 = await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed2")).copyWith(remoteId: "remoteId2"),
    );
    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed1")).copyWith(remoteId: "remoteId1"),
    );
    await insertDbFilter(
      filterRepository,
      (await createTestDbFilter(seed: "seed3")).copyWith(remoteId: "remoteId3"),
    );

    List<DbFilterPopulated> actualList = (await query.get())
        .toDbFilterPopulatedList(dao: filterRepository.dao);
    expect(actualList.length, 1);

    expectDbFilter(
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: actualList[0].dbFilter,
        ),
      ),
      filter2,
    );
  });
}
