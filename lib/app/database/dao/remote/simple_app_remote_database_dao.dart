import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/simple_database_dao_mixin.dart';
import 'package:moor/moor.dart';
import 'package:fedi/app/database/dao/remote/app_remote_database_dao.dart';

abstract class SimpleAppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl>
    with SimpleDatabaseDaoMixin<DbItem, DbId, TableDsl, TableInfoDsl> {
  SimpleAppRemoteDatabaseDao(AppDatabase db) : super(db);
}
