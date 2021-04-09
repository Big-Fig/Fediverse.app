import 'package:fedi/app/database/dao/repository/app_database_dao_repository.dart';
import 'package:moor/moor.dart';

abstract class AppLocalDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppDatabaseDaoRepository<DbItem, AppItem, DbId, TableDsl,
        TableInfoDsl> {}
