import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/remote/app_remote_database_dao.dart';
import 'package:moor/moor.dart';

abstract class PopulatedAppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbPopulatedItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl>
    with
        PopulatedDatabaseDaoMixin<DbItem, DbPopulatedItem, DbId, TableDsl,
            TableInfoDsl> {
  PopulatedAppRemoteDatabaseDao(AppDatabase db) : super(db);
}
