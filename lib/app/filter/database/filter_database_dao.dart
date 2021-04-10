import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/filter/database/filter_database_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
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
    $DbFiltersTable> with _$FilterDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  FilterDao(this.db) : super(db);

  // Future<int> updateByRemoteId(
  //   String remoteId,
  //   Insertable<DbFilter> entity,
  // ) async {
  //   var localId = await findLocalIdByRemoteId(remoteId).getSingle();
  //
  //   if (localId != null && localId >= 0) {
  //     await (update(db.dbFilters)..where((i) => i.id.equals(localId)))
  //         .write(entity);
  //   } else {
  //     localId = await insert(
  //       entity: entity,
  //       mode: null,
  //     );
  //   }
  //
  //   return localId;
  // }

  SimpleSelectStatement<$DbFiltersTable, DbFilter> addRemoteIdBoundsWhere(
    SimpleSelectStatement<$DbFiltersTable, DbFilter> query, {
    required String? minimumRemoteIdExcluding,
    required String? maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "db_filters.remote_id > '$minimumRemoteIdExcluding'",
      );
      query = query..where((filter) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "db_filters.remote_id < '$maximumRemoteIdExcluding'",
      );
      query = query..where((filter) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbFiltersTable, DbFilter> addContextTypesWhere(
    SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
    List<MastodonFilterContextType> contextTypes,
  ) {
    assert(contextTypes.isNotEmpty == true);

    List<String> contextTypesStrings = contextTypes
        .map(
          (visibility) => '${visibility.toJsonValue()}',
        )
        .toList();
    return query
      ..where(
        (filter) => CustomExpression<bool>(
          contextTypesStrings
              .map((type) => "db_filters.context LIKE '%$type%'")
              .join(" OR "),
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
