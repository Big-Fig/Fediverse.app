import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppLocalDatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm> {
  AppLocalDatabaseDao(AppDatabase db) : super(db);
}
