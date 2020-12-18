import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/database/filter_database_dao.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("filter_repository_impl.dart");

class FilterRepository extends AsyncInitLoadingBloc
    implements IFilterRepository {
  final FilterDao dao;

  FilterRepository({
    @required AppDatabase appDatabase,
  }) : dao = appDatabase.filterDao;

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertRemoteFilter(IPleromaFilter remoteFilter) async {
    _logger.finer(() => "upsertRemoteFilter ${remoteFilter.id} "
        "$remoteFilter");

    await upsert(
      mapRemoteFilterToDbFilter(remoteFilter),
    );
  }

  @override
  Future upsertRemoteFilters(List<IPleromaFilter> remoteFilters) async {
    _logger.finer(() => "upsertRemoteFilters ${remoteFilters.length} ");
    if (remoteFilters.isEmpty) {
      return;
    }
    await upsertAll(remoteFilters
        .map((remoteFilter) => mapRemoteFilterToDbFilter(remoteFilter))
        .toList());
  }

  @override
  Future<DbFilterPopulatedWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteId(remoteId));

  @override
  Future<List<DbFilterPopulatedWrapper>> getFilters({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required int limit,
    @required int offset,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  }) async {
    var query = createQuery(
      olderThanFilter: olderThanFilter,
      newerThanFilter: newerThanFilter,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
      onlyWithContextTypes: onlyWithContextTypes,
    );

    return dao
        .typedResultListToPopulated(await query.get())
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbFilterPopulatedWrapper>> watchFilters({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required int limit,
    @required int offset,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  }) {
    var query = createQuery(
      olderThanFilter: olderThanFilter,
      newerThanFilter: newerThanFilter,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
      onlyWithContextTypes: onlyWithContextTypes,
    );

    Stream<List<DbFilterPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required int limit,
    @required int offset,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t olderThanFilter=$olderThanFilter\n"
        "\t newerThanFilter=$newerThanFilter\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t onlyWithContextTypes=$onlyWithContextTypes\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThanFilter != null || newerThanFilter != null) {
      dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: olderThanFilter?.remoteId,
        minimumRemoteIdExcluding: newerThanFilter?.remoteId,
      );
    }

    if (onlyWithContextTypes?.isNotEmpty == true) {
      dao.addContextTypesWhere(query, onlyWithContextTypes);
    }
    
    if (orderingTermData != null) {
      dao.orderBy(query, [orderingTermData]);
    }
    var joinQuery = query.join(
      dao.populateFilterJoin(),
    );

    var finalQuery = joinQuery;

    assert(!(limit == null && offset != null));
    if (limit != null) {
      finalQuery.limit(limit, offset: offset);
    }
    return finalQuery;
  }

  @override
  Future upsertAll(Iterable<DbFilter> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbFilter> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(items, InsertMode.insertOrRollback);
  }

  @override
  Future clear() => dao.clear();

  @override
  Future<bool> deleteById(int id) async {
    var affectedRows = await dao.deleteById(id);
    assert(affectedRows == 0 || affectedRows == 1);
    return (affectedRows) == 1;
  }

  @override
  Future<IFilter> findById(int id) async =>
      mapDataClassToItem(await dao.findById(id));

  @override
  Stream<DbFilterPopulatedWrapper> watchById(int id) =>
      (dao.watchById(id)).map(mapDataClassToItem);

  @override
  Stream<IFilter> watchByRemoteId(String remoteId) {
    _logger.finest(() => "watchByRemoteId $remoteId");
    return (dao.watchByRemoteId(remoteId)).map(mapDataClassToItem);
  }

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbFilterPopulatedWrapper>> getAll() async =>
      (await dao.findAll()).map(mapDataClassToItem).toList();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbFilterPopulatedWrapper>> watchAll() =>
      (dao.watchAll()).map((list) => list.map(mapDataClassToItem).toList());

  @override
  Future<int> insert(DbFilter item) => dao.insert(item);

  @override
  Future<int> upsert(DbFilter item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbFilter dbFilter) {
    if (dbFilter.id != id) {
      dbFilter = dbFilter.copyWith(id: id);
    }
    return dao.replace(dbFilter);
  }

  DbFilterPopulatedWrapper mapDataClassToItem(DbFilterPopulated dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbFilterPopulatedWrapper(dataClass);
  }

  Insertable<DbFilter> mapItemToDataClass(DbFilterPopulatedWrapper item) {
    if (item == null) {
      return null;
    }
    return item.dbFilterPopulated.dbFilter;
  }

  @override
  Future updateLocalFilterByRemoteFilter({
    @required IFilter oldLocalFilter,
    @required IPleromaFilter newRemoteFilter,
  }) async {
    _logger.finer(() => "updateLocalFilterByRemoteFilter \n"
        "\t old: $oldLocalFilter \n"
        "\t newRemoteFilter: $newRemoteFilter");

    await updateById(
        oldLocalFilter.localId, mapRemoteFilterToDbFilter(newRemoteFilter));
  }

  @override
  Future<DbFilterPopulatedWrapper> getFilter({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  }) async {
    var query = createQuery(
      olderThanFilter: olderThanFilter,
      newerThanFilter: newerThanFilter,
      limit: 1,
      offset: null,
      orderingTermData: orderingTermData,
      onlyWithContextTypes: onlyWithContextTypes,
    );

    return mapDataClassToItem(
        dao.typedResultToPopulated(await query.getSingle()));
  }

  @override
  Stream<DbFilterPopulatedWrapper> watchFilter({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  }) {
    var query = createQuery(
      olderThanFilter: olderThanFilter,
      newerThanFilter: newerThanFilter,
      limit: 1,
      offset: null,
      orderingTermData: orderingTermData,
      onlyWithContextTypes: onlyWithContextTypes,
    );

    Stream<DbFilterPopulated> stream = query
        .watchSingle()
        .map((typedResult) => dao.typedResultToPopulated(typedResult));
    return stream.map((dbFilter) => mapDataClassToItem(dbFilter));
  }
}
