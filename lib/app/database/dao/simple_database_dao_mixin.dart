import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

mixin SimpleDatabaseDaoMixin<
        DbItem extends DataClass,
        DbID,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    on AppDatabaseDao<DbItem, DbID, TableDsl, TableInfoDsl> {

}
