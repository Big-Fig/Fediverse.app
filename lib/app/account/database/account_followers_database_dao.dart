import 'package:fedi/app/account/database/account_followers_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

part 'account_followers_database_dao.g.dart';

@UseDao(
  tables: [DbAccountFollowers],
  queries: {
    "countAll": "SELECT Count(*) FROM db_account_followers;",
    "findById": "SELECT * FROM db_account_followers WHERE id = :id;",
    "findByAccountRemoteId":
        "SELECT * FROM db_account_followers WHERE account_remote_id = :accountRemoteId;",
    "countById": "SELECT COUNT(*) FROM db_account_followers WHERE id = :id;",
    "deleteById": "DELETE FROM db_account_followers WHERE id = :id;",
    "deleteByAccountRemoteId": "DELETE FROM db_account_followers WHERE "
        "account_remote_id = :accountRemoteId;",
    "deleteByFollowerAccountRemoteId": "DELETE FROM db_account_followers WHERE "
        "follower_account_remote_id = :accountRemoteId;",
    "deleteByAccountRemoteIdAndFollowerAccountRemoteId":
        "DELETE FROM db_account_followers WHERE "
            "follower_account_remote_id = :followerAccountRemoteId AND "
            "account_remote_id = :accountRemoteId;",
    "clear": "DELETE FROM db_account_followers",
    "getAll": "SELECT * FROM db_account_followers",
  },
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
