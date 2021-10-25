import 'package:fedi_app/app/database/dao/repository/local/app_local_database_dao_repository.dart';
import 'package:fedi_app/app/database/dao/repository/simple_app_database_dao_repository_mixin.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class SimpleAppLocalDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppLocalDatabaseDaoRepository<DbItem, AppItem, DbId, TableDsl,
        TableInfoDsl, Filters, OrderingTerm>
    with
        SimpleDatabaseDaoRepositoryMixin<DbItem, AppItem, DbId, TableDsl,
            TableInfoDsl, Filters, OrderingTerm> {}
