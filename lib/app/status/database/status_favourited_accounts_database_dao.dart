import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database'
    '/status_favourited_accounts_database_model.dart';
import 'package:moor/moor.dart';

part 'status_favourited_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusFavouritedAccounts,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_status_favourited_accounts;",
    "findById": "SELECT * FROM db_status_favourited_accounts WHERE id = :id;",
    "countById":
        "SELECT COUNT(*) FROM db_status_favourited_accounts WHERE id = :id;",
    "deleteById": "DELETE FROM db_status_favourited_accounts WHERE id = :id;",
    "deleteByStatusRemoteId": "DELETE FROM db_status_favourited_accounts WHERE "
        "status_remote_id = :statusRemoteId;",
    "clear": "DELETE FROM db_status_favourited_accounts",
    "getAll": "SELECT * FROM db_status_favourited_accounts",
  },
)
class StatusFavouritedAccountsDao extends DatabaseAccessor<AppDatabase>
    with _$StatusFavouritedAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusFavouritedAccountsDao(this.db) : super(db);

  Future<int> insert(Insertable<DbStatusFavouritedAccount> entity) async =>
      into(dbStatusFavouritedAccounts).insert(entity);

  Future insertAll(
    List<Insertable<DbStatusFavouritedAccount>> entities,
    InsertMode mode,
  ) async =>
      await batch(
        (batch) {
          batch.insertAll(
            dbStatusFavouritedAccounts,
            entities,
          );
        },
      );

  Future<bool> replace(Insertable<DbStatusFavouritedAccount> entity) async =>
      await update(dbStatusFavouritedAccounts).replace(entity);
}
