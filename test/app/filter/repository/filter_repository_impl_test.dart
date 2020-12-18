import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';

import '../database/filter_database_model_helper.dart';
import '../filter_model_helper.dart';
import 'filter_repository_model_helper.dart';

final String baseUrl = "https://pleroma.com";

void main() {
  AppDatabase database;
  FilterRepository filterRepository;

  DbFilterPopulated dbFilterPopulated;
  DbFilter dbFilter;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory(logStatements: false));
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
    var id = await filterRepository.insert(dbFilter);
    assert(id != null, true);
    expectDbFilterPopulated(
        await filterRepository.findById(id), dbFilterPopulated);
  });

  test('upsertAll', () async {
    var dbFilter1 = (await createTestDbFilter(seed: "seed5"))
        .copyWith(remoteId: "remoteId1");
    // same remote id
    var dbFilter2 = (await createTestDbFilter(seed: "seed6"))
        .copyWith(remoteId: "remoteId1");

    await filterRepository.upsertAll([dbFilter1]);

    expect((await filterRepository.getAll()).length, 1);

    await filterRepository.upsertAll([dbFilter2]);
    expect((await filterRepository.getAll()).length, 1);

    expectDbFilterPopulated((await filterRepository.getAll()).first,
        await createTestFilterPopulated(dbFilter2));
  });

  test('updateById', () async {
    var id = await filterRepository.insert(dbFilter);
    assert(id != null, true);

    await filterRepository.updateById(
        id, dbFilter.copyWith(remoteId: "newRemoteId"));

    expect((await filterRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('updateLocalFilterByRemoteFilter', () async {
    var id = await filterRepository.insert(
      dbFilter.copyWith(phrase: "phrase2"),
    );
    assert(id != null, true);

    var oldLocalFilter = DbFilterPopulatedWrapper(DbFilterPopulated(
      dbFilter: dbFilter.copyWith(id: id),
    ));
    var newRemoteFilter = mapLocalFilterToRemoteFilter(
      DbFilterPopulatedWrapper(
        DbFilterPopulated(
          dbFilter: dbFilter.copyWith(id: id, phrase: "phrase3"),
        ),
      ),
    );
    await filterRepository.updateLocalFilterByRemoteFilter(
      oldLocalFilter: oldLocalFilter,
      newRemoteFilter: newRemoteFilter,
    );

    expect((await filterRepository.findById(id)).phrase, "phrase3");
  });

  test('findByRemoteId', () async {
    await filterRepository.insert(dbFilter);
    expectDbFilterPopulated(
        await filterRepository.findByRemoteId(dbFilter.remoteId),
        dbFilterPopulated);
  });

  test('upsertRemoteFilter', () async {
    expect(await filterRepository.countAll(), 0);

    await filterRepository.upsertRemoteFilter(
      mapLocalFilterToRemoteFilter(
        DbFilterPopulatedWrapper(dbFilterPopulated),
      ),
    );

    expect(await filterRepository.countAll(), 1);

    expectDbFilter(
        await filterRepository.findByRemoteId(dbFilter.remoteId), dbFilter);

    // item with same id updated
    await filterRepository.upsertRemoteFilter(
      mapLocalFilterToRemoteFilter(
        DbFilterPopulatedWrapper(dbFilterPopulated),
      ),
    );
    expect(await filterRepository.countAll(), 1);

    expectDbFilter(
        await filterRepository.findByRemoteId(dbFilter.remoteId), dbFilter);
  });

  test('upsertRemoteFilters', () async {
    expect(await filterRepository.countAll(), 0);
    await filterRepository.upsertRemoteFilters(
      [
        mapLocalFilterToRemoteFilter(
            DbFilterPopulatedWrapper(dbFilterPopulated)),
      ],
    );

    expect(await filterRepository.countAll(), 1);

    expectDbFilter(
        await filterRepository.findByRemoteId(dbFilter.remoteId), dbFilter);

    await filterRepository.upsertRemoteFilters(
      [
        mapLocalFilterToRemoteFilter(
          DbFilterPopulatedWrapper(dbFilterPopulated),
        ),
      ],
    );

    // update item with same id
    expect(await filterRepository.countAll(), 1);
    expectDbFilter(
        await filterRepository.findByRemoteId(dbFilter.remoteId), dbFilter);
  });

  test('createQuery empty', () async {
    var query = filterRepository.createQuery(
      olderThanFilter: null,
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      onlyWithContextTypes: null,
    );

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed1")).copyWith());

    expect((await query.get()).length, 1);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed2")).copyWith());
    expect((await query.get()).length, 2);
  });


  test('createQuery onlyWithContextTypes single', () async {
    var query = filterRepository.createQuery(
      olderThanFilter: null,
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      onlyWithContextTypes: [
        MastodonFilterContextType.homeAndCustomLists,
      ],
    );

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed1")).copyWith(
      context: [],
    ));

    expect((await query.get()).length, 0);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed2")).copyWith(
        context: ["home", "notifications"]

    ));
    expect((await query.get()).length, 1);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed3")).copyWith(
        context: ["public"]

    ));
    expect((await query.get()).length, 1);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed4")).copyWith(
        context: ["public", "home", "unknown"]

    ));
    expect((await query.get()).length, 2);


    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed5")).copyWith(
        context: ["unknown"]

    ));
    expect((await query.get()).length, 2);
  });


  test('createQuery onlyWithContextTypes several', () async {
    var query = filterRepository.createQuery(
      olderThanFilter: null,
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      onlyWithContextTypes: [
        MastodonFilterContextType.homeAndCustomLists,
        MastodonFilterContextType.public,
      ],
    );

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed1")).copyWith(
      context: [],
    ));

    expect((await query.get()).length, 0);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed2")).copyWith(
      context: ["home", "notifications"]

    ));
    expect((await query.get()).length, 1);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed3")).copyWith(
      context: ["public"]

    ));
    expect((await query.get()).length, 2);

    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed4")).copyWith(
      context: ["public", "home", "unknown"]

    ));
    expect((await query.get()).length, 3);


    await insertDbFilter(
        filterRepository, (await createTestDbFilter(seed: "seed5")).copyWith(
        context: ["unknown"]

    ));
    expect((await query.get()).length, 3);
  });

  test('createQuery newerThanFilter', () async {
    var query = filterRepository.createQuery(
      newerThanFilter: await createTestFilter(
        seed: "remoteId5",
        remoteId: "remoteId5",
      ),
      limit: null,
      offset: null,
      orderingTermData: null,
      olderThanFilter: null,
      onlyWithContextTypes: null,
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
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      olderThanFilter: await createTestFilter(
        seed: "remoteId5",
        remoteId: "remoteId5",
      ),
      onlyWithContextTypes: null,
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
      newerThanFilter: await createTestFilter(
        seed: "remoteId2",
        remoteId: "remoteId2",
      ),
      limit: null,
      offset: null,
      orderingTermData: null,
      olderThanFilter: await createTestFilter(
        seed: "remoteId5",
        remoteId: "remoteId5",
      ),
      onlyWithContextTypes: null,
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
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: FilterOrderingTermData(
          orderByType: FilterOrderByType.remoteId,
          orderingMode: OrderingMode.asc),
      olderThanFilter: null,
      onlyWithContextTypes: null,
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

    List<DbFilterPopulated> actualList =
        (await query.map(filterRepository.dao.typedResultToPopulated).get());
    expect(actualList.length, 3);

    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[0].dbFilter,
          ),
        ),
        filter1);
    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[1].dbFilter,
          ),
        ),
        filter2);
    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[2].dbFilter,
          ),
        ),
        filter3);
  });

  test('createQuery orderingTermData remoteId desc no limit', () async {
    var query = filterRepository.createQuery(
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: FilterOrderingTermData(
          orderByType: FilterOrderByType.remoteId,
          orderingMode: OrderingMode.desc),
      olderThanFilter: null,
      onlyWithContextTypes: null,
    );

    var filter2 = await insertDbFilter(
        filterRepository,
        (await createTestDbFilter(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    var filter1 = await insertDbFilter(
        filterRepository,
        (await createTestDbFilter(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    var filter3 = await insertDbFilter(
        filterRepository,
        (await createTestDbFilter(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    List<DbFilterPopulated> actualList =
        (await query.map(filterRepository.dao.typedResultToPopulated).get());
    expect(actualList.length, 3);

    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[0].dbFilter,
          ),
        ),
        filter3);
    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[1].dbFilter,
          ),
        ),
        filter2);
    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[2].dbFilter,
          ),
        ),
        filter1);
  });

  test('createQuery orderingTermData remoteId desc & limit & offset', () async {
    var query = filterRepository.createQuery(
      newerThanFilter: null,
      limit: 1,
      offset: 1,
      orderingTermData: FilterOrderingTermData(
          orderByType: FilterOrderByType.remoteId,
          orderingMode: OrderingMode.desc),
      olderThanFilter: null,
      onlyWithContextTypes: null,
    );

    var filter2 = await insertDbFilter(
        filterRepository,
        (await createTestDbFilter(seed: "seed2"))
            .copyWith(remoteId: "remoteId2"));
    await insertDbFilter(
        filterRepository,
        (await createTestDbFilter(seed: "seed1"))
            .copyWith(remoteId: "remoteId1"));
    await insertDbFilter(
        filterRepository,
        (await createTestDbFilter(seed: "seed3"))
            .copyWith(remoteId: "remoteId3"));

    List<DbFilterPopulated> actualList =
        (await query.map(filterRepository.dao.typedResultToPopulated).get());
    expect(actualList.length, 1);

    expectDbFilter(
        DbFilterPopulatedWrapper(
          DbFilterPopulated(
            dbFilter: actualList[0].dbFilter,
          ),
        ),
        filter2);
  });
}
