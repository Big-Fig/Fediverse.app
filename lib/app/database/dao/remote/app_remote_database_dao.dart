import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

abstract class AppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> {
  String get remoteIdFieldName => "remote_id";

  AppRemoteDatabaseDao(AppDatabase db) : super(db);

  Future<int> deleteByRemoteId(RemoteId remoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${createFindByRemoteIdWhereExpression(remoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByRemoteIdBatch(
    RemoteId remoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => createFindByRemoteIdWhereExpression(remoteId),
      );
    } else {
      return await deleteByRemoteId(remoteId);
    }
  }

  Future<DbId?> findLocalIdByRemoteId(RemoteId remoteId) =>
      findLocalIdByRemoteIdSelectable(remoteId).getSingleOrNull();

  Stream<DbId?> watchFindLocalIdByRemoteId(RemoteId remoteId) =>
      findLocalIdByRemoteIdSelectable(remoteId).watchSingleOrNull();

  Selectable<DbId> findLocalIdByRemoteIdSelectable(RemoteId remoteId) =>
      customSelect(
        'SELECT $idFieldName FROM $tableName '
        'WHERE ${createFindByRemoteIdWhereExpressionContent(remoteId)}',
        variables: [Variable(remoteId)],
        readsFrom: {table},
      ).map(
        (QueryRow row) => row.read<DbId>(
          idFieldName,
        ),
      );

  Future<DbItem?> findByRemoteId(RemoteId remoteId) =>
      findByRemoteIdSelectable(remoteId).getSingleOrNull();

  Stream<DbItem?> watchFindByRemoteId(RemoteId remoteId) =>
      findByRemoteIdSelectable(remoteId).watchSingleOrNull();

  Selectable<DbItem> findByRemoteIdSelectable(RemoteId remoteId) =>
      customSelect(
        'SELECT * FROM $tableName '
        'WHERE ${createFindByRemoteIdWhereExpressionContent(remoteId)} '
        'LIMIT 1',
        variables: [Variable(remoteId)],
        readsFrom: {table},
      ).map(table.mapFromRow);

  CustomExpression<bool> createFindByRemoteIdWhereExpression(
          RemoteId remoteId) =>
      createMainTableEqualWhereExpression(
        fieldName: remoteIdFieldName,
        value: remoteId,
      );

  String createFindByRemoteIdWhereExpressionContent(RemoteId remoteId) =>
      createFindByRemoteIdWhereExpression(remoteId).content;

  void addFindByRemoteIdWhereToSimpleSelectStatement({
    required SimpleSelectStatement simpleSelectStatement,
    required RemoteId remoteId,
  }) {
    simpleSelectStatement.where(
      (_) => createFindByRemoteIdWhereExpression(remoteId),
    );
  }
}
