import 'package:fedi/app/database/dao/repository/remote/app_remote_database_dao_repository.dart';
import 'package:fedi/app/database/dao/repository/simple_app_database_dao_repository_mixin.dart';
import 'package:moor/moor.dart';

abstract class SimpleAppRemoteDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppRemoteDatabaseDaoRepository<DbItem, AppItem, RemoteItem, DbId,
        RemoteId, TableDsl, TableInfoDsl>
    with
        SimpleDatabaseDaoRepositoryMixin<DbItem, AppItem, DbId, TableDsl,
            TableInfoDsl> {
  DbItem mapRemoteItemToDbItem(RemoteItem remoteItem);

  RemoteItem mapDbItemToRemoteItem(DbItem dbItem);
}
