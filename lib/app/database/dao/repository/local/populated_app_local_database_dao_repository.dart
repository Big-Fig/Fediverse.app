import 'package:fedi/app/database/dao/repository/local/app_local_database_dao_repository.dart';
import 'package:fedi/app/database/dao/repository/populated_app_database_dao_repository_mixin.dart';
import 'package:moor/moor.dart';

abstract class PopulatedAppLocalDatabaseDaoRepository<
        DbItem extends DataClass,
        DbPopulatedItem,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppLocalDatabaseDaoRepository<DbItem, AppItem, DbId, TableDsl,
        TableInfoDsl>
    with
        PopulatedDatabaseDaoRepositoryMixin<DbItem, DbPopulatedItem, AppItem,
            DbId, TableDsl, TableInfoDsl> {}
