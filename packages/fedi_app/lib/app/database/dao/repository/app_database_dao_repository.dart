import 'package:fedi_app/app/database/dao/app_database_dao.dart';
import 'package:fedi_app/app/database/dao/repository/database_dao_repository.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends DatabaseDaoRepository<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm>
    implements
        IAppReadWriteRepository<DbItem, AppItem, DbId, Filters, OrderingTerm> {
  @override
  AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl, Filters, OrderingTerm>
      get dao;

  DbItem mapAppItemToDbItem(AppItem appItem);

  List<DbItem> mapAppItemListToDbItemList(List<AppItem> appItems) =>
      appItems.map(mapAppItemToDbItem).toList();

  DbItem? mapAppItemToDbItemNullable(AppItem? appItem) {
    if (appItem != null) {
      return mapAppItemToDbItem(appItem);
    } else {
      return null;
    }
  }

  @override
  Future<List<AppItem>> findAllInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeSelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).get();

  @override
  Future<AppItem?> findInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeSelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).getSingleOrNull();

  @override
  Stream<List<AppItem>> watchFindAllInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeSelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watch();

  @override
  Stream<AppItem?> watchFindInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeSelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watchSingleOrNull();

  void addAppItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<AppItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      addDbItemPagination(
        query: query,
        pagination: pagination != null
            ? RepositoryPagination<DbItem>(
                newerThanItem: mapAppItemToDbItemNullable(
                  pagination.newerThanItem,
                ),
                olderThanItem: mapAppItemToDbItemNullable(
                  pagination.olderThanItem,
                ),
                limit: pagination.limit,
                offset: pagination.offset,
              )
            : null,
        orderingTerms: orderingTerms,
      );

  @override
  Stream<List<DbItem>> watchAllInDbType() => dao.watchGetAll();

  @override
  Future<void> upsertInDbTypeBatch(
    Insertable<DbItem> dbItem, {
    required Batch? batchTransaction,
  }) =>
      insertInDbTypeBatch(
        dbItem,
        mode: InsertMode.insertOrReplace,
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
  Stream<DbItem?> watchFindInDbType({
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

    dao
      ..addFiltersToQuery(query: query, filters: filters)
      ..addOrderingToQuery(query: query, orderingTerms: orderingTerms);
    addDbItemPagination(
      query: query,
      pagination: pagination,
      orderingTerms: orderingTerms,
    );

    return query;
  }

  void addDbItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<DbItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  }) {
    dao.addNewerOlderDbItemPagination(
      query: query,
      pagination: pagination,
      orderingTerms: orderingTerms,
    );

    var limit = pagination?.limit;
    if (limit != null) {
      query.limit(limit, offset: pagination?.offset);
    }
  }

  Selectable<AppItem> createFindInAppTypeSelectable({
    RepositoryPagination<AppItem>? pagination,
    Filters? filters,
    List<OrderingTerm>? orderingTerms,
  });

  // todo: remove hack
  Selectable<AppItem> createQuery({
    RepositoryPagination<AppItem>? pagination,
    Filters? filters,
    OrderingTerm? orderingTermData,
  }) =>
      createFindInAppTypeSelectable(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTermData != null
            ? [
                orderingTermData,
              ]
            : null,
      );
}
