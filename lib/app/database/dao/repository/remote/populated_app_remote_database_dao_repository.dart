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
      TableDsl, TableInfoDsl> get dao;

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
}
