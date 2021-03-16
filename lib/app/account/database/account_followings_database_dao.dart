import 'package:fedi/app/account/database/account_followings_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:moor/moor.dart';

part 'account_followings_database_dao.g.dart';

@UseDao(tables: [
  DbAccountFollowings
], queries: {
  "countAll": "SELECT Count(*) FROM db_account_followings;",
  "findById": "SELECT * FROM db_account_followings WHERE id = :id;",
  "findByAccountRemoteId":
      "SELECT * FROM db_account_followings WHERE account_remote_id = :accountRemoteId;",
  "countById": "SELECT COUNT(*) FROM db_account_followings WHERE id = :id;",
  "deleteById": "DELETE FROM db_account_followings WHERE id = :id;",
  "deleteByAccountRemoteId": "DELETE FROM db_account_followings WHERE "
      "account_remote_id = :accountRemoteId;",
  "deleteByFollowingAccountRemoteId": "DELETE FROM db_account_followings WHERE "
      "following_account_remote_id = :accountRemoteId;",
  "deleteByAccountRemoteIdAndFollowingAccountRemoteId":
      "DELETE FROM db_account_followings WHERE "
          "following_account_remote_id = :followingAccountRemoteId AND "
          "account_remote_id = :accountRemoteId;",
  "clear": "DELETE FROM db_account_followings",
  "getAll": "SELECT * FROM db_account_followings"
})
class AccountFollowingsDao extends DatabaseAccessor<AppDatabase>
    with _$AccountFollowingsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountFollowingsDao(this.db) : super(db);

  Future<int> insert(Insertable<DbAccountFollowing> entity,
          {InsertMode? mode}) async =>
      into(dbAccountFollowings).insert(entity, mode: mode);

  Future insertAll(Iterable<Insertable<DbAccountFollowing>> entities,
          InsertMode mode) async =>
      await batch(
        (batch) {
          batch.insertAll(
            dbAccountFollowings,
            entities as List<Insertable<DbAccountFollowing>>,
            mode: mode,
          );
        },
      );

  Future<bool> replace(Insertable<DbAccountFollowing> entity) async =>
      await update(dbAccountFollowings).replace(entity);
}
