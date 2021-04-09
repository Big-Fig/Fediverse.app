import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/database/dao/repository/database_dao_repository.dart';
import 'package:fedi/repository/repository.dart';
import 'package:moor/moor.dart';

abstract class AppDatabaseDaoRepository<
        DbItem extends DataClass,
        AppItem,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>>
    extends DatabaseDaoRepository<DbItem, DbId, TableDsl, TableInfoDsl>
    implements IAppReadWriteRepository<DbItem, AppItem, DbId> {
  @override
  AppDatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> get dao;

  @override
  Future<AppItem?> findByDbIdInAppType(DbId dbId) {}

  @override
  Future<List<AppItem>> getAllInAppType() {}

  @override
  Future insertAllInAppType(List<AppItem> appItems) {}

  @override
  Future<int> insertInAppType(AppItem appItem) {}

  @override
  Future<bool> updateAppTypeByDbType({
    required DbItem dbItem,
    required AppItem appItem,
  }) {}

  @override
  Future<bool> updateByDbIdInAppType({
    required DbId dbId,
    required AppItem appItem,
  }) {}

  @override
  Future<bool> updateDbTypeByAppType({
    required DbItem dbItem,
    required AppItem appItem,
  }) {}

  @override
  Future upsertAllInAppType(List<AppItem> appItems) {}

  @override
  Future<int> upsertInAppType(AppItem appItem) {}

  @override
  Stream<List<AppItem>> watchAllInAppType() {}

  @override
  Stream<AppItem?> watchByDbIdInAppType(DbId dbId) {}

  DbItem mapAppItemToDbItem(AppItem appItem);
}
