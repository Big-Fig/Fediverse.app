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

  @override
  Future internalAsyncInit() async {
    // nothing to init by default
    return null;
  }

  @override
  Future<int> countAll() => dao.countAllSelectable().getSingle();

  @override
  Future<DbItem?> findByDbIdInDbType(DbId dbId) =>
      dao.findByIdSelectable(dbId).getSingleOrNull();

  @override
  Future<List<DbItem>> getAllInDbType() => dao.getAllSelectable().get();

  @override
  Future<bool> isExistWithDbId(DbId dbId) async {
    var found = await findByDbIdInDbType(dbId);
    return found != null;
  }

  @override
  Future insertAllInDbType(
    List<Insertable<DbItem>> dbItems, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertAll(
        entities: dbItems,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future insertInDbType(
    Insertable<DbItem> dbItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertBatch(
        entity: dbItem,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertAllInDbType(
    List<Insertable<DbItem>> dbItems, {
    required Batch? batchTransaction,
  }) =>
      dao.upsertAll(
        entities: dbItems,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertInDbType(
    Insertable<DbItem> dbItem, {
    required Batch? batchTransaction,
  }) =>
      dao.upsertBatch(
        entity: dbItem,
        batchTransaction: batchTransaction,
      );

  @override
  Stream<DbItem?> watchByDbIdInDbType(DbId dbId) =>
      dao.findByIdSelectable(dbId).watchSingleOrNull();

  @override
  Future deleteById(
    DbId id, {
    required Batch? batchTransaction,
  }) =>
      dao.deleteByIdBatch(
        id,
        batchTransaction: batchTransaction,
      );

  @override
  Future clear({
    required Batch? batchTransaction,
  }) =>
      dao.clear(
        batchTransaction: batchTransaction,
      );

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
  }) {
    addNewerOlderDbItemPagination(
      query: query,
      pagination: pagination,
      orderingTerms: orderingTerms,
    );

    var limit = pagination?.limit;
    if (limit != null) {
      query.limit(limit, offset: pagination?.offset);
    }
  }

  void addNewerOlderDbItemPagination({
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

}
