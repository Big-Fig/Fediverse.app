import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_model.dart';
import 'package:moor/moor.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';

part 'status_reblogged_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusRebloggedAccounts,
  ],
  queries: {
    "countAll": "SELECT Count(*) FROM db_status_reblogged_accounts;",
    "findById": "SELECT * FROM db_status_reblogged_accounts WHERE id = :id;",
    "countById":
        "SELECT COUNT(*) FROM db_status_reblogged_accounts WHERE id = :id;",
    "deleteById": "DELETE FROM db_status_reblogged_accounts WHERE id = :id;",
    "deleteByStatusRemoteId": "DELETE FROM db_status_reblogged_accounts WHERE "
        "status_remote_id = :statusRemoteId;",
    "clear": "DELETE FROM db_status_reblogged_accounts",
    "getAll": "SELECT * FROM db_status_reblogged_accounts",
  },
)
class StatusRebloggedAccountsDao extends AppDatabaseDao<
    DbStatusRebloggedAccount,
    int,
    $DbStatusRebloggedAccountsTable,
    $DbStatusRebloggedAccountsTable> with _$StatusRebloggedAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusRebloggedAccountsDao(this.db) : super(db);

  @override
  $DbStatusRebloggedAccountsTable get table => dbStatusRebloggedAccounts;
}
