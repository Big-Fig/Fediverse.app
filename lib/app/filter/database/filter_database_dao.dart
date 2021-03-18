import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/database/filter_database_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:moor/moor.dart';

part 'filter_database_dao.g.dart';

@UseDao(tables: [
  DbFilters
], queries: {
  "countAll": "SELECT Count(*) FROM db_filters;",
  "deleteById": "DELETE FROM db_filters WHERE id = :id;",
  "countById": "SELECT COUNT(*) FROM db_filters WHERE id = :id;",
  "clear": "DELETE FROM db_filters",
  "getAll": "SELECT * FROM db_filters",
  "findLocalIdByRemoteId": "SELECT id FROM db_filters WHERE remote_id = "
      ":remoteId;",
})
class FilterDao extends DatabaseAccessor<AppDatabase> with _$FilterDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  FilterDao(this.db) : super(db);

  Future<List<DbFilterPopulated>> findAll() async {
    JoinedSelectStatement<Table, DataClass> filterQuery = _findAll();

    return typedResultListToPopulated(await filterQuery.get());
  }

  Stream<List<DbFilterPopulated>> watchAll() {
    JoinedSelectStatement<Table, DataClass> filterQuery = _findAll();

    return filterQuery.watch().map(typedResultListToPopulated);
  }

  Future<DbFilterPopulated> findById(int id) async =>
      typedResultToPopulated(await _findById(id).getSingle());

  Future<DbFilterPopulated> findByRemoteId(String? remoteId) async =>
      typedResultToPopulated(await _findByRemoteId(remoteId).getSingle());

  Stream<DbFilterPopulated> watchById(int id) =>
      (_findById(id).watchSingle().map(typedResultToPopulated));

  Stream<DbFilterPopulated> watchByRemoteId(String? remoteId) =>
      (_findByRemoteId(remoteId).watchSingle().map(typedResultToPopulated));

  JoinedSelectStatement<Table, DataClass> _findAll() {
    var sqlQuery = (select(db.dbFilters).join(
      populateFilterJoin(),
    ));
    return sqlQuery;
  }

  JoinedSelectStatement<Table, DataClass> _findById(int id) =>
      (select(db.dbFilters)..where((filter) => filter.id.equals(id)))
          .join(populateFilterJoin());

  JoinedSelectStatement<Table, DataClass> _findByRemoteId(String? remoteId) =>
      (select(db.dbFilters)..where((filter) => filter.remoteId.like(remoteId!)))
          .join(populateFilterJoin());

  Future<int> insert(Insertable<DbFilter> entity, {InsertMode? mode}) async =>
      into(db.dbFilters).insert(entity, mode: mode);

  Future<int> upsert(Insertable<DbFilter> entity) async =>
      into(db.dbFilters).insert(entity, mode: InsertMode.insertOrReplace);

  Future insertAll(
          Iterable<Insertable<DbFilter>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(db.dbFilters, entities as List<Insertable<DbFilter>>,
            mode: mode);
      });

  Future<bool> replace(Insertable<DbFilter> entity) async =>
      await update(db.dbFilters).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbFilter> entity) async {
    var localId = await findLocalIdByRemoteId(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(db.dbFilters)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

  SimpleSelectStatement<$DbFiltersTable, DbFilter> startSelectQuery() =>
      (select(db.dbFilters));

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
          "db_filters.remote_id > '$minimumRemoteIdExcluding'");
      query = query..where((filter) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
          "db_filters.remote_id < '$maximumRemoteIdExcluding'");
      query = query..where((filter) => smallerExp);
    }

    return query;
  }

  SimpleSelectStatement<$DbFiltersTable, DbFilter> addContextTypesWhere(
      SimpleSelectStatement<$DbFiltersTable, DbFilter> query,
      List<MastodonFilterContextType> contextTypes) {
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
          SimpleSelectStatement<$DbFiltersTable, DbFilter> query) =>
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
          List<FilterOrderingTermData> orderTerms) =>
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
                      expression: expression, mode: orderTerm.orderingMode);
                })
            .toList());

  List<DbFilterPopulated> typedResultListToPopulated(
      List<TypedResult> typedResult) {
    return typedResult.map(typedResultToPopulated).toList();
  }

  DbFilterPopulated typedResultToPopulated(TypedResult typedResult) {
    return DbFilterPopulated(
      dbFilter: typedResult.readTable(db.dbFilters),
    );
  }

  List<Join<Table, DataClass>> populateFilterJoin() {
    return [];
  }
}
