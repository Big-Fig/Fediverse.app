import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/database/filter_database_dao.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("filter_repository_impl.dart");

var _singleFilterRepositoryPagination = RepositoryPagination<IFilter>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class FilterRepository extends AsyncInitLoadingBloc
    implements IFilterRepository {
  final FilterDao dao;

  FilterRepository({
    required AppDatabase appDatabase,
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
      remoteFilter.toDbFilter(),
    );
  }

  @override
  Future upsertRemoteFilters(
    List<IPleromaFilter> remoteFilters,
  ) async {
    _logger.finer(() => "upsertRemoteFilters ${remoteFilters.length} ");
    if (remoteFilters.isEmpty) {
      return;
    }
    await upsertAll(remoteFilters
        .map(
          (remoteFilter) => remoteFilter.toDbFilter(),
        )
        .toList());
  }

  @override
  Future<DbFilterPopulatedWrapper> findByRemoteId(
    String? remoteId,
  ) async =>
      mapDataClassToItem(
        await dao.findByRemoteId(remoteId),
      );

  @override
  Future<List<DbFilterPopulatedWrapper>> getFilters({
    required FilterRepositoryFilters filters,
    required RepositoryPagination<IFilter>? pagination,
    FilterOrderingTermData orderingTermData =
        FilterOrderingTermData.remoteIdDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedResult = await query.get();
    return dao
        .typedResultListToPopulated(typedResult)
        .map(mapDataClassToItem)
        .toList();
  }

  @override
  Stream<List<DbFilterPopulatedWrapper>> watchFilters({
    required FilterRepositoryFilters filters,
    required RepositoryPagination<IFilter> pagination,
    FilterOrderingTermData orderingTermData =
        FilterOrderingTermData.remoteIdDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<DbFilterPopulated>> stream =
        query.watch().map(dao.typedResultListToPopulated);
    return stream.map((list) => list.map(mapDataClassToItem).toList());
  }

  JoinedSelectStatement createQuery({
    required FilterRepositoryFilters? filters,
    required RepositoryPagination<IFilter>? pagination,
    required FilterOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }

    if (filters?.onlyWithContextTypes?.isNotEmpty == true) {
      dao.addContextTypesWhere(
        query,
        filters!.onlyWithContextTypes!,
      );
    }

    if (filters?.notExpired == true) {
      dao.addNotExpiredWhere(query);
    }

    if (orderingTermData != null) {
      dao.orderBy(
        query,
        [orderingTermData],
      );
    }
    var joinQuery = query.join(
      dao.populateFilterJoin(),
    );

    var finalQuery = joinQuery;

    var limit = pagination?.limit;
    if (limit != null) {
      finalQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return finalQuery;
  }

  @override
  Future upsertAll(List<DbFilter> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(
      items,
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future insertAll(List<DbFilter> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(
      items,
      InsertMode.insertOrRollback,
    );
  }

  @override
  Future clear() => dao.clear();

  @override
  Future<bool> deleteById(int? id) async {
    var affectedRows = await dao.deleteById(id!);
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
  Stream<IFilter> watchByRemoteId(String? remoteId) {
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
  Future<bool> updateById(int? id, DbFilter dbFilter) {
    if (dbFilter.id != id) {
      dbFilter = dbFilter.copyWith(id: id);
    }
    return dao.replace(dbFilter);
  }

  DbFilterPopulatedWrapper mapDataClassToItem(DbFilterPopulated dataClass) {
    return DbFilterPopulatedWrapper(dbFilterPopulated: dataClass);
  }

  Insertable<DbFilter>? mapItemToDataClass(DbFilterPopulatedWrapper item) {
    return item.dbFilterPopulated.dbFilter;
  }

  @override
  Future updateLocalFilterByRemoteFilter({
    required IFilter? oldLocalFilter,
    required IPleromaFilter newRemoteFilter,
  }) async {
    _logger.finer(() => "updateLocalFilterByRemoteFilter \n"
        "\t old: $oldLocalFilter \n"
        "\t newRemoteFilter: $newRemoteFilter");

    await updateById(
      oldLocalFilter!.localId,
      newRemoteFilter.toDbFilter(),
    );
  }

  @override
  Future<DbFilterPopulatedWrapper> getFilter({
    required FilterRepositoryFilters filters,
    FilterOrderingTermData orderingTermData =
        FilterOrderingTermData.remoteIdDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: _singleFilterRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return mapDataClassToItem(
      dao.typedResultToPopulated(
        await query.getSingle(),
      ),
    );
  }

  @override
  Stream<DbFilterPopulatedWrapper> watchFilter({
    required FilterRepositoryFilters filters,
    FilterOrderingTermData orderingTermData =
        FilterOrderingTermData.remoteIdDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: _singleFilterRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    Stream<DbFilterPopulated> stream = query.watchSingle().map(
          (typedResult) => dao.typedResultToPopulated(typedResult),
        );
    return stream.map(
      (dbFilter) => mapDataClassToItem(dbFilter),
    );
  }
}
