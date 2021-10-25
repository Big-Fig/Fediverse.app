import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/local/app_local_database_dao.dart';
import 'package:fedi_app/app/database/dao/simple_database_dao_mixin.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class SimpleAppLocalDatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppLocalDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm>
    with
        SimpleDatabaseDaoMixin<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
            OrderingTerm> {
  SimpleAppLocalDatabaseDao(AppDatabase db) : super(db);
}
