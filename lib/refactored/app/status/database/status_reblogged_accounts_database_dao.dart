import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/database/status_reblogged_accounts_database_model.dart';
import 'package:moor/moor.dart';

part 'status_reblogged_accounts_database_dao.g.dart';

@UseDao(tables: [
  DbStatusRebloggedAccounts
], queries: {
  "countAll": "SELECT Count(*) FROM db_status_reblogged_accounts;",
  "findById": "SELECT * FROM db_status_reblogged_accounts WHERE id = :id;",
  "countById":
      "SELECT COUNT(*) FROM db_status_reblogged_accounts WHERE id = :id;",
  "deleteById": "DELETE FROM db_status_reblogged_accounts WHERE id = :id;",
  "deleteByStatusRemoteId": "DELETE FROM db_status_reblogged_accounts WHERE "
      "status_remote_id = :statusRemoteId;",
  "clear": "DELETE FROM db_status_reblogged_accounts",
  "getAll": "SELECT * FROM db_status_reblogged_accounts"
})
class StatusRebloggedAccountsDao extends DatabaseAccessor<AppDatabase>
    with _$StatusRebloggedAccountsDaoMixin {
  @override
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusRebloggedAccountsDao(this.db) : super(db);

  Future<int> insert(Insertable<DbStatusRebloggedAccount> entity,
          {InsertMode mode}) async =>
      into(dbStatusRebloggedAccounts).insert(entity, mode: mode);

  Future insertAll(Iterable<Insertable<DbStatusRebloggedAccount>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbStatusRebloggedAccounts, entities, mode: mode);
      });
  Future<bool> replace(Insertable<DbStatusRebloggedAccount> entity) async =>
      await update(dbStatusRebloggedAccounts).replace(entity);
}
