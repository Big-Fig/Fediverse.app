import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_model.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:moor/moor.dart';

part 'scheduled_status_database_dao.g.dart';

@UseDao(tables: [
  DbScheduledStatuses
], queries: {
  "countAll": "SELECT Count(*) FROM db_scheduled_statuses;",
  "findById": "SELECT * FROM db_scheduled_statuses WHERE id = :id;",
  "findByRemoteId":
      "SELECT * FROM db_scheduled_statuses WHERE remote_id LIKE :remoteId;",
  "countById": "SELECT COUNT(*) FROM db_scheduled_statuses WHERE id = :id;",
  "deleteById": "DELETE FROM db_scheduled_statuses WHERE id = :id;",
  "clear": "DELETE FROM db_scheduled_statuses",
  "getAll": "SELECT * FROM db_scheduled_statuses",
  "findLocalIdByRemoteId":
      "SELECT id FROM db_scheduled_statuses WHERE remote_id = "
          ":remoteId;",
})
class ScheduledStatusDao extends DatabaseAccessor<AppDatabase>
    with _$ScheduledStatusDaoMixin {
    final AppDatabase db;

  // Called by the AppDatabase class
  ScheduledStatusDao(this.db) : super(db);

  Future<int> insert(Insertable<DbScheduledStatus> entity) =>
      into(dbScheduledStatuses).insert(entity);

  Future<int> upsert(Insertable<DbScheduledStatus> entity) =>
      into(dbScheduledStatuses)
          .insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(Iterable<Insertable<DbScheduledStatus>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbScheduledStatuses, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbScheduledStatus> entity) async =>
      await update(dbScheduledStatuses).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbScheduledStatus> entity) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(dbScheduledStatuses)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
      startSelectQuery() => (select(db.dbScheduledStatuses));

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
      addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> query, {
    @required String minimumRemoteIdExcluding,
    @required String maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
          "db_scheduled_statuses.remote_id > '$minimumRemoteIdExcluding'");
      query = query..where((scheduledStatus) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
          "db_scheduled_statuses.remote_id < '$maximumRemoteIdExcluding'");
      query = query..where((scheduledStatus) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbScheduledStatusesTable,
      DbScheduledStatus> addExcludeCanceledWhere(
          SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
              query) =>
      query
        ..where(
            (scheduledStatus) => scheduledStatus.canceled.equals(true).not());

  SimpleSelectStatement<$DbScheduledStatusesTable,
      DbScheduledStatus> addExcludeScheduleAtExpiredWhere(
          SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
              query) =>
      query
        ..where((scheduledStatus) => scheduledStatus.scheduledAt
            .isBiggerThanValue(DateTime.now().toUtc()));

  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> orderBy(
          SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
              query,
          List<ScheduledStatusOrderingTermData> orderTerms) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderByType) {
                    case ScheduledStatusRepositoryOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());

  List<DbScheduledStatus> typedResultListToPopulated(
      List<TypedResult> typedResult) {
    if (typedResult == null) {
      return null;
    }
    return typedResult.map(typedResultToPopulated).toList();
  }

  DbScheduledStatus typedResultToPopulated(TypedResult typedResult) {
    if (typedResult == null) {
      return null;
    }

    return typedResult.readTable(db.dbScheduledStatuses);
  }
}
