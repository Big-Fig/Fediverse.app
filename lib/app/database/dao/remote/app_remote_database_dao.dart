import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppRemoteDatabaseDao<
        DbItem extends DataClass,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl, Filters,
        OrderingTerm> {
  String get remoteIdFieldName => 'remote_id';

  AppRemoteDatabaseDao(AppDatabase db) : super(db);

  Future<int> deleteByRemoteId(RemoteId remoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${createFindByRemoteIdWhereExpressionContent(remoteId)}',
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
      return deleteByRemoteId(remoteId);
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
        readsFrom: {table},
      ).map(
        (QueryRow row) => row.read<DbId>(
          idFieldName,
        ),
      );

  Future<void> updateByRemoteId(
    RemoteId remoteId,
    Insertable<DbItem> entity,
  ) async {
    var rowsChanged = await (update(table)
          ..where(
            (_) => createFindByRemoteIdWhereExpression(remoteId),
          ))
        .write(entity);

    if (rowsChanged == 0) {
      await upsert(entity: entity);
    }
  }

  Future<DbItem?> findByRemoteId(RemoteId remoteId) =>
      findByRemoteIdSelectable(remoteId).getSingleOrNull();

  Stream<DbItem?> watchFindByRemoteId(RemoteId remoteId) =>
      findByRemoteIdSelectable(remoteId).watchSingleOrNull();

  Selectable<DbItem> findByRemoteIdSelectable(RemoteId remoteId) =>
      customSelect(
        'SELECT * FROM $tableName '
        'WHERE ${createFindByRemoteIdWhereExpressionContent(remoteId)} '
        'LIMIT 1',
        readsFrom: {table},
      ).map(table.mapFromRow);

  CustomExpression<bool> createFindByRemoteIdWhereExpression(
    RemoteId remoteId,
  ) =>
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

  void addDateTimeBoundsWhere(
    SimpleSelectStatement<TableDsl, DbItem> query, {
    required GeneratedColumn<DateTime?> column,
    required DateTime? minimumDateTimeExcluding,
    required DateTime? maximumDateTimeExcluding,
  }) {
    var minimumExist = minimumDateTimeExcluding != null;
    var maximumExist = maximumDateTimeExcluding != null;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      query.where(
        (status) => column.isBiggerThanValue(minimumDateTimeExcluding),
      );
    }
    if (maximumExist) {
      query.where(
        (status) => column.isSmallerThanValue(maximumDateTimeExcluding),
      );
    }
  }

  void addRemoteIdBoundsWhere(
    SimpleSelectStatement<TableDsl, DbItem> query, {
    required String? minimumRemoteIdExcluding,
    required String? maximumRemoteIdExcluding,
  }) {
    var minimumExist = minimumRemoteIdExcluding?.isNotEmpty == true;
    var maximumExist = maximumRemoteIdExcluding?.isNotEmpty == true;
    assert(minimumExist || maximumExist);

    if (minimumExist) {
      var biggerExp = CustomExpression<bool>(
        "$tableName.$remoteIdFieldName > '$minimumRemoteIdExcluding'",
      );
      query.where((filter) => biggerExp);
    }
    if (maximumExist) {
      var smallerExp = CustomExpression<bool>(
        "$tableName.$remoteIdFieldName < '$maximumRemoteIdExcluding'",
      );
      query.where((filter) => smallerExp);
    }
  }

  Future<DbItem?> getNewestOrderByRemoteId({required int? offset}) =>
      getNewestOrderByRemoteIdSelectable(offset: offset).getSingleOrNull();

  Stream<DbItem?> watchGetNewestOrderByRemoteId({required int? offset}) =>
      getNewestOrderByRemoteIdSelectable(offset: offset).watchSingleOrNull();

  Selectable<DbItem> getNewestOrderByRemoteIdSelectable({
    required int? offset,
  }) =>
      customSelect(
        'SELECT * FROM $tableName '
                'ORDER BY $remoteIdFieldName ASC '
                'LIMIT 1' +
            createOffsetContent(offset),
        readsFrom: {table},
      ).map(table.mapFromRow);

  Future<DbItem?> getOldestOrderByRemoteId({required int? offset}) =>
      getOldestOrderByRemoteIdSelectable(offset: offset).getSingleOrNull();

  Stream<DbItem?> watchGetOldestOrderByRemoteId({required int? offset}) =>
      getOldestOrderByRemoteIdSelectable(offset: offset).watchSingleOrNull();

  Selectable<DbItem> getOldestOrderByRemoteIdSelectable({
    required int? offset,
  }) =>
      customSelect(
        'SELECT * FROM $tableName '
                'ORDER BY $remoteIdFieldName DESC '
                'LIMIT 1' +
            createOffsetContent(offset),
        readsFrom: {table},
      ).map(table.mapFromRow);
}
