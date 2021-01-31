import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/database/draft_status_database_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:moor/moor.dart';

part 'draft_status_database_dao.g.dart';

@UseDao(tables: [
  DbDraftStatuses
], queries: {
  "countAll": "SELECT Count(*) FROM db_draft_statuses;",
  "findById": "SELECT * FROM db_draft_statuses WHERE id = :id;",
  "countById": "SELECT COUNT(*) FROM db_draft_statuses WHERE id = :id;",
  "deleteById": "DELETE FROM db_draft_statuses WHERE id = :id;",
  "clear": "DELETE FROM db_draft_statuses",
  "getAll": "SELECT * FROM db_draft_statuses",
})
class DraftStatusDao extends DatabaseAccessor<AppDatabase>
    with _$DraftStatusDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  DraftStatusDao(this.db) : super(db);

  Future<int> insert(Insertable<DbDraftStatus> entity) =>
      into(dbDraftStatuses).insert(entity);

  Future<int> upsert(Insertable<DbDraftStatus> entity) =>
      into(dbDraftStatuses).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(Iterable<Insertable<DbDraftStatus>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbDraftStatuses, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbDraftStatus> entity) async =>
      await update(dbDraftStatuses).replace(entity);

  SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus>
      startSelectQuery() => (select(db.dbDraftStatuses));

  SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> orderBy(
          SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
          List<DraftStatusOrderingTermData> orderTerms) =>
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
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());

  List<DbDraftStatus> typedResultListToPopulated(
      List<TypedResult> typedResult) {
    if (typedResult == null) {
      return null;
    }
    return typedResult.map(typedResultToPopulated).toList();
  }

  DbDraftStatus typedResultToPopulated(TypedResult typedResult) {
    if (typedResult == null) {
      return null;
    }

    return typedResult.readTable(db.dbDraftStatuses);
  }

  /// remote ids are strings but it is possible to compare them in
  /// chronological order
  SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus>
      addUpdatedAtBoundsWhere(
    SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query, {
    @required DateTime minimumUpdatedAtExcluding,
    @required DateTime maximumUpdatedAtExcluding,
  }) {
    var minimumExist = minimumUpdatedAtExcluding != null;
    var maximumExist = maximumUpdatedAtExcluding != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
          "db_draft_statuses.updated_at > '$minimumUpdatedAtExcluding'");
      query = query..where((draftStatus) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
          "db_draft_statuses.updated_at < '$maximumUpdatedAtExcluding'");
      query = query..where((draftStatus) => smallerExp);
    }

    return query;
  }
}
