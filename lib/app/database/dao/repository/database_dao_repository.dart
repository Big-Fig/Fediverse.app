import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository.dart';
import 'package:moor/moor.dart';

abstract class DatabaseDaoRepository<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AsyncInitLoadingBloc
    implements IDbReadWriteRepository<DbItem, DbId> {
  DatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> get dao;

  @override
  Future internalAsyncInit() async {
    // nothing to init by default
    return null;
  }

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Future<DbItem?> findByDbIdInDbType(DbId dbId) {}

  @override
  Future<List<DbItem>> getAllInDbType() {}

  @override
  Future<bool> updateByDbIdInDbType({
    required DbId dbId,
    required Insertable<DbItem> dbItem,
  }) {

  }

  @override
  Stream<List<DbItem>> watchAllInDbType() {}

  @override
  Future<bool> isExistWithDbId(DbId dbId) async {
    var found = await findByDbIdInDbType(dbId);
    return found != null;
  }

  @override
  Future insertAllInDbType(List<Insertable<DbItem>> dbItems) =>
      dao.insertAll(entities: dbItems, mode: null);

  @override
  Future<int> insertInDbType(Insertable<DbItem> dbItem) =>
      dao.insert(entity: dbItem, mode: null);

  @override
  Future upsertAllInDbType(List<Insertable<DbItem>> dbItems) =>
      dao.insertAll(entities: dbItems, mode: InsertMode.insertOrReplace);

  @override
  Future<int> upsertInDbType(Insertable<DbItem> dbItem) =>
      dao.insert(entity: dbItem, mode: InsertMode.insertOrReplace);

  @override
  Stream<DbItem?> watchByDbIdInDbType(DbId dbId) =>
      dao.findById(dbId).watchSingleOrNull();

  @override
  Future<int> deleteById(DbId id) => dao.deleteById(id);

  @override
  Future clear() => dao.clear();
}
