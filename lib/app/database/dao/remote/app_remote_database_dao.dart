import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

abstract class AppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> {
  AppRemoteDatabaseDao(AppDatabase db) : super(db);

  Future<int> deleteByRemoteId(RemoteId remoteId);

  Selectable<DbItem> findByRemoteId(RemoteId remoteId);
}
