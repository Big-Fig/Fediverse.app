import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/status/database'
    '/status_favourited_accounts_database_model.dart';
import 'package:moor/moor.dart';

part 'status_favourited_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusFavouritedAccounts,
  ],
)
class StatusFavouritedAccountsDao extends AppDatabaseDao<
    DbStatusFavouritedAccount,
    int,
    $DbStatusFavouritedAccountsTable,
    $DbStatusFavouritedAccountsTable> with _$StatusFavouritedAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusFavouritedAccountsDao(this.db) : super(db);

  @override
  $DbStatusFavouritedAccountsTable get table => dbStatusFavouritedAccounts;
}
