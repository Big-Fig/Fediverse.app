import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

abstract class DatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends DatabaseAccessor<AppDatabase> {
  TableInfoDsl get table;

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
    Batch? batchTransaction,
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

  Selectable<int> countAll();

  Selectable<DbItem> getAll();

  Selectable<DbItem> findById(DbId id);

  Selectable<int> countById(DbId id);

  Future<int> deleteById(DbId id);

  Future<int> clear();
}
