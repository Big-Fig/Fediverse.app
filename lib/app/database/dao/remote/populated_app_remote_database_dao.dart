import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/remote/app_remote_database_dao.dart';
import 'package:moor/moor.dart';

abstract class PopulatedAppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbPopulatedItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters>
    extends AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl>
    with
        PopulatedDatabaseDaoMixin<DbItem, DbPopulatedItem, DbId, TableDsl,
            TableInfoDsl, Filters> {
  PopulatedAppRemoteDatabaseDao(AppDatabase db) : super(db);

  Future<DbPopulatedItem?> findByRemoteIdPopulated(RemoteId remoteId) =>
      findByRemoteIdPopulatedSelectable(remoteId).getSingleOrNull();

  Stream<DbPopulatedItem?> watchFindByRemoteIdPopulated(RemoteId remoteId) =>
      findByRemoteIdPopulatedSelectable(remoteId).watchSingleOrNull();

  Selectable<DbPopulatedItem> findByRemoteIdPopulatedSelectable(
      RemoteId remoteId) {
    var query = startSelectQuery();
    var joinedQuery = convertSimpleSelectStatementToJoinedSelectStatement(
      query: query,
      filters: null,
    );
    joinedQuery.where(createFindByRemoteIdWhereExpression(remoteId));
    joinedQuery.limit(1, offset: null);

    return joinedQuery.map(mapTypedResultToDbPopulatedItem);
  }
}
