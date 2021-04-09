import 'package:moor/moor.dart';

abstract class IBaseReadRepository<DbId> {
  Future<int> countAll();

  Future<bool> isExistWithDbId(DbId dbId);
}

abstract class IDbReadRepository<DbItem extends DataClass, DbId>
    extends IBaseReadRepository<DbId> {
  Future<List<DbItem>> getAllInDbType();

  Stream<List<DbItem>> watchAllInDbType();

  Future<DbItem?> findByDbIdInDbType(DbId dbId);

  Stream<DbItem?> watchByDbIdInDbType(DbId dbId);
}

abstract class IAppReadRepository<DbItem extends DataClass, AppItem, DbId>
    extends IDbReadRepository<DbItem, DbId> {
  Future<List<AppItem>> getAllInAppType();

  Stream<List<AppItem>> watchAllInAppType();

  Future<AppItem?> findByDbIdInAppType(DbId dbId);

  Stream<AppItem?> watchByDbIdInAppType(DbId dbId);
}

abstract class IAppRemoteReadRepository<
    DbItem extends DataClass,
    AppItem,
    RemoteItem,
    DbId,
    RemoteId> extends IAppReadRepository<DbItem, AppItem, DbId> {
  Future<DbItem?> findByRemoteIdInDbType(RemoteId remoteId);

  Stream<DbItem?> watchByRemoteIdInDbType(RemoteId remoteId);

  Future<AppItem?> findByRemoteIdInAppType(RemoteId remoteId);

  Stream<AppItem?> watchByRemoteIdInAppType(RemoteId remoteId);

  Future<RemoteItem?> findByRemoteIdInRemoteType(RemoteId remoteId);

  Stream<RemoteItem?> watchByRemoteIdInRemoteType(RemoteId remoteId);

  Future<List<RemoteItem>> getAllInRemoteType();

  Stream<List<RemoteItem>> watchAllInRemoteType();

  Future<RemoteItem?> findByDbIdInRemoteType(DbId id);

  Stream<RemoteItem?> watchByDbIdInRemoteType(DbId id);
}

abstract class IBaseWriteRepository<DbId> {
  Future<int> deleteById(DbId id);

  Future clear();
}

abstract class IDbWriteRepository<DbItem extends DataClass, DbId>
    extends IBaseWriteRepository<DbId> {
  
  Future insertAllInDbType(List<Insertable<DbItem>> dbItems);

  Future upsertAllInDbType(List<Insertable<DbItem>> dbItems);

  Future<int> insertInDbType(Insertable<DbItem> dbItem);

  Future<int> upsertInDbType(Insertable<DbItem> dbItem);

  Future<bool> updateByDbIdInDbType({
    required DbId dbId,
    required Insertable<DbItem> dbItem,
  });
}

abstract class IAppWriteRepository<DbItem extends DataClass, AppItem, DbId>
    extends IDbWriteRepository<DbItem, DbId> {
  Future insertAllInAppType(List<AppItem> appItems);

  Future upsertAllInAppType(List<AppItem> appItems);

  Future<int> insertInAppType(AppItem appItem);

  Future<int> upsertInAppType(AppItem appItem);

  Future<bool> updateByDbIdInAppType({
    required DbId dbId,
    required AppItem appItem,
  });

  Future<bool> updateDbTypeByAppType({
    required DbItem dbItem,
    required AppItem appItem,
  });

  Future<bool> updateAppTypeByDbType({
    required DbItem dbItem,
    required AppItem appItem,
  });
}

abstract class IAppRemoteWriteRepository<
    DbItem extends DataClass,
    AppItem,
    RemoteItem,
    DbId,
    RemoteId> extends IAppWriteRepository<DbItem, AppItem, DbId> {
  Future<bool> deleteByRemoteId(RemoteId RemoteId);
  
  Future insertAllInRemoteType(List<RemoteItem> remoteItems);

  Future upsertAllInRemoteType(List<RemoteItem> remoteItems);

  Future<int> insertInRemoteType(RemoteItem remoteItem);

  Future<int> upsertInRemoteType(RemoteItem remoteItem);

  Future<bool> updateByIdInRemoteType({
    required DbId dbId,
    required RemoteItem remoteItem,
  });

  Future<bool> updateDbTypeByRemoteType({
    required DbItem dbItem,
    required RemoteItem remoteItem,
  });

  Future<bool> updateRemoteTypeByDbType({
    required DbItem dbItem,
    required RemoteItem remoteItem,
  });

  Future<bool> updateAppTypeByRemoteType({
    required AppItem appItem,
    required RemoteItem remoteItem,
  });
}

abstract class IBaseReadWriteRepository<DbId>
    implements IBaseReadRepository<DbId>, IBaseWriteRepository<DbId> {}

abstract class IDbReadWriteRepository<DbItem extends DataClass, DbId>
    implements
        IDbReadRepository<DbItem, DbId>,
        IDbWriteRepository<DbItem, DbId> {}

abstract class IAppReadWriteRepository<DbItem extends DataClass, AppItem, DbId>
    implements
        IAppReadRepository<DbItem, AppItem, DbId>,
        IAppWriteRepository<DbItem, AppItem, DbId> {}

abstract class IAppRemoteReadWriteRepository<DbItem extends DataClass, AppItem,
        RemoteItem, DbId, RemoteId>
    implements
        IAppRemoteReadRepository<DbItem, AppItem, RemoteItem, DbId, RemoteId>,
        IAppRemoteWriteRepository<DbItem, AppItem, RemoteItem, DbId, RemoteId> {
}
