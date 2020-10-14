import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_dao.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_model_adapter.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("draftStatus_repository_impl.dart");

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
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbDraftStatus> items) async {
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
  Future<List<DbDraftStatusWrapper>> getDraftStatuses(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required int limit,
      @required int offset,
      @required DraftStatusOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThan: olderThan,
        newerThan: newerThan,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    var typedDraftStatusesList = await query.get();

    return dao
        .typedResultListToPopulated(typedDraftStatusesList)
        .map((dbDraftStatus) => mapDataClassToItem(dbDraftStatus))
        .toList();
  }

  @override
  Stream<List<DbDraftStatusWrapper>> watchDraftStatuses(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required int limit,
      @required int offset,
      @required DraftStatusOrderingTermData orderingTermData}) {
    var query = createQuery(
      olderThan: olderThan,
      newerThan: newerThan,
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
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required int limit,
      @required int offset,
      @required DraftStatusOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t olderThan=$olderThan\n"
        "\t newerThan=$newerThan\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThan != null || newerThan != null) {
      query = dao.addUpdatedAtBoundsWhere(
        query,
        maximumUpdatedAtExcluding: olderThan?.updatedAt,
        minimumUpdatedAtExcluding: newerThan?.updatedAt,
      );
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
  Future<DbDraftStatusWrapper> getDraftStatus(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required bool excludeCanceled,
      @required bool excludeScheduleAtExpired,
      @required DraftStatusOrderingTermData orderingTermData}) async {
    var draftStatuses = await getDraftStatuses(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return draftStatuses?.first;
  }

  @override
  Stream<DbDraftStatusWrapper> watchDraftStatus(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required DraftStatusOrderingTermData orderingTermData}) {
    var draftStatusesStream = watchDraftStatuses(
        olderThan: olderThan,
        newerThan: newerThan,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return draftStatusesStream.map((draftStatuses) => draftStatuses?.first);
  }

  @override
  Future addDraftStatus({
    IDraftStatus draftStatus,
  }) => insert(mapDraftStatusToDbDraftStatus(draftStatus));

}
