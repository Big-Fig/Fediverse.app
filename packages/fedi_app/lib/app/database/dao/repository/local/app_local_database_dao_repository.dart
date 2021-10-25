import 'package:fedi_app/app/database/dao/repository/app_database_dao_repository.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppLocalDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppDatabaseDaoRepository<DbItem, AppItem, DbId, TableDsl,
        TableInfoDsl, Filters, OrderingTerm> {}
