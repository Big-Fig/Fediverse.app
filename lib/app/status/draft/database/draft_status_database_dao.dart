import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/local/populated_app_local_database_dao.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_model.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
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
    DraftStatusRepositoryFilters> with _$DraftStatusDaoMixin {
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
}
