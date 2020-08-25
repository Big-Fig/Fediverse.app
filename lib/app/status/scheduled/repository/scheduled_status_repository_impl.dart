import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_dao.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("scheduledStatus_repository_impl.dart");

class ScheduledStatusRepository extends AsyncInitLoadingBloc
    implements IScheduledStatusRepository {
  ScheduledStatusDao dao;

  ScheduledStatusRepository({@required AppDatabase appDatabase}) {
    dao = appDatabase.scheduledStatusDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future<DbScheduledStatusWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteIdQuery(remoteId).getSingle());

  @override
  Stream<DbScheduledStatusWrapper> watchByRemoteId(String remoteId) =>
      dao.findByRemoteIdQuery(remoteId).watchSingle().map(mapDataClassToItem);

  @override
  Future upsertAll(Iterable<DbScheduledStatus> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbScheduledStatus> items) async {
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
  Future<DbScheduledStatusWrapper> findById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbScheduledStatusWrapper> watchById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbScheduledStatusWrapper>> getAll() =>
      dao.getAllQuery().map(mapDataClassToItem).get();

  @override
  Future<int> countAll() => dao.countAllQuery().getSingle();

  @override
  Stream<List<DbScheduledStatusWrapper>> watchAll() =>
      dao.getAllQuery().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbScheduledStatus item) => dao.insert(item);

  @override
  Future<int> upsert(DbScheduledStatus item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbScheduledStatus dbScheduledStatus) {
    if (dbScheduledStatus.id != id) {
      dbScheduledStatus = dbScheduledStatus.copyWith(id: id);
    }
    return dao.replace(dbScheduledStatus);
  }

  DbScheduledStatusWrapper mapDataClassToItem(DbScheduledStatus dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbScheduledStatusWrapper(dataClass);
  }

  Insertable<DbScheduledStatus> mapItemToDataClass(
          DbScheduledStatusWrapper item) =>
      item.dbScheduledStatus;

  @override
  Future upsertRemoteScheduledStatus(
    IPleromaScheduledStatus remoteScheduledStatus,
  ) async {
    await upsert(mapRemoteScheduledStatusToDbScheduledStatus(
        remoteScheduledStatus,
        canceled: false));
  }

  @override
  Future upsertRemoteScheduledStatuses(
    List<IPleromaScheduledStatus> remoteScheduledStatuses,
  ) async {
    if (remoteScheduledStatuses?.isNotEmpty == true) {
      await upsertAll(remoteScheduledStatuses
          .map((remoteScheduledStatus) =>
              mapRemoteScheduledStatusToDbScheduledStatus(remoteScheduledStatus,
                  canceled: false))
          .toList());
    }
  }

  @override
  Future updateLocalScheduledStatusByRemoteScheduledStatus(
      {@required IScheduledStatus oldLocalScheduledStatus,
      @required IPleromaScheduledStatus newRemoteScheduledStatus}) async {
    _logger.finer(() => "updateLocalScheduledStatusByRemoteScheduledStatus \n"
        "\t old: $oldLocalScheduledStatus \n"
        "\t newRemoteScheduledStatus: $newRemoteScheduledStatus");

    var newLocalScheduledStatus = mapRemoteScheduledStatusToDbScheduledStatus(
        newRemoteScheduledStatus,
        canceled: oldLocalScheduledStatus.canceled);
    await updateById(oldLocalScheduledStatus.localId, newLocalScheduledStatus);
  }

  @override
  Future<List<DbScheduledStatusWrapper>> getScheduledStatuses(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThan: olderThan,
        newerThan: newerThan,
        excludeCanceled: excludeCanceled,
        excludeScheduleAtExpired: excludeScheduleAtExpired,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    var typedScheduledStatusesList = await query.get();

    return dao
        .typedResultListToPopulated(typedScheduledStatusesList)
        .map((dbScheduledStatus) => mapDataClassToItem(dbScheduledStatus))
        .toList();
  }

  @override
  Stream<List<DbScheduledStatusWrapper>> watchScheduledStatuses(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData}) {
    var query = createQuery(
      olderThan: olderThan,
      newerThan: newerThan,
      excludeCanceled: excludeCanceled,
      excludeScheduleAtExpired: excludeScheduleAtExpired,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
    );

    Stream<List<TypedResult>> stream = query.watch();

    return stream.map((typedList) => dao
        .typedResultListToPopulated(typedList)
        .map(mapDataClassToItem)
        .toList());
  }

  JoinedSelectStatement createQuery(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t olderThan=$olderThan\n"
        "\t newerThan=$newerThan\n"
        "\t excludeCanceled=$excludeCanceled\n"
        "\t excludeScheduleAtExpired=$excludeScheduleAtExpired\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThan != null || newerThan != null) {
      query = dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThan?.remoteId,
          minimumRemoteIdExcluding: newerThan?.remoteId);
    }

    if (excludeCanceled == true) {
      query = dao.addExcludeCanceledWhere(query);
    }

    if (excludeScheduleAtExpired == true) {
      query = dao.addExcludeScheduleAtExpiredWhere(query);
    }

    if (orderingTermData != null) {
      query = dao.orderBy(query, [orderingTermData]);
    }

    // nothing to join by now, just to avoid unnecessary code wrappers overhead
    var joinQuery = query.join([]);

    assert(!(limit == null && offset != null));
    if (limit != null) {
      joinQuery.limit(limit, offset: offset);
    }
    return joinQuery;
  }

  @override
  Future<DbScheduledStatusWrapper> getScheduledStatus(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required ScheduledStatusOrderingTermData orderingTermData}) async {
    var scheduledStatuses = await getScheduledStatuses(
        olderThan: olderThan,
        newerThan: newerThan,
        excludeCanceled: excludeCanceled,
        excludeScheduleAtExpired: excludeScheduleAtExpired,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return scheduledStatuses?.first;
  }

  @override
  Stream<DbScheduledStatusWrapper> watchScheduledStatus(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required ScheduledStatusOrderingTermData orderingTermData}) {
    var scheduledStatusesStream = watchScheduledStatuses(
        olderThan: olderThan,
        newerThan: newerThan,
        excludeCanceled: excludeCanceled,
        excludeScheduleAtExpired: excludeScheduleAtExpired,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return scheduledStatusesStream
        .map((scheduledStatuses) => scheduledStatuses?.first);
  }

  @override
  Future markAsCanceled({@required IScheduledStatus scheduledStatus}) async {
    await updateById(
        scheduledStatus.localId,
        DbScheduledStatus(
            canceled: true,
            params: scheduledStatus.params,
            mediaAttachments: scheduledStatus.mediaAttachments,
            id: scheduledStatus.localId,
            remoteId: scheduledStatus.remoteId,
            scheduledAt: scheduledStatus.scheduledAt));
  }
}
