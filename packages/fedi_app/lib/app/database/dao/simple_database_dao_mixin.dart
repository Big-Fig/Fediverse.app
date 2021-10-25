import 'package:fedi_app/app/database/dao/app_database_dao.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

mixin SimpleDatabaseDaoMixin<
        DbItem extends DataClass,
        DbID,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    on AppDatabaseDao<DbItem, DbID, TableDsl, TableInfoDsl, Filters,
        OrderingTerm> {}
