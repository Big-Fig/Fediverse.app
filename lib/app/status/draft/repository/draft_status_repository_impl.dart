import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_dao.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_model_adapter.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("draftStatus_repository_impl.dart");

var _singleDraftStatusRepositoryPagination = RepositoryPagination<IDraftStatus>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class DraftStatusRepository extends AsyncInitLoadingBloc
    implements IDraftStatusRepository {
  DraftStatusDao dao;

  DraftStatusRepository({@required AppDatabase appDatabase}) {
    dao = appDatabase.draftStatusDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future upsertAll(Iterable<DbDraftStatus> items) async {
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
  Future insertAll(Iterable<DbDraftStatus> items) async {
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
  Future<bool> deleteById(int id) async {
    var affectedRows = await dao.deleteById(id);
    assert(affectedRows == 0 || affectedRows == 1);
    return (affectedRows) == 1;
  }

  @override
  Future<DbDraftStatusWrapper> findById(int id) =>
      dao.findById(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbDraftStatusWrapper> watchById(int id) =>
      dao.findById(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbDraftStatusWrapper>> getAll() =>
      dao.getAll().map(mapDataClassToItem).get();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbDraftStatusWrapper>> watchAll() =>
      dao.getAll().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbDraftStatus item) => dao.insert(item);

  @override
  Future<int> upsert(DbDraftStatus item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbDraftStatus dbDraftStatus) {
    if (dbDraftStatus.id != id) {
      dbDraftStatus = dbDraftStatus.copyWith(id: id);
    }
    return dao.replace(dbDraftStatus);
  }

  DbDraftStatusWrapper mapDataClassToItem(DbDraftStatus dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbDraftStatusWrapper(dataClass);
  }

  Insertable<DbDraftStatus> mapItemToDataClass(DbDraftStatusWrapper item) =>
      item.dbDraftStatus;

  @override
  Future<List<DbDraftStatusWrapper>> getDraftStatuses({
    @required ScheduledStatusRepositoryFilters filters,
    @required RepositoryPagination<IDraftStatus> pagination,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedDraftStatusesList = await query.get();

    return dao
        .typedResultListToPopulated(typedDraftStatusesList)
        .map(
          (dbDraftStatus) => mapDataClassToItem(
            dbDraftStatus,
          ),
        )
        .toList();
  }

  @override
  Stream<List<DbDraftStatusWrapper>> watchDraftStatuses({
    @required ScheduledStatusRepositoryFilters filters,
    @required RepositoryPagination<IDraftStatus> pagination,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<TypedResult>> stream = query.watch();

    return stream.map((typedList) => dao
        .typedResultListToPopulated(typedList)
        .map(mapDataClassToItem)
        .toList());
  }

  JoinedSelectStatement createQuery({
    @required ScheduledStatusRepositoryFilters filters,
    @required RepositoryPagination<IDraftStatus> pagination,
    @required DraftStatusOrderingTermData orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData.orderType ==
          DraftStatusRepositoryOrderType.updatedAt);
      query = dao.addUpdatedAtBoundsWhere(
        query,
        maximumUpdatedAtExcluding: pagination?.olderThanItem?.updatedAt,
        minimumUpdatedAtExcluding: pagination?.newerThanItem?.updatedAt,
      );
    }

    if (orderingTermData != null) {
      query = dao.orderBy(
        query,
        [
          orderingTermData,
        ],
      );
    }

    // nothing to join by now, just to avoid unnecessary code wrappers overhead
    var joinQuery = query.join([]);

    if (pagination?.limit != null) {
      joinQuery.limit(pagination?.limit, offset: pagination?.offset);
    }
    return joinQuery;
  }

  @override
  Future<DbDraftStatusWrapper> getDraftStatus({
    @required ScheduledStatusRepositoryFilters filters,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) async {
    var draftStatuses = await getDraftStatuses(
      filters: filters,
      pagination: _singleDraftStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return draftStatuses?.first;
  }

  @override
  Stream<DbDraftStatusWrapper> watchDraftStatus({
    @required ScheduledStatusRepositoryFilters filters,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  }) {
    var draftStatusesStream = watchDraftStatuses(
      filters: filters,
      pagination: _singleDraftStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return draftStatusesStream.map(
      (draftStatuses) => draftStatuses?.first,
    );
  }

  @override
  Future addDraftStatus({
    IDraftStatus draftStatus,
  }) =>
      insert(mapDraftStatusToDbDraftStatus(draftStatus));
}
