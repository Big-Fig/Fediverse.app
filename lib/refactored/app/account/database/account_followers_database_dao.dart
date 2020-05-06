import 'package:fedi/refactored/app/account/database/account_followers_database_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'account_followers_database_dao.g.dart';

@UseDao(tables: [
  DbAccountFollowers
], queries: {
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
  "clear": "DELETE FROM db_account_followers",
  "getAll": "SELECT * FROM db_account_followers"
})
class AccountFollowersDao extends DatabaseAccessor<AppDatabase>
    with _$AccountFollowersDaoMixin {
  @override
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountFollowersDao(this.db) : super(db);

  Future<int> insert(Insertable<DbAccountFollower> entity,{    InsertMode mode}) async =>
      into(dbAccountFollowers).insert(entity, mode: mode);

  Future insertAll(Iterable<Insertable<DbAccountFollower>> entities,
          InsertMode mode) async =>
      await batch((batch) {
        batch.insertAll(dbAccountFollowers, entities, mode: mode);
      });

  Future<bool> replace(Insertable<DbAccountFollower> entity) async =>
      await update(dbAccountFollowers).replace(entity);
}
