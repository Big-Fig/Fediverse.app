import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class DatabaseDaoRepository<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends AsyncInitLoadingBloc
    implements IDbReadWriteRepository<DbItem, DbId, Filters, OrderingTerm> {
  DatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> get dao;

  Filters get emptyFilters;

  List<OrderingTerm> get defaultOrderingTerms;

  @override
  Future internalAsyncInit() async => null;

  @override
  Future<int> countAll() => dao.countAllSelectable().getSingle();

  @override
  Future<DbItem?> findByDbIdInDbType(DbId dbId) =>
      dao.findByIdSelectable(dbId).getSingleOrNull();

  @override
  Future<List<DbItem>> getAllInDbType() => dao.getAllSelectable().get();

  @override
  Future<bool> isExistWithDbId(DbId dbId) async {
    var found = await findByDbIdInDbType(dbId);

    return found != null;
  }

  @override
  Future insertAllInDbType(
    List<Insertable<DbItem>> dbItems, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertAll(
        entities: dbItems,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future<int> insertInDbType(
    Insertable<DbItem> dbItem, {
    required InsertMode? mode,
  }) =>
      dao.insert(
        entity: dbItem,
        mode: mode,
      );

  @override
  Future upsertAllInDbType(
    List<Insertable<DbItem>> dbItems, {
    required Batch? batchTransaction,
  }) =>
      dao.upsertAll(
        entities: dbItems,
        batchTransaction: batchTransaction,
      );

  @override
  Future<int> upsertInDbType(Insertable<DbItem> dbItem) => dao.upsert(
        entity: dbItem,
      );

  @override
  Stream<DbItem?> watchByDbIdInDbType(DbId dbId) =>
      dao.findByIdSelectable(dbId).watchSingleOrNull();

  @override
  Future deleteById(
    DbId id, {
    required Batch? batchTransaction,
  }) =>
      dao.deleteByIdBatch(
        id,
        batchTransaction: batchTransaction,
      );

  @override
  Future clear({
    required Batch? batchTransaction,
  }) =>
      dao.clear(
        batchTransaction: batchTransaction,
      );

  @override
  Future batch(Function(Batch batch) runInBatch) => dao.batch(runInBatch);

  @override
  Future<void> upsertInDbTypeBatch(
    Insertable<DbItem> dbItem, {
    required Batch? batchTransaction,
  }) =>
      insertInDbTypeBatch(
        dbItem,
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
}
