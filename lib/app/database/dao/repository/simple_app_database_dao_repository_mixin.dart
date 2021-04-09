import 'package:fedi/app/database/dao/repository/app_database_dao_repository.dart';
import 'package:moor/moor.dart';

mixin SimpleDatabaseDaoRepositoryMixin<
        DbItem extends DataClass,
        AppItem,
        DbID,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    on AppDatabaseDaoRepository<DbItem, AppItem, DbID, TableDsl, TableInfoDsl> {
  AppItem mapDbItemToAppItem(DbItem dbItem);
}
