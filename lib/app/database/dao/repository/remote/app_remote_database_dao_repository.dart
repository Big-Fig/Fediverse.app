import 'package:fedi/app/database/dao/remote/app_remote_database_dao.dart';
import 'package:fedi/app/database/dao/repository/app_database_dao_repository.dart';
import 'package:fedi/repository/repository.dart';
import 'package:moor/moor.dart';

abstract class AppRemoteDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        RemoteItem,
        DbId,
        RemoteId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends AppDatabaseDaoRepository<DbItem, AppItem, DbId, TableDsl,
        TableInfoDsl>
    implements
        IAppRemoteReadWriteRepository<DbItem, AppItem, RemoteItem, DbId,
            RemoteId> {
  @override
  AppRemoteDatabaseDao<DbItem, DbId, RemoteId, TableDsl, TableInfoDsl> get dao;

  @override
  Future<RemoteItem?> findByDbIdInRemoteType(DbId id) {}

  @override
  Future<AppItem?> findByRemoteIdInAppType(RemoteId remoteId) {}

  @override
  Future<DbItem?> findByRemoteIdInDbType(RemoteId remoteId) {}

  @override
  Future<RemoteItem?> findByRemoteIdInRemoteType(RemoteId remoteId) {}

  @override
  Future<List<RemoteItem>> getAllInRemoteType() {}

  @override
  Future insertAllInRemoteType(List<RemoteItem> remoteItems) {
    // TODO: implement insertAllInRemoteType
    throw UnimplementedError();
  }

  @override
  Future<int> insertInRemoteType(RemoteItem remoteItem) {}

  @override
  Future<bool> updateAppTypeByRemoteType({
    required AppItem appItem,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future<bool> updateByIdInRemoteType({
    required DbId dbId,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future<bool> updateDbTypeByRemoteType({
    required DbItem dbItem,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future<bool> updateRemoteTypeByDbType({
    required DbItem dbItem,
    required RemoteItem remoteItem,
  }) {}

  @override
  Future upsertAllInRemoteType(List<RemoteItem> remoteItems) {}

  @override
  Future<int> upsertInRemoteType(RemoteItem remoteItem) {}

  @override
  Stream<List<RemoteItem>> watchAllInRemoteType() {}

  @override
  Stream<RemoteItem?> watchByDbIdInRemoteType(DbId id) {}

  @override
  Stream<AppItem?> watchByRemoteIdInAppType(RemoteId remoteId) {}

  @override
  Stream<DbItem?> watchByRemoteIdInDbType(RemoteId remoteId) {}

  @override
  Stream<RemoteItem?> watchByRemoteIdInRemoteType(RemoteId remoteId) {}

  RemoteItem mapAppItemToRemoteItem(AppItem appItem);

  @override
  Future<bool> deleteByRemoteId(RemoteId RemoteId) {}
}
