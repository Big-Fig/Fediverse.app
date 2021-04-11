import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/status/scheduled/database/scheduled_status_database_model.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'scheduled_status_database_dao.g.dart';

@UseDao(
  tables: [
    DbScheduledStatuses,
  ],
)
class ScheduledStatusDao extends PopulatedAppRemoteDatabaseDao<
    DbScheduledStatus,
    DbScheduledStatusPopulated,
    int,
    String,
    $DbScheduledStatusesTable,
    $DbScheduledStatusesTable,
    ScheduledStatusRepositoryFilters,
    ScheduledStatusRepositoryOrderingTermData> with _$ScheduledStatusDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ScheduledStatusDao(this.db) : super(db);

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

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
        query,
    required ScheduledStatusRepositoryFilters? filters,
  }) {
    if (filters?.excludeCanceled == true) {
      query = addExcludeCanceledWhere(query);
    }

    if (filters?.excludeScheduleAtExpired == true) {
      query = addExcludeScheduleAtExpiredWhere(query);
    }
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
        query,
    required RepositoryPagination<DbScheduledStatus>? pagination,
    required List<ScheduledStatusRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(orderingTermData.orderType ==
          ScheduledStatusRepositoryOrderType.remoteId);
      query = addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
        query,
    required List<ScheduledStatusRepositoryOrderingTermData>? orderingTerms,
  }) {
    query = orderBy(
      query,
      orderingTerms ?? [],
    );
  }

  List<Join<Table, DataClass>> populateJoin() {
    return [];
  }

  @override
  JoinedSelectStatement<Table, DataClass>
      convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbScheduledStatusesTable, DbScheduledStatus>
        query,
    required ScheduledStatusRepositoryFilters? filters,
  }) =>
          query.join(populateJoin());

  @override
  DbScheduledStatusPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbScheduledStatusPopulated(dao: this);
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
