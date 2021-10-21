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
    DraftStatusRepositoryOrderingTermData> with _$DraftStatusDaoMixin {
  final AppDatabase db;

// Called by the AppDatabase class
  DraftStatusDao(this.db) : super(db);

  void orderBy(
    SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    List<DraftStatusRepositoryOrderingTermData> orderTerms,
  ) =>
      query.orderBy(
        orderTerms
            .map(
              (orderTerm) => ($DbDraftStatusesTable item) {
                GeneratedColumn<Object?> expression;
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
              },
            )
            .toList(),
      );

  List<DbDraftStatus> typedResultListToPopulated(
    List<TypedResult> typedResult,
  ) =>
      typedResult.map(typedResultToPopulated).toList();

  DbDraftStatus typedResultToPopulated(TypedResult typedResult) =>
      typedResult.readTable(db.dbDraftStatuses);

  void addUpdatedAtBoundsWhere(
    SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query, {
    required DateTime? minimumUpdatedAt,
    required DateTime? maximumUpdatedAt,
  }) {
    var minimumExist = minimumUpdatedAt != null;
    var maximumExist = maximumUpdatedAt != null;
    assert(
      minimumExist || maximumExist,
      'at least one bound should exist',
    );

    if (minimumExist) {
      query.where(
        (notification) => notification.updatedAt.isBiggerThanValue(
          minimumUpdatedAt,
        ),
      );
    }
    if (maximumExist) {
      query.where(
        (notification) =>
            notification.updatedAt.isSmallerThanValue(maximumUpdatedAt),
      );
    }
  }

  @override
  $DbDraftStatusesTable get table => dbDraftStatuses;

  @override
  // ignore: no-empty-block
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required DraftStatusRepositoryFilters? filters,
    // ignore: no-empty-block
  }) {
    // nothing
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required RepositoryPagination<DbDraftStatus>? pagination,
    required List<DraftStatusRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(
        orderingTerms?.length == 1,
        'only single order term is supported',
      );
      var orderingTermData = orderingTerms!.first;
      assert(
        orderingTermData.orderType == DraftStatusRepositoryOrderType.updatedAt,
        'only updatedAt term supported',
      );
      addUpdatedAtBoundsWhere(
        query,
        maximumUpdatedAt: pagination?.olderThanItem?.updatedAt,
        minimumUpdatedAt: pagination?.newerThanItem?.updatedAt,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required List<DraftStatusRepositoryOrderingTermData>? orderingTerms,
  }) {
    orderBy(
      query,
      orderingTerms ?? [],
    );
  }

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbDraftStatusesTable, DbDraftStatus> query,
    required DraftStatusRepositoryFilters? filters,
  }) =>
      query.join([]);

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
