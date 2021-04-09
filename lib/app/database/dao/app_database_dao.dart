import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:moor/moor.dart';

abstract class AppDatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends DatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> {
  AppDatabaseDao(AppDatabase db) : super(db);
}
