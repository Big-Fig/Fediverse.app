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
  String get remoteIdFieldName => "remote_id";

  @override
  AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl> get dao;

  @override
  Future<RemoteItem?> findByDbIdInRemoteType(DbId id) =>
      findByDbIdInAppType(id).then(mapAppItemToRemoteItemNullable);

  @override
  Future<DbItem?> findByRemoteIdInDbType(RemoteId remoteId) =>
      dao.findByRemoteId(remoteId).getSingleOrNull();

  @override
  Future<RemoteItem?> findByRemoteIdInRemoteType(RemoteId remoteId) =>
      findByRemoteIdInAppType(remoteId).then(mapAppItemToRemoteItemNullable);

  @override
  Future<List<RemoteItem>> getAllInRemoteType() =>
      getAllInAppType().then(mapAppItemListToRemoteItemList);

  @override
  Future<AppItem?> findByRemoteIdInAppType(RemoteId remoteId) {}

  @override
  Future<int> insertInRemoteType(RemoteItem remoteItem);

  @override
  Future insertAllInRemoteType(List<RemoteItem> remoteItems);

  @override
  Future<bool> updateAppTypeByRemoteType({
    required AppItem appItem,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future<bool> updateByIdInRemoteType({
    required DbId dbId,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future<bool> updateDbTypeByRemoteType({
    required DbItem dbItem,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future<bool> updateRemoteTypeByDbType({
    required DbItem dbItem,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future upsertAllInRemoteType(List<RemoteItem> remoteItems);

  @override
  Future<int> upsertInRemoteType(RemoteItem remoteItem);

  @override
  Stream<AppItem?> watchByRemoteIdInAppType(RemoteId remoteId) {
    var query = dao.startSelectQuery();

    addFindByRemoteIdWhereToSimpleSelectStatement(
        simpleSelectStatement: query, remoteId: remoteId);

    convertSimpleSelectStatementToJoinedSelectStatement()
  }

  @override
  Stream<List<RemoteItem>> watchAllInRemoteType() =>
      watchAllInAppType().map(mapAppItemListToRemoteItemList);

  @override
  Stream<RemoteItem?> watchByDbIdInRemoteType(DbId id) =>
      watchByDbIdInAppType(id).map(mapAppItemToRemoteItemNullable);

  @override
  Stream<DbItem?> watchByRemoteIdInDbType(RemoteId remoteId) =>
      dao.findByRemoteId(remoteId).watchSingleOrNull();

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

  @override
  Future<int> deleteByRemoteId(RemoteId remoteId) =>
      dao.deleteByRemoteId(remoteId);

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
  Stream<RemoteItem?> watchInRemoteType({
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
  }) {}

  CustomExpression<bool> createFindByRemoteIdWhereExpression(
          RemoteId remoteId) =>
      createMainTableEqualWhereExpression(
        fieldName: remoteIdFieldName,
        value: remoteId,
      );

  void addFindByRemoteIdWhereToJoinedSelectStatement({
    required JoinedSelectStatement joinedSelectStatement,
    required RemoteId remoteId,
  }) {
    joinedSelectStatement.where(
      createFindByRemoteIdWhereExpression(remoteId),
    );
  }

  void addFindByRemoteIdWhereToSimpleSelectStatement({
    required SimpleSelectStatement simpleSelectStatement,
    required RemoteId remoteId,
  }) {
    simpleSelectStatement.where(
      (_) => createFindByRemoteIdWhereExpression(remoteId),
    );
  }

  void addRemoteItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<RemoteItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  });
}
