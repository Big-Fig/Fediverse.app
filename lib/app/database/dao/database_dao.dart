import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

abstract class DatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends DatabaseAccessor<AppDatabase> {
  TableInfoDsl get table;

  String get tableName => table.$tableName;

  String get idFieldName => "id";

  DatabaseDao(AppDatabase db) : super(db);

  SimpleSelectStatement<TableDsl, DbItem> startSelectQuery() => (select(table));

  Future<int> upsert({
    required Insertable<DbItem> entity,
  }) async =>
      insert(
        entity: entity,
        mode: InsertMode.insertOrReplace,
      );

  Future upsertBatch({
    required Insertable<DbItem> entity,
    required Batch? batchTransaction,
  }) =>
      insertBatch(
        entity: entity,
        batchTransaction: batchTransaction,
        mode: InsertMode.insertOrReplace,
      );

  Future upsertAll({
    required List<Insertable<DbItem>> entities,
    required Batch? batchTransaction,
  }) =>
      insertAll(
        entities: entities,
        batchTransaction: batchTransaction,
        mode: InsertMode.insertOrReplace,
      );

  Future<bool> replace({
    required Insertable<DbItem> entity,
  }) =>
      update(table).replace(entity);

  Future replaceBatch({
    required Insertable<DbItem> entity,
    required Batch? batchTransaction,
  }) =>
      insertBatch(
        entity: entity,
        batchTransaction: batchTransaction,
        mode: InsertMode.replace,
      );

  Future<int> insert({
    required Insertable<DbItem> entity,
    required InsertMode? mode,
  }) =>
      into(table).insert(
        entity,
        mode: mode,
      );

  Future insertBatch({
    required Insertable<DbItem> entity,
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.insert(
        table,
        entity,
        mode: mode,
      );
    } else {
      await insert(entity: entity, mode: mode);
    }
  }

  Future insertAll({
    required List<Insertable<DbItem>> entities,
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      _insertAll(
        batchTransaction,
        entities,
        mode,
      );
    } else {
      await batch(
        (batch) {
          _insertAll(batch, entities, mode);
        },
      );
    }
  }

  void _insertAll(
    Batch batchTransaction,
    List<Insertable<DbItem>> entities,
    InsertMode? mode,
  ) {
    batchTransaction.insertAll(
      table,
      entities,
      mode: mode,
    );
  }

  Future<int> countAll() => countAllSelectable().getSingle();

  Stream<int> watchCountAll() => countAllSelectable().watchSingle();

  Selectable<int> countAllSelectable() => customSelect(
        'SELECT COUNT(*) FROM $tableName',
        readsFrom: {table},
      ).map(
        (QueryRow row) => row.readInt(
          'COUNT(*)',
        ),
      );

  Future<List<DbItem>> getAll() => getAllSelectable().get();

  Stream<List<DbItem>> watchGetAll() => getAllSelectable().watch();

  Selectable<DbItem> getAllSelectable() => customSelect(
        'SELECT * FROM $tableName',
        readsFrom: {table},
      ).map(table.mapFromRow);

  Future<DbItem?> getNewestOrderById({required int? offset}) =>
      getNewestOrderByIdSelectable(offset: offset).getSingleOrNull();

  Stream<DbItem?> watchGetNewestOrderById({required int? offset}) =>
      getNewestOrderByIdSelectable(offset: offset).watchSingleOrNull();

  Selectable<DbItem> getNewestOrderByIdSelectable({required int? offset}) =>
      customSelect(
        'SELECT * FROM $tableName '
                'ORDER BY $idFieldName ASC'
                'LIMIT 1' +
            createOffsetContent(offset),
        readsFrom: {table},
      ).map(table.mapFromRow);

  Future<DbItem?> getOldestOrderById({required int? offset}) =>
      getOldestOrderByIdSelectable(offset: offset).getSingleOrNull();

  Stream<DbItem?> watchGetOldestOrderById({required int? offset}) =>
      getOldestOrderByIdSelectable(offset: offset).watchSingleOrNull();

  Selectable<DbItem> getOldestOrderByIdSelectable({required int? offset}) =>
      customSelect(
        'SELECT * FROM $tableName '
                'ORDER BY $idFieldName DESC'
                'LIMIT 1' +
            createOffsetContent(offset),
        readsFrom: {table},
      ).map(table.mapFromRow);

  String createOffsetContent(int? offset) =>
      (offset != null ? " OFFSET :offset" : "");

  Future<DbItem?> findById(DbId id) => findByIdSelectable(id).getSingleOrNull();

  Stream<DbItem?> watchFindById(DbId id) =>
      findByIdSelectable(id).watchSingleOrNull();

  Selectable<DbItem> findByIdSelectable(DbId id) => customSelect(
        'SELECT * FROM $tableName '
        'WHERE ${createFindByDbIdWhereExpressionContent(id)} '
        'LIMIT 1',
        readsFrom: {table},
      ).map(table.mapFromRow);

  String createFindByDbIdWhereExpressionContent(DbId id) =>
      createFindByDbIdWhereExpression(id).content;

  Future<int> countById(DbId id) => countByIdSelectable(id).getSingle();

  Stream<int> watchCountById(DbId id) => countByIdSelectable(id).watchSingle();

  Selectable<int> countByIdSelectable(DbId id) => customSelect(
        'SELECT COUNT(*) FROM $tableName '
        'WHERE ${createFindByDbIdWhereExpressionContent(id)}',
        readsFrom: {table},
      ).map(
        (QueryRow row) => row.readInt(
          'COUNT(*)',
        ),
      );

  Future<int> deleteById(DbId id) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${createFindByDbIdWhereExpressionContent(id)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByIdBatch(
    DbId id, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => createFindByDbIdWhereExpression(id),
      );
    } else {
      return await deleteById(id);
    }
  }

  Future deleteOlderThanDateTime(
    DateTime dateTime, {
    required String fieldName,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => createOlderThanDateTimeWhereExpression(
          fieldName: fieldName,
          dateTimeValue: dateTime,
        ),
      );
    } else {
      return await batch(
        (batch) => deleteOlderThanDateTime(
          dateTime,
          fieldName: fieldName,
          batchTransaction: batchTransaction,
        ),
      );
    }
  }

  Future deleteOlderThanString(
    String string, {
    required String fieldName,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => createOlderThanStringWhereExpression(
          fieldName: fieldName,
          stringValue: string,
        ),
      );
    } else {
      return await batch(
        (batch) => deleteOlderThanString(
          string,
          fieldName: fieldName,
          batchTransaction: batchTransaction,
        ),
      );
    }
  }

  Future deleteOlderThanInt(
    int intValue, {
    required String fieldName,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => createOlderThanIntWhereExpression(
          fieldName: fieldName,
          intValue: intValue,
        ),
      );
    } else {
      return await batch(
        (batch) => deleteOlderThanInt(
          intValue,
          fieldName: fieldName,
          batchTransaction: batchTransaction,
        ),
      );
    }
  }

  Future clear({
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => const Constant(true),
      );
    } else {
      return await customUpdate(
        'DELETE FROM $tableName',
        updates: {table},
        updateKind: UpdateKind.delete,
      );
    }
  }

  CustomExpression<bool> createFindByDbIdWhereExpression(DbId dbId) =>
      createMainTableEqualWhereExpression(
        fieldName: idFieldName,
        value: dbId,
      );

  CustomExpression<bool> createOlderThanStringWhereExpression({
    required String fieldName,
    required String stringValue,
  }) =>
      CustomExpression<bool>("$tableName.$fieldName < $stringValue");

  CustomExpression<bool> createOlderThanIntWhereExpression({
    required String fieldName,
    required int intValue,
  }) =>
      CustomExpression<bool>("$tableName.$fieldName < $intValue");

  CustomExpression<bool> createOlderThanDateTimeWhereExpression({
    required String fieldName,
    required DateTime dateTimeValue,
  }) =>
      CustomExpression<bool>("$tableName.$fieldName < $dateTimeValue");

  void addFindByDbIdWhereToSimpleSelectStatement({
    required SimpleSelectStatement simpleSelectStatement,
    required DbId dbId,
  }) {
    simpleSelectStatement.where(
      (_) => createFindByDbIdWhereExpression(dbId),
    );
  }

  CustomExpression<bool> createMainTableEqualWhereExpression({
    required String fieldName,
    required dynamic value,
  }) =>
      createEqualWhereExpression(
        tableName: tableName,
        fieldName: fieldName,
        value: value,
      );

  static CustomExpression<bool> createEqualWhereExpression({
    required String tableName,
    required String fieldName,
    required dynamic value,
  }) =>
      CustomExpression<bool>("$tableName.$fieldName = '${value.toString()}'");

}
