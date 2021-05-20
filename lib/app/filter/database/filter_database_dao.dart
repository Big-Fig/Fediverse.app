import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/filter/database/filter_database_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'filter_database_dao.g.dart';

@UseDao(
  tables: [
    DbFilters,
  ],
)
class FilterDao extends PopulatedAppRemoteDatabaseDao<
    DbFilter,
    DbFilterPopulated,
    int,
    String,
    $DbFiltersTable,
    $DbFiltersTable,
    FilterRepositoryFilters,
    FilterOrderingTermData> with _$FilterDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  FilterDao(this.db) : super(db);

  SimpleSelectStatement<$DbFiltersTable, DbFilter> addContextTypesWhere(
      SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
      List<MastodonApiFilterContextType> contextTypes,
      ) {
    assert(contextTypes.isNotEmpty);

    var contextTypesStrings = contextTypes
        .map(
          (visibility) => '${visibility.toJsonValue()}',
    )
        .toList();

    return query
      ..where(
            (filter) => CustomExpression<bool>(
          contextTypesStrings
              .map((type) => "db_filters.context LIKE '%$type%'")
              .join(' OR '),
        ),
      );
  }

  SimpleSelectStatement<$DbFiltersTable, DbFilter> addNotExpiredWhere(
      SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
      ) =>
      query
        ..where(
              (filter) =>
          filter.expiresAt.isNull() |
          filter.expiresAt.isBiggerThanValue(
            DateTime.now(),
          ),
        );

  SimpleSelectStatement<$DbFiltersTable, DbFilter> orderBy(
      SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
      List<FilterOrderingTermData> orderTerms,
      ) =>
      query
        ..orderBy(orderTerms
            .map((orderTerm) => (item) {
          var expression;
          switch (orderTerm.orderType) {
            case FilterOrderType.remoteId:
              expression = item.remoteId;
              break;
          }

          return OrderingTerm(
            expression: expression,
            mode: orderTerm.orderingMode,
          );
        })
            .toList());

  List<Join<Table, DataClass>> populateFilterJoin() {
    return [];
  }

  @override
  $DbFiltersTable get table => dbFilters;

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
    required FilterRepositoryFilters? filters,
  }) {
    if (filters?.onlyWithContextTypes?.isNotEmpty == true) {
      addContextTypesWhere(
        query,
        filters!.onlyWithContextTypes!,
      );
    }

    if (filters?.notExpired == true) {
      addNotExpiredWhere(query);
    }
  }

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
    required RepositoryPagination<DbFilter>? pagination,
    required List<FilterOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(
      orderingTermData.orderType == FilterOrderType.remoteId,
      );
      addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
    required List<FilterOrderingTermData>? orderingTerms,
  }) {
    if (orderingTerms != null) {
      orderBy(
        query,
        orderingTerms,
      );
    }
  }

  @override
  JoinedSelectStatement<Table, DataClass>
  convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
    required FilterRepositoryFilters? filters,
  }) =>
      query.join(populateFilterJoin());

  @override
  DbFilterPopulated mapTypedResultToDbPopulatedItem(TypedResult typedResult) =>
      typedResult.toDbFilterPopulated(dao: this);
}

extension DbFilterPopulatedTypedResultListExtension on List<TypedResult> {
  List<DbFilterPopulated> toDbFilterPopulatedList({
    required FilterDao dao,
  }) {
    return map(
          (item) => item.toDbFilterPopulated(dao: dao),
    ).toList();
  }
}

extension DbFilterPopulatedTypedResultExtension on TypedResult {
  DbFilterPopulated toDbFilterPopulated({
    required FilterDao dao,
  }) {
    return DbFilterPopulated(
      dbFilter: readTable(dao.db.dbFilters),
    );
  }
}
