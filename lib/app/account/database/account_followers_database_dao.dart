import 'package:fedi/app/account/database/account_followers_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

part 'account_followers_database_dao.g.dart';

@UseDao(
  tables: [DbAccountFollowers],
)
class AccountFollowersDao extends AppDatabaseDao<
    DbAccountFollower,
    int,
    $DbAccountFollowersTable,
    $DbAccountFollowersTable> with _$AccountFollowersDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountFollowersDao(this.db) : super(db);

  @override
  $DbAccountFollowersTable get table => dbAccountFollowers;
}
