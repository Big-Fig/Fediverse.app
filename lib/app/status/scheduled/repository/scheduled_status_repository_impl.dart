import 'package:collection/collection.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_dao.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("scheduledStatus_repository_impl.dart");

var _singleScheduledStatusRepositoryPagination =
    RepositoryPagination<IScheduledStatus>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class ScheduledStatusRepository extends AsyncInitLoadingBloc
    implements IScheduledStatusRepository {
  late ScheduledStatusDao dao;

  ScheduledStatusRepository({required AppDatabase appDatabase}) {
    dao = appDatabase.scheduledStatusDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future<DbScheduledStatusWrapper> findByRemoteId(
    String remoteId,
  ) async =>
      mapDataClassToItem(
        await dao.findByRemoteId(remoteId).getSingle(),
      );

  @override
  Stream<DbScheduledStatusWrapper> watchByRemoteId(
    String? remoteId,
  ) =>
      dao.findByRemoteId(remoteId!).watchSingle().map(
            mapDataClassToItem,
          );

  @override
  Future upsertAll(List<DbScheduledStatus> items) async {
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
  Future insertAll(List<DbScheduledStatus> items) async {
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
  Future<DbScheduledStatusWrapper> findById(int id) =>
      dao.findById(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbScheduledStatusWrapper> watchById(int id) =>
      dao.findById(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbScheduledStatusWrapper>> getAll() =>
      dao.getAll().map(mapDataClassToItem).get();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbScheduledStatusWrapper>> watchAll() =>
      dao.getAll().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbScheduledStatus item) => dao.insert(item);

  @override
  Future<int> upsert(DbScheduledStatus item) => dao.upsert(item);

  @override
  Future<bool> updateById(
    int? id,
    DbScheduledStatus dbScheduledStatus,
  ) {
    if (dbScheduledStatus.id != id) {
      dbScheduledStatus = dbScheduledStatus.copyWith(id: id);
    }
    return dao.replace(dbScheduledStatus);
  }

  DbScheduledStatusWrapper mapDataClassToItem(DbScheduledStatus dataClass) {
    return DbScheduledStatusWrapper(dbScheduledStatus: dataClass);
  }

  Insertable<DbScheduledStatus>? mapItemToDataClass(
    DbScheduledStatusWrapper item,
  ) =>
      item.dbScheduledStatus;

  @override
  Future upsertRemoteScheduledStatus(
    IPleromaScheduledStatus remoteScheduledStatus,
  ) async {
    await upsert(
      remoteScheduledStatus.toDbScheduledStatus(canceled: false),
    );
  }

  @override
  Future upsertRemoteScheduledStatuses(
    List<IPleromaScheduledStatus> remoteScheduledStatuses,
  ) async {
    if (remoteScheduledStatuses.isNotEmpty == true) {
      await upsertAll(
        remoteScheduledStatuses
            .map(
              (remoteScheduledStatus) =>
                  remoteScheduledStatus.toDbScheduledStatus(
                canceled: false,
              ),
            )
            .toList(),
      );
    }
  }

  @override
  Future updateLocalScheduledStatusByRemoteScheduledStatus({
    required IScheduledStatus oldLocalScheduledStatus,
    required IPleromaScheduledStatus newRemoteScheduledStatus,
  }) async {
    _logger.finer(() => "updateLocalScheduledStatusByRemoteScheduledStatus \n"
        "\t old: $oldLocalScheduledStatus \n"
        "\t newRemoteScheduledStatus: $newRemoteScheduledStatus");

    var newLocalScheduledStatus = newRemoteScheduledStatus.toDbScheduledStatus(
      canceled: oldLocalScheduledStatus.canceled,
    );
    await updateById(
      oldLocalScheduledStatus.localId,
      newLocalScheduledStatus,
    );
  }

  @override
  Future<List<DbScheduledStatusWrapper>> getScheduledStatuses({
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IScheduledStatus>? pagination,
    ScheduledStatusOrderingTermData? orderingTermData =
        ScheduledStatusOrderingTermData.remoteIdDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedScheduledStatusesList = await query.get();

    return dao
        .typedResultListToPopulated(typedScheduledStatusesList)
        .map(
          (dbScheduledStatus) => mapDataClassToItem(dbScheduledStatus),
        )
        .toList();
  }

  @override
  Stream<List<DbScheduledStatusWrapper>> watchScheduledStatuses({
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IScheduledStatus>? pagination,
    ScheduledStatusOrderingTermData? orderingTermData =
        ScheduledStatusOrderingTermData.remoteIdDesc,
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
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IScheduledStatus>? pagination,
    required ScheduledStatusOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData!.orderType ==
          ScheduledStatusRepositoryOrderType.remoteId);
      query = dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }

    if (filters?.excludeCanceled == true) {
      query = dao.addExcludeCanceledWhere(query);
    }

    if (filters?.excludeScheduleAtExpired == true) {
      query = dao.addExcludeScheduleAtExpiredWhere(query);
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

    var limit = pagination?.limit;
    if (limit != null) {
      joinQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return joinQuery;
  }

  @override
  Future<DbScheduledStatusWrapper?> getScheduledStatus({
    required ScheduledStatusRepositoryFilters? filters,
    ScheduledStatusOrderingTermData? orderingTermData =
        ScheduledStatusOrderingTermData.remoteIdDesc,
  }) async {
    var scheduledStatuses = await getScheduledStatuses(
      filters: filters,
      pagination: _singleScheduledStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return scheduledStatuses.first;
  }

  @override
  Stream<DbScheduledStatusWrapper?> watchScheduledStatus({
    required ScheduledStatusRepositoryFilters? filters,
    ScheduledStatusOrderingTermData? orderingTermData =
        ScheduledStatusOrderingTermData.remoteIdDesc,
  }) {
    var scheduledStatusesStream = watchScheduledStatuses(
      filters: filters,
      pagination: _singleScheduledStatusRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return scheduledStatusesStream.map(
      (scheduledStatuses) => scheduledStatuses.firstOrNull,
    );
  }

  @override
  Future markAsCanceled({
    required IScheduledStatus scheduledStatus,
  }) async {
    await updateById(
      scheduledStatus.localId,
      DbScheduledStatus(
        canceled: true,
        params: scheduledStatus.params.toPleromaScheduledStatusParams(),
        mediaAttachments: scheduledStatus.mediaAttachments,
        id: scheduledStatus.localId,
        remoteId: scheduledStatus.remoteId!,
        scheduledAt: scheduledStatus.scheduledAt,
      ),
    );
  }
}
