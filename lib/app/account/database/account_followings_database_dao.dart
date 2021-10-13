import 'package:fedi/app/account/database/account_followings_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:moor/moor.dart';

part 'account_followings_database_dao.g.dart';

@UseDao(
  tables: [
    DbAccountFollowings,
  ],
)
class AccountFollowingsDao extends DatabaseDao<
    DbAccountFollowing,
    int,
    $DbAccountFollowingsTable,
    $DbAccountFollowingsTable> with _$AccountFollowingsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountFollowingsDao(this.db) : super(db);

  @override
  $DbAccountFollowingsTable get table => dbAccountFollowings;

  Selectable<DbAccountFollowing> findByAccountRemoteId(
          String accountRemoteId) =>
      customSelect(
        'SELECT * FROM $tableName WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable<String>(accountRemoteId)],
        readsFrom: {dbAccountFollowings},
      ).map(dbAccountFollowings.mapFromRow);

  Future<int> deleteByAccountRemoteIdAndFollowingAccountRemoteId({
    required String followingAccountRemoteId,
    required String accountRemoteId,
  }) =>
      customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createAccountRemoteIdEqualExpression(accountRemoteId)} '
        'AND ${_createFollowingAccountRemoteIdEqualExpression(accountRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByAccountRemoteIdAndFollowingAccountRemoteIdBatch({
    required String followingAccountRemoteId,
    required String accountRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) =>
            _createAccountRemoteIdEqualExpression(accountRemoteId) &
            _createFollowingAccountRemoteIdEqualExpression(
              followingAccountRemoteId,
            ),
      );
    } else {
      return deleteByAccountRemoteIdAndFollowingAccountRemoteId(
        accountRemoteId: accountRemoteId,
        followingAccountRemoteId: followingAccountRemoteId,
      );
    }
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createAccountRemoteIdEqualExpression(accountRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByAccountRemoteIdBatch(
    String accountRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createAccountRemoteIdEqualExpression(accountRemoteId),
      );
    } else {
      return deleteByAccountRemoteId(accountRemoteId);
    }
  }

  CustomExpression<bool> _createAccountRemoteIdEqualExpression(
    String accountRemoteId,
  ) =>
      createMainTableEqualWhereExpression(
        fieldName: table.accountRemoteId.$name,
        value: accountRemoteId,
      );

  Future<int> deleteByFollowingAccountRemoteId(
    String followingAccountRemoteId,
  ) =>
      customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createFollowingAccountRemoteIdEqualExpression(followingAccountRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByFollowingAccountRemoteIdBatch(
    String followingAccountRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createFollowingAccountRemoteIdEqualExpression(
          followingAccountRemoteId,
        ),
      );
    } else {
      return deleteByFollowingAccountRemoteId(followingAccountRemoteId);
    }
  }

  CustomExpression<bool> _createFollowingAccountRemoteIdEqualExpression(
    String followingAccountRemoteId,
  ) =>
      createMainTableEqualWhereExpression(
        fieldName: table.followingAccountRemoteId.$name,
        value: followingAccountRemoteId,
      );
}
