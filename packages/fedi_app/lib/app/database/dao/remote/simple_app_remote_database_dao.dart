import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/remote/app_remote_database_dao.dart';
import 'package:fedi_app/app/database/dao/simple_database_dao_mixin.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class SimpleAppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl,
        Filters, OrderingTerm>
    with
        SimpleDatabaseDaoMixin<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
            OrderingTerm> {
  SimpleAppRemoteDatabaseDao(AppDatabase db) : super(db);
}
