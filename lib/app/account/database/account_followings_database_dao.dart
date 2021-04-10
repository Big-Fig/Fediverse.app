import 'package:fedi/app/account/database/account_followings_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:moor/moor.dart';

part 'account_followings_database_dao.g.dart';

@UseDao(
  tables: [
    DbAccountFollowings,
  ],
)
class AccountFollowingsDao extends AppDatabaseDao<
    DbAccountFollowing,
    int,
    $DbAccountFollowingsTable,
    $DbAccountFollowingsTable> with _$AccountFollowingsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountFollowingsDao(this.db) : super(db);

  @override
  $DbAccountFollowingsTable get table => dbAccountFollowings;
}
