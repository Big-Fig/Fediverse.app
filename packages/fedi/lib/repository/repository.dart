import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class IBaseReadRepository<DbId> {
  Future<int> countAll();

  Future<bool> isExistWithDbId(DbId dbId);
}

abstract class IDbReadRepository<DbItem extends DataClass, DbId, Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends IBaseReadRepository<DbId> {
  Future<List<DbItem>> getAllInDbType();

  Stream<List<DbItem>> watchAllInDbType();

  Future<DbItem?> findByDbIdInDbType(DbId dbId);

  Stream<DbItem?> watchByDbIdInDbType(DbId dbId);

  Future<DbItem?> findInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Stream<DbItem?> watchFindInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Future<List<DbItem>> findAllInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Stream<List<DbItem>> watchFindAllInDbType({
    required RepositoryPagination<DbItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });
}

abstract class IAppReadRepository<DbItem extends DataClass, AppItem, DbId,
        Filters, OrderingTerm extends RepositoryOrderingTerm>
    extends IDbReadRepository<DbItem, DbId, Filters, OrderingTerm> {
  Future<List<AppItem>> getAllInAppType();

  Stream<List<AppItem>> watchAllInAppType();

  Future<AppItem?> findByDbIdInAppType(DbId dbId);

  Stream<AppItem?> watchByDbIdInAppType(DbId dbId);

  Future<AppItem?> findInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Stream<AppItem?> watchFindInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Future<List<AppItem>> findAllInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Stream<List<AppItem>> watchFindAllInAppType({
    required RepositoryPagination<AppItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });
}

abstract class IAppRemoteReadRepository<
        DbItem extends DataClass,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends IAppReadRepository<DbItem, AppItem, DbId, Filters, OrderingTerm> {
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

  Future<RemoteItem?> findInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Stream<RemoteItem?> watchFindInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Future<List<RemoteItem>> findAllInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });

  Stream<List<RemoteItem>> watchFindAllInRemoteType({
    required RepositoryPagination<RemoteItem>? pagination,
    required Filters? filters,
    required List<OrderingTerm>? orderingTerms,
  });
}

abstract class IBaseWriteRepository<DbId> {
  Future<void> batch(Function(Batch batch) runInBatch);

  Future<void> deleteById(
    DbId id, {
    required Batch? batchTransaction,
  });

  Future<void> clear({
    required Batch? batchTransaction,
  });
}

abstract class IDbWriteRepository<DbItem extends DataClass, DbId>
    extends IBaseWriteRepository<DbId> {
  Future<void> insertAllInDbType(
    List<Insertable<DbItem>> dbItems, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  });

  Future<void> upsertAllInDbType(
    List<Insertable<DbItem>> dbItems, {
    required Batch? batchTransaction,
  });

  Future<int> insertInDbType(
    Insertable<DbItem> dbItem, {
    required InsertMode? mode,
  });

  Future<int> upsertInDbType(Insertable<DbItem> dbItem);

  Future<void> insertInDbTypeBatch(
    Insertable<DbItem> dbItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  });

  Future<void> upsertInDbTypeBatch(
    Insertable<DbItem> dbItem, {
    required Batch? batchTransaction,
  });

  Future<void> updateByDbIdInDbType({
    required DbId dbId,
    required DbItem dbItem,
    required Batch? batchTransaction,
  });
}

abstract class IAppWriteRepository<DbItem extends DataClass, AppItem, DbId>
    extends IDbWriteRepository<DbItem, DbId> {
  // Future<void> insertAllInAppType(
  //   List<AppItem> appItems, {
  //   required InsertMode? mode,
  //   required Batch? batchTransaction,
  // });

  // Future<void> upsertAllInAppType(
  //   List<AppItem> appItems, {
  //   required Batch? batchTransaction,
  // });
  //
  // Future<int> insertInAppType(
  //   AppItem appItem, {
  //   required InsertMode? mode,
  // });

  // Future<int> upsertInAppType(AppItem appItem);
  //
  // Future<void> insertInAppTypeBatch(
  //   AppItem appItem, {
  //   required InsertMode? mode,
  //   required Batch? batchTransaction,
  // });
  //
  // Future<void> upsertInAppTypeBatch(
  //   AppItem appItem, {
  //   required Batch? batchTransaction,
  // });
  //
  // Future<void> updateByDbIdInAppType({
  //   required DbId dbId,
  //   required AppItem appItem,
  //   required Batch? batchTransaction,
  // });
  //
  // Future<void> updateDbTypeByAppType({
  //   required DbItem dbItem,
  //   required AppItem appItem,
  //   required Batch? batchTransaction,
  // });

}

abstract class IAppRemoteWriteRepository<
    DbItem extends DataClass,
    AppItem,
    RemoteItem,
    DbId,
    RemoteId> extends IAppWriteRepository<DbItem, AppItem, DbId> {
  Future<void> deleteByRemoteId(
    RemoteId remoteId, {
    required Batch? batchTransaction,
  });

  Future<void> insertAllInRemoteType(
    List<RemoteItem> remoteItems, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  });

  Future<void> upsertAllInRemoteType(
    List<RemoteItem> remoteItems, {
    required Batch? batchTransaction,
  });

  Future<void> upsertInRemoteTypeBatch(
    RemoteItem remoteItem, {
    required Batch? batchTransaction,
  });

  Future<int> insertInRemoteType(
    RemoteItem remoteItem, {
    required InsertMode? mode,
  });

  Future<int> upsertInRemoteType(
    RemoteItem remoteItem,
  );

  Future<void> insertInRemoteTypeBatch(
    RemoteItem remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  });

  // Future<void> updateByIdInRemoteType({
  //   required DbId dbId,
  //   required RemoteItem remoteItem,
  //   required Batch? batchTransaction,
  // });

  // Future<void> updateDbTypeByRemoteType({
  //   required DbItem dbItem,
  //   required RemoteItem remoteItem,
  //   required Batch? batchTransaction,
  // });

  Future<void> updateAppTypeByRemoteType({
    required AppItem appItem,
    required RemoteItem remoteItem,
    required Batch? batchTransaction,
  });
}

abstract class IBaseReadWriteRepository<DbId>
    implements IBaseReadRepository<DbId>, IBaseWriteRepository<DbId> {}

abstract class IDbReadWriteRepository<DbItem extends DataClass, DbId, Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    implements
        IDbReadRepository<DbItem, DbId, Filters, OrderingTerm>,
        IDbWriteRepository<DbItem, DbId> {}

abstract class IAppReadWriteRepository<DbItem extends DataClass, AppItem, DbId,
        Filters, OrderingTerm extends RepositoryOrderingTerm>
    implements
        IAppReadRepository<DbItem, AppItem, DbId, Filters, OrderingTerm>,
        IAppWriteRepository<DbItem, AppItem, DbId> {}

abstract class IAppRemoteReadWriteRepository<
        DbItem extends DataClass,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    implements
        IAppRemoteReadRepository<DbItem, AppItem, RemoteItem, DbId, RemoteId,
            Filters, OrderingTerm>,
        IAppRemoteWriteRepository<DbItem, AppItem, RemoteItem, DbId, RemoteId> {
}
