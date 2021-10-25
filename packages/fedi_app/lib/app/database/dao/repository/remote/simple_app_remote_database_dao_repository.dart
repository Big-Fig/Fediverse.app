import 'package:fedi_app/app/database/dao/repository/remote/app_remote_database_dao_repository.dart';
import 'package:fedi_app/app/database/dao/repository/simple_app_database_dao_repository_mixin.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class SimpleAppRemoteDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppRemoteDatabaseDaoRepository<DbItem, AppItem, RemoteItem, DbId,
        RemoteId, TableDsl, TableInfoDsl, Filters, OrderingTerm>
    with
        SimpleDatabaseDaoRepositoryMixin<DbItem, AppItem, DbId, TableDsl,
            TableInfoDsl, Filters, OrderingTerm> {
  RemoteItem mapDbItemToRemoteItem(DbItem dbItem);

  @override
  Stream<AppItem?> watchByRemoteIdInAppType(RemoteId remoteId);
}
