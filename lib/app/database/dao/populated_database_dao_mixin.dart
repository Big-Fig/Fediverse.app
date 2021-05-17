import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';
import 'package:moor/moor.dart' as moor;

mixin PopulatedDatabaseDaoMixin<
        DbItem extends DataClass,
        DbPopulatedItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    on AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm> {
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required Filters? filters,
  });

  DbPopulatedItem mapTypedResultToDbPopulatedItem(TypedResult typedResult);

  List<DbPopulatedItem> mapTypedResultListToDbPopulatedItemList(
    List<TypedResult> typedResults,
  ) =>
      typedResults.map(mapTypedResultToDbPopulatedItem).toList();

  Future<List<DbPopulatedItem>> getAllPopulated() =>
      getAllPopulatedSelectable().get();

  Stream<List<DbPopulatedItem>> watchGetAllPopulated() =>
      getAllPopulatedSelectable().watch();

  Selectable<DbPopulatedItem> getAllPopulatedSelectable() {
    var query = startSelectQuery();
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }

  Future<DbPopulatedItem?> getNewestPopulatedOrderById({
    required int? offset,
  }) =>
      getNewestPopulatedOrderByIdSelectable(offset: offset).getSingleOrNull();

  Stream<DbPopulatedItem?> watchGetNewestPopulatedOrderById({
    required int? offset,
  }) =>
      getNewestPopulatedOrderByIdSelectable(offset: offset).watchSingleOrNull();

  Selectable<DbPopulatedItem> getNewestPopulatedOrderByIdSelectable({
    required int? offset,
  }) {
    var query = startSelectQuery();
    query.orderBy(
      [
        (tbl) => moor.OrderingTerm.desc(
              CustomExpression('$tableName.$idFieldName'),
            ),
      ],
    );
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    joinedQuery.limit(1, offset: offset);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }

  Future<DbPopulatedItem?> getOldestPopulatedOrderById({
    required int? offset,
  }) =>
      getOldestPopulatedOrderByIdSelectable(
        offset: offset,
      ).getSingleOrNull();

  Stream<DbPopulatedItem?> watchGetOldestPopulatedOrderById({
    required int? offset,
  }) =>
      getOldestPopulatedOrderByIdSelectable(offset: offset).watchSingleOrNull();

  Selectable<DbPopulatedItem> getOldestPopulatedOrderByIdSelectable({
    required int? offset,
  }) {
    var query = startSelectQuery();
    query.orderBy(
      [
        (tbl) => moor.OrderingTerm.asc(
              CustomExpression('$tableName.$idFieldName'),
            ),
      ],
    );
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    joinedQuery.limit(1, offset: offset);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }

  Future<DbPopulatedItem?> getNewestPopulatedOrderByRemoteId({
    required int? offset,
  }) =>
      getNewestPopulatedOrderByRemoteIdSelectable(offset: offset)
          .getSingleOrNull();

  Stream<DbPopulatedItem?> watchGetNewestPopulatedOrderByRemoteId({
    required int? offset,
  }) =>
      getNewestPopulatedOrderByRemoteIdSelectable(offset: offset)
          .watchSingleOrNull();

  Selectable<DbPopulatedItem> getNewestPopulatedOrderByRemoteIdSelectable({
    required int? offset,
  }) {
    var query = startSelectQuery();
    query.orderBy(
      [
        (tbl) => moor.OrderingTerm.desc(
              CustomExpression('$tableName.$idFieldName'),
            ),
      ],
    );
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    joinedQuery.limit(1, offset: offset);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }

  Future<DbPopulatedItem?> getOldestPopulatedOrderByRemoteId({
    required int? offset,
  }) =>
      getOldestPopulatedOrderByRemoteIdSelectable(
        offset: offset,
      ).getSingleOrNull();

  Stream<DbPopulatedItem?> watchGetOldestPopulatedOrderByRemoteId({
    required int? offset,
  }) =>
      getOldestPopulatedOrderByRemoteIdSelectable(offset: offset)
          .watchSingleOrNull();

  Selectable<DbPopulatedItem> getOldestPopulatedOrderByRemoteIdSelectable({
    required int? offset,
  }) {
    var query = startSelectQuery();
    query.orderBy(
      [
        (tbl) => moor.OrderingTerm.asc(
              CustomExpression('$tableName.$idFieldName'),
            ),
      ],
    );
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    joinedQuery.limit(1, offset: offset);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }

  Future<DbPopulatedItem?> findByIdPopulated(DbId id) =>
      findByIdPopulatedSelectable(id).getSingleOrNull();

  Stream<DbPopulatedItem?> watchFindByIdPopulated(DbId id) =>
      findByIdPopulatedSelectable(id).watchSingleOrNull();

  Selectable<DbPopulatedItem> findByIdPopulatedSelectable(DbId id) {
    var query = startSelectQuery();
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    joinedQuery.where(createFindByDbIdWhereExpression(id));
    joinedQuery.limit(1, offset: null);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }
}
