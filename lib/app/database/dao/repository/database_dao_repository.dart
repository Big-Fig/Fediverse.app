import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class DatabaseDaoRepository<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AsyncInitLoadingBloc
    implements IDbReadWriteRepository<DbItem, DbId, Filters, OrderingTerm> {
  DatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> get dao;

  Filters get emptyFilters;

  List<OrderingTerm> get defaultOrderingTerms;

  String get idFieldName => "id";

  @override
  Future internalAsyncInit() async {
    // nothing to init by default
    return null;
  }

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Future<DbItem?> findByDbIdInDbType(DbId dbId) =>
      dao.findById(dbId).getSingleOrNull();

  @override
  Future<List<DbItem>> getAllInDbType() => dao.getAll().get();

  @override
  Future<bool> updateByDbIdInDbType({
    required DbId dbId,
    required Insertable<DbItem> dbItem,
  }) {}

  @override
  Stream<List<DbItem>> watchAllInDbType() {}

  @override
  Future<bool> isExistWithDbId(DbId dbId) async {
    var found = await findByDbIdInDbType(dbId);
    return found != null;
  }

  @override
  Future insertAllInDbType(List<Insertable<DbItem>> dbItems) =>
      dao.insertAll(entities: dbItems, mode: null);

  @override
  Future<int> insertInDbType(Insertable<DbItem> dbItem) =>
      dao.insert(entity: dbItem, mode: null);

  @override
  Future upsertAllInDbType(List<Insertable<DbItem>> dbItems) =>
      dao.insertAll(entities: dbItems, mode: InsertMode.insertOrReplace);

  @override
  Future<int> upsertInDbType(Insertable<DbItem> dbItem) =>
      dao.insert(entity: dbItem, mode: InsertMode.insertOrReplace);

  @override
  Stream<DbItem?> watchByDbIdInDbType(DbId dbId) =>
      dao.findById(dbId).watchSingleOrNull();

  @override
  Future<int> deleteById(DbId id) => dao.deleteById(id);

  @override
  Future clear() => dao.clear();

  @override
  Future<List<DbItem>> findAllInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInDbTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).get();

  @override
  Future<DbItem?> findInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInDbTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).getSingleOrNull();

  @override
  Stream<List<DbItem>> watchFindAllInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInDbTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watch();

  @override
  Stream<DbItem?> watchInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInDbTypeQuerySelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watchSingleOrNull();

  Selectable<DbItem> createFindInDbTypeQuerySelectable({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) {
    var query = dao.startSelectQuery();

    addFiltersToQuery(query: query, filters: filters);
    addOrderingToQuery(query: query, orderingTerms: orderingTerms);

    return query;
  }

  void addDbItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<DbItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  });

  void addFiltersToQuery({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required Filters? filters,
  });

  void addOrderingToQuery({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required List<OrderingTerm>? orderingTerms,
  });

  CustomExpression<bool> createFindByDbIdWhereExpression(DbId dbId) =>
      createMainTableEqualWhereExpression(
        fieldName: idFieldName,
        value: dbId,
      );

  void addFindByDbIdWhereToJoinedSelectStatement({
    required JoinedSelectStatement joinedSelectStatement,
    required DbId dbId,
  }) {
    joinedSelectStatement.where(
      createFindByDbIdWhereExpression(dbId),
    );
  }

  void addFindByDbIdWhereToSimpleSelectStatement({
    required SimpleSelectStatement simpleSelectStatement,
    required DbId dbId,
  }) {
    simpleSelectStatement.where(
      (_) => createFindByDbIdWhereExpression(dbId),
    );
  }

  CustomExpression<bool> createMainTableEqualWhereExpression({
    required String fieldName,
    required dynamic value,
  }) =>
      createEqualWhereExpression(
        tableName: dao.table.$tableName,
        fieldName: fieldName,
        value: value,
      );

  static CustomExpression<bool> createEqualWhereExpression({
    required String tableName,
    required String fieldName,
    required dynamic value,
  }) =>
      CustomExpression<bool>("$tableName.$fieldName = ${value.toString()}");
}
