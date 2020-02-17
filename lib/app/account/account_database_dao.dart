import 'package:fedi/app/account/account_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'account_database_dao.g.dart';

@UseDao(tables: [
  DbAccounts
], queries: {
  "countAll": "SELECT Count(*) FROM db_accounts;",
  "findById": "SELECT * FROM db_accounts WHERE id = :id;",
  "findByRemoteId": "SELECT * FROM db_accounts WHERE remote_id LIKE :remoteId;",
  "countById": "SELECT COUNT(*) FROM db_accounts WHERE id = :id;",
  "deleteById": "DELETE FROM db_accounts WHERE id = :id;",
  "clear": "DELETE FROM db_accounts",
  "getAll": "SELECT * FROM db_accounts",
  "findLocalIdByRemoteId": "SELECT id FROM db_accounts WHERE remote_id = "
      ":remoteId;",
})
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db);

  Future<int> insert(Insertable<DbAccount> entity) async =>
      into(dbAccounts).insert(entity);

  Future insertAll(
          Iterable<Insertable<DbAccount>> entities, InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbAccounts, entities);
      });
  Future<bool> replace(Insertable<DbAccount> entity) async =>
      await update(dbAccounts).replace(entity);

  Future<int> updateByRemoteId(
      String remoteId, Insertable<DbAccount> entity) async {
    var localId = await findLocalIdByRemoteIdQuery(remoteId).getSingle();

    if (localId != null && localId >= 0) {
      await (update(dbAccounts)..where((i) => i.id.equals(localId)))
          .write(entity);
    } else {
      localId = await insert(entity);
    }

    return localId;
  }

}
