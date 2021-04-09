import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/simple_database_dao_mixin.dart';
import 'package:moor/moor.dart';
import 'package:fedi/app/database/dao/local/app_local_database_dao.dart';

abstract class SimpleAppLocalDatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppLocalDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl>
    with SimpleDatabaseDaoMixin<DbItem, DbId, TableDsl, TableInfoDsl> {
  SimpleAppLocalDatabaseDao(AppDatabase db) : super(db);


}
