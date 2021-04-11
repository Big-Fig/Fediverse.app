import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/local/populated_app_local_database_dao.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_model.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'draft_status_database_dao.g.dart';

@UseDao(
  tables: [
    DbDraftStatuses,
  ],
)
class DraftStatusDao extends PopulatedAppLocalDatabaseDao<
    DbDraftStatus,
    DbDraftStatusPopulated,
    int,
    $DbDraftStatusesTable,
    $DbDraftStatusesTable,
    DraftStatusRepositoryFilters,
    DraftStatusOrderingTermData> with _$DraftStatusDaoMixin {
  final AppDatabase db;

// Called by the AppDatabase class
  DraftStatusDao(this.db) : super(db);

  SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> orderBy(
    SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    List<DraftStatusOrderingTermData> orderTerms,
  ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
                  var expression;
                  switch (orderTerm.orderType) {
                    case DraftStatusRepositoryOrderType.updatedAt:
                      expression = item.updatedAt;
                      break;
                    case DraftStatusRepositoryOrderType.localId:
                      expression = item.id;
                      break;
                  }
                  return OrderingTerm(
                    expression: expression,
                    mode: orderTerm.orderingMode,
                  );
                })
            .toList());

  List<DbDraftStatus> typedResultListToPopulated(
    List<TypedResult> typedResult,
  ) {
    return typedResult.map(typedResultToPopulated).toList();
  }

  DbDraftStatus typedResultToPopulated(TypedResult typedResult) {
    return typedResult.readTable(db.dbDraftStatuses);
  }

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus>
      addUpdatedAtBoundsWhere(
    SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query, {
    required DateTime? minimumUpdatedAtExcluding,
    required DateTime? maximumUpdatedAtExcluding,
  }) {
    // todo: use parent common method
    var minimumExist = minimumUpdatedAtExcluding != null;
    var maximumExist = maximumUpdatedAtExcluding != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "db_draft_statuses.updated_at > '$minimumUpdatedAtExcluding'",
      );
      query = query..where((draftStatus) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "db_draft_statuses.updated_at < '$maximumUpdatedAtExcluding'",
      );
      query = query..where((draftStatus) => smallerExp);
    }

    return query;
  }

  @override
  $DbDraftStatusesTable get table => dbDraftStatuses;

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required DraftStatusRepositoryFilters? filters,
  }) {
    // nothing
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required RepositoryPagination<DbDraftStatus>? pagination,
    required List<DraftStatusOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(
        orderingTermData.orderType == DraftStatusRepositoryOrderType.updatedAt,
      );
      query = addUpdatedAtBoundsWhere(
        query,
        maximumUpdatedAtExcluding: pagination?.olderThanItem?.updatedAt,
        minimumUpdatedAtExcluding: pagination?.newerThanItem?.updatedAt,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required List<DraftStatusOrderingTermData>? orderingTerms,
  }) {
    orderBy(
      query,
      orderingTerms ?? [],
    );
  }

  @override
  JoinedSelectStatement<Table, DataClass>
      convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required DraftStatusRepositoryFilters? filters,
  }) {
    // nothing
    return query.join([]);
  }

  @override
  DbDraftStatusPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbDraftStatusPopulated(dao: this);
}

extension DbDraftStatusTypedResultExtension on TypedResult {
  DbDraftStatus toDbDraftStatus({
    required DraftStatusDao dao,
  }) =>
      readTable(dao.db.dbDraftStatuses);

  DbDraftStatusPopulated toDbDraftStatusPopulated({
    required DraftStatusDao dao,
  }) =>
      DbDraftStatusPopulated(
        dbDraftStatus: toDbDraftStatus(
          dao: dao,
        ),
      );
}

extension DbDraftStatusTypedResultListExtension on List<TypedResult> {
  List<DbDraftStatus> toDbDraftStatusList({
    required DraftStatusDao dao,
  }) =>
      map(
        (item) => item.toDbDraftStatus(dao: dao),
      ).toList();

  List<DbDraftStatusPopulated> toDbDraftStatusPopulatedList({
    required DraftStatusDao dao,
  }) =>
      map(
        (item) => item.toDbDraftStatusPopulated(dao: dao),
      ).toList();
}
