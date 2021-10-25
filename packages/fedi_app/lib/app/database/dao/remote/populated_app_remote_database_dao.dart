import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi_app/app/database/dao/remote/app_remote_database_dao.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class PopulatedAppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbPopulatedItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl,
        Filters, OrderingTerm>
    with
        PopulatedDatabaseDaoMixin<DbItem, DbPopulatedItem, DbId, TableDsl,
            TableInfoDsl, Filters, OrderingTerm> {
  PopulatedAppRemoteDatabaseDao(AppDatabase db) : super(db);

  Future<DbPopulatedItem?> findByRemoteIdPopulated(RemoteId remoteId) =>
      findByRemoteIdPopulatedSelectable(remoteId).getSingleOrNull();

  Stream<DbPopulatedItem?> watchFindByRemoteIdPopulated(RemoteId remoteId) =>
      findByRemoteIdPopulatedSelectable(remoteId).watchSingleOrNull();

  Selectable<DbPopulatedItem> findByRemoteIdPopulatedSelectable(
    RemoteId remoteId,
  ) {
    var query = startSelectQuery();
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    // ignore: cascade_invocations
    joinedQuery.where(createFindByRemoteIdWhereExpression(remoteId));
    // ignore: cascade_invocations
    joinedQuery.limit(1, offset: null);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }
}
