import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_model.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:moor/moor.dart';

part 'scheduled_status_database_dao.g.dart';

@UseDao(
  tables: [
    DbScheduledStatuses,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_scheduled_statuses;",
    "findById": "SELECT * FROM db_scheduled_statuses WHERE id = :id;",
    "findByRemoteId":
        "SELECT * FROM db_scheduled_statuses WHERE remote_id LIKE :remoteId;",
    "countById": "SELECT COUNT(*) FROM db_scheduled_statuses WHERE id = :id;",
    "deleteById": "DELETE FROM db_scheduled_statuses WHERE id = :id;",
    "deleteByRemoteId": "DELETE FROM db_scheduled_statuses WHERE remote_id = :remoteId;",
    "clear": "DELETE FROM db_scheduled_statuses",
    "getAll": "SELECT * FROM db_scheduled_statuses",
    "findLocalIdByRemoteId":
        "SELECT id FROM db_scheduled_statuses WHERE remote_id = "
            ":remoteId;",
  },
)
class ScheduledStatusDao extends PopulatedAppRemoteDatabaseDao<
    DbScheduledStatus,
    DbScheduledStatusPopulated,
    int,
    String,
    $DbScheduledStatusesTable,
    $DbScheduledStatusesTable> with _$ScheduledStatusDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ScheduledStatusDao(this.db) : super(db);

  Future<int> updateByRemoteId(
    String remoteId,
    Insertable<DbScheduledStatus> entity,
  ) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(dbScheduledStatuses)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(
        entity: entity,
        mode: null,
      );
    }

    return localId;
  }

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
      addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> query, {
    required String? minimumRemoteIdExcluding,
    required String? maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "db_scheduled_statuses.remote_id > '$minimumRemoteIdExcluding'",
      );
      query = query..where((scheduledStatus) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "db_scheduled_statuses.remote_id < '$maximumRemoteIdExcluding'",
      );
      query = query..where((scheduledStatus) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
      addExcludeCanceledWhere(
    SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> query,
  ) =>
          query
            ..where((scheduledStatus) =>
                scheduledStatus.canceled.equals(true).not());

  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
      addExcludeScheduleAtExpiredWhere(
    SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> query,
  ) =>
          query
            ..where((scheduledStatus) => scheduledStatus.scheduledAt
                .isBiggerThanValue(DateTime.now().toUtc()));

  SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> orderBy(
    SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus> query,
    List<ScheduledStatusRepositoryOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderType) {
                    case ScheduledStatusRepositoryOrderType.remoteId:
                      expression = item.remoteId;
                      break;
                  }
                  return OrderingTerm(
                    expression: expression,
                    mode: orderTerm.orderingMode,
                  );
                })
            .toList());

  @override
  $DbScheduledStatusesTable get table => dbScheduledStatuses;
}

extension DbScheduledStatusTypedResultExtension on TypedResult {
  DbScheduledStatus toDbScheduledStatus({
    required ScheduledStatusDao dao,
  }) =>
      readTable(dao.db.dbScheduledStatuses);

  DbScheduledStatusPopulated toDbScheduledStatusPopulated({
    required ScheduledStatusDao dao,
  }) =>
      DbScheduledStatusPopulated(
        dbScheduledStatus: toDbScheduledStatus(
          dao: dao,
        ),
      );
}

extension DbScheduledStatusTypedResultListExtension on List<TypedResult> {
  List<DbScheduledStatus> toDbScheduledStatusList({
    required ScheduledStatusDao dao,
  }) =>
      map(
        (item) => item.toDbScheduledStatus(dao: dao),
      ).toList();

  List<DbScheduledStatusPopulated> toDbScheduledStatusPopulatedList({
    required ScheduledStatusDao dao,
  }) =>
      map(
        (item) => item.toDbScheduledStatusPopulated(dao: dao),
      ).toList();
}
