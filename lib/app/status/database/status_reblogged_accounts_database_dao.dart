import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_model.dart';
import 'package:moor/moor.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';

part 'status_reblogged_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusRebloggedAccounts,
  ],
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
