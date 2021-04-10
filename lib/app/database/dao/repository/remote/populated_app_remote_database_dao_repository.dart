import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/database/dao/repository/populated_app_database_dao_repository_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/app_remote_database_dao_repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class PopulatedAppRemoteDatabaseDaoRepository<
        DbItem extends DataClass,
        DbPopulatedItem,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        Ordering extends RepositoryOrderingTerm>
    extends AppRemoteDatabaseDaoRepository<DbItem, AppItem, RemoteItem, DbId,
        RemoteId, TableDsl, TableInfoDsl, Filters, Ordering>
    with
        PopulatedDatabaseDaoRepositoryMixin<DbItem, DbPopulatedItem, AppItem,
            DbId, TableDsl, TableInfoDsl, Filters, Ordering> {
  @override
  PopulatedAppRemoteDatabaseDao<DbItem, DbPopulatedItem, DbId, RemoteId,
      TableDsl, TableInfoDsl, Filters> get dao;

  RemoteItem mapDbPopulatedItemToRemoteItem(DbPopulatedItem dbPopulatedItem);

  List<RemoteItem> mapDbPopulatedItemListToRemoteItemList(
          List<DbPopulatedItem> dbPopulatedItems) =>
      dbPopulatedItems.map(mapDbPopulatedItemToRemoteItem).toList();

  RemoteItem? mapDbPopulatedItemToRemoteItemNullable(
      DbPopulatedItem? dbPopulatedItem) {
    if (dbPopulatedItem != null) {
      return mapDbPopulatedItemToRemoteItem(dbPopulatedItem);
    } else {
      return null;
    }
  }

  @override
  Stream<AppItem?> watchByDbIdInAppType(DbId dbId) =>
      dao.watchFindByIdPopulated(dbId).map(mapDbPopulatedItemToAppItemNullable);

  @override
  Stream<AppItem?> watchByRemoteIdInAppType(RemoteId remoteId) => dao
      .watchFindByRemoteIdPopulated(remoteId)
      .map(mapDbPopulatedItemToAppItemNullable);

  @override
  Stream<List<AppItem>> watchAllInAppType() =>
      dao.watchGetAllPopulated().map(mapDbPopulatedItemListToAppItemList);

  @override
  Future<AppItem?> findByDbIdInAppType(DbId dbId) =>
      dao.findByIdPopulated(dbId).then(mapDbPopulatedItemToAppItemNullable);

  @override
  Future<AppItem?> findByRemoteIdInAppType(RemoteId remoteId) => dao
      .findByRemoteIdPopulated(remoteId)
      .then(mapDbPopulatedItemToAppItemNullable);

  @override
  Future<List<AppItem>> getAllInAppType() =>
      dao.getAllPopulated().then(mapDbPopulatedItemListToAppItemList);
}
