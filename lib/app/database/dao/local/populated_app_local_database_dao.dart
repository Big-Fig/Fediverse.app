import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/local/app_local_database_dao.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class PopulatedAppLocalDatabaseDao<
        DbItem extends DataClass,
        DbPopulatedItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppLocalDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm>
    with
        PopulatedDatabaseDaoMixin<DbItem, DbPopulatedItem, DbId, TableDsl,
            TableInfoDsl, Filters, OrderingTerm> {
  PopulatedAppLocalDatabaseDao(AppDatabase db) : super(db);
}
