import 'package:fedi/app/database/dao/remote/app_remote_database_dao.dart';
import 'package:fedi/app/database/dao/repository/app_database_dao_repository.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppRemoteDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppDatabaseDaoRepository<DbItem, AppItem, DbId, TableDsl,
        TableInfoDsl, Filters, OrderingTerm>
    implements
        IAppRemoteReadWriteRepository<DbItem, AppItem, RemoteItem, DbId,
            RemoteId, Filters, OrderingTerm> {
  @override
  AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl, Filters,
      OrderingTerm> get dao;

  @override
  Future insertAllInRemoteType(
    List<RemoteItem> remoteItems, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      for (var remoteItem in remoteItems) {
        // ignore: unawaited_futures
        insertInRemoteTypeBatch(
          remoteItem,
          mode: mode,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      await batch((batch) {
        insertAllInRemoteType(
          remoteItems,
          mode: mode,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future upsertAllInRemoteType(
    List<RemoteItem> remoteItems, {
    required Batch? batchTransaction,
  }) =>
      insertAllInRemoteType(
        remoteItems,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );

  @override
  Future<void> upsertInRemoteTypeBatch(
    RemoteItem remoteItem, {
    required Batch? batchTransaction,
  }) =>
      insertInRemoteTypeBatch(
        remoteItem,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );

  @override
  Future<RemoteItem?> findByDbIdInRemoteType(DbId id) =>
      findByDbIdInAppType(id).then(mapAppItemToRemoteItemNullable);

  @override
  Future<DbItem?> findByRemoteIdInDbType(RemoteId remoteId) =>
      dao.findByRemoteIdSelectable(remoteId).getSingleOrNull();

  @override
  Future<RemoteItem?> findByRemoteIdInRemoteType(RemoteId remoteId) =>
      findByRemoteIdInAppType(remoteId).then(mapAppItemToRemoteItemNullable);

  @override
  Future<List<RemoteItem>> getAllInRemoteType() =>
      getAllInAppType().then(mapAppItemListToRemoteItemList);

  @override
  Stream<List<RemoteItem>> watchAllInRemoteType() =>
      watchAllInAppType().map(mapAppItemListToRemoteItemList);

  @override
  Stream<RemoteItem?> watchByDbIdInRemoteType(DbId id) =>
      watchByDbIdInAppType(id).map(mapAppItemToRemoteItemNullable);

  @override
  Stream<DbItem?> watchByRemoteIdInDbType(RemoteId remoteId) =>
      dao.findByRemoteIdSelectable(remoteId).watchSingleOrNull();

  @override
  Stream<RemoteItem?> watchByRemoteIdInRemoteType(RemoteId remoteId) =>
      watchByRemoteIdInAppType(remoteId).map(mapAppItemToRemoteItemNullable);

  RemoteItem mapAppItemToRemoteItem(AppItem appItem);

  List<RemoteItem> mapAppItemListToRemoteItemList(List<AppItem> appItems) =>
      appItems.map(mapAppItemToRemoteItem).toList();

  RemoteItem? mapAppItemToRemoteItemNullable(AppItem? appItem) {
    if (appItem != null) {
      return mapAppItemToRemoteItem(appItem);
    } else {
      return null;
    }
  }

  AppItem mapRemoteItemToAppItem(RemoteItem remoteItem);

  List<AppItem> mapRemoteItemListToAppItemList(List<RemoteItem> remoteItems) =>
      remoteItems.map(mapRemoteItemToAppItem).toList();

  AppItem? mapRemoteItemToAppItemNullable(RemoteItem? remoteItem) {
    if (remoteItem != null) {
      return mapRemoteItemToAppItem(remoteItem);
    } else {
      return null;
    }
  }

  DbItem mapRemoteItemToDbItem(RemoteItem remoteItem) => mapAppItemToDbItem(
        mapRemoteItemToAppItem(remoteItem),
      );

  List<DbItem> mapRemoteItemListToDbItemList(List<RemoteItem> remoteItems) =>
      remoteItems.map(mapRemoteItemToDbItem).toList();

  DbItem? mapRemoteItemToDbItemNullable(RemoteItem? remoteItem) {
    if (remoteItem != null) {
      return mapRemoteItemToDbItem(remoteItem);
    } else {
      return null;
    }
  }

  @override
  Future deleteByRemoteId(
    RemoteId remoteId, {
    required Batch? batchTransaction,
  }) =>
      dao.deleteByRemoteIdBatch(
        remoteId,
        batchTransaction: batchTransaction,
      );

  @override
  Future<List<RemoteItem>> findAllInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInRemoteTypeQuery(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).get();

  @override
  Future<RemoteItem?> findInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInRemoteTypeQuery(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).getSingleOrNull();

  @override
  Stream<List<RemoteItem>> watchFindAllInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInRemoteTypeQuery(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watch();

  @override
  Stream<RemoteItem?> watchFindInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInRemoteTypeQuery(
        pagination: pagination,
        filters: filters,
        orderingTerms: orderingTerms,
      ).watchSingleOrNull();

  Selectable<RemoteItem> createFindInRemoteTypeQuery({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      createFindInAppTypeSelectable(
        pagination: pagination != null
            ? RepositoryPagination(
                newerThanItem:
                    mapRemoteItemToAppItemNullable(pagination.newerThanItem),
                olderThanItem:
                    mapRemoteItemToAppItemNullable(pagination.olderThanItem),
                limit: pagination.limit,
                offset: pagination.offset,
              )
            : null,
        filters: filters,
        orderingTerms: orderingTerms,
      ).map(mapAppItemToRemoteItem);

  void addRemoteItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<RemoteItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  }) =>
      addDbItemPagination(
        query: query,
        pagination: pagination != null
            ? RepositoryPagination<DbItem>(
                newerThanItem: mapRemoteItemToDbItemNullable(
                  pagination.newerThanItem,
                ),
                olderThanItem: mapRemoteItemToDbItemNullable(
                  pagination.olderThanItem,
                ),
                limit: pagination.limit,
                offset: pagination.offset,
              )
            : null,
        orderingTerms: orderingTerms,
      );

  @override
  Future<int> upsertInRemoteType(RemoteItem remoteItem) => insertInRemoteType(
        remoteItem,
        mode: InsertMode.insertOrReplace,
      );
}
