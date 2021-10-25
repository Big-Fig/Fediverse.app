import 'package:fedi_app/app/account/database/account_followers_database_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/database_dao.dart';
import 'package:moor/moor.dart';

part 'account_followers_database_dao.g.dart';

@UseDao(
  tables: [DbAccountFollowers],
)
class AccountFollowersDao extends DatabaseDao<
    DbAccountFollower,
    int,
    $DbAccountFollowersTable,
    $DbAccountFollowersTable> with _$AccountFollowersDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountFollowersDao(this.db) : super(db);

  @override
  $DbAccountFollowersTable get table => dbAccountFollowers;

  Selectable<DbAccountFollower> findByAccountRemoteId(String accountRemoteId) =>
      customSelect(
        'SELECT * FROM $tableName WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable<String>(accountRemoteId)],
        readsFrom: {dbAccountFollowers},
      ).map(dbAccountFollowers.mapFromRow);

  Future<int> deleteByAccountRemoteIdAndFollowerAccountRemoteId({
    required String followerAccountRemoteId,
    required String accountRemoteId,
  }) =>
      customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createAccountRemoteIdEqualExpression(accountRemoteId)} '
        'AND ${_createFollowerAccountRemoteIdEqualExpression(accountRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future<void> deleteByAccountRemoteIdAndFollowerAccountRemoteIdBatch({
    required String followerAccountRemoteId,
    required String accountRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) =>
            _createAccountRemoteIdEqualExpression(accountRemoteId) &
            _createFollowerAccountRemoteIdEqualExpression(
              followerAccountRemoteId,
            ),
      );
    } else {
      // ignore: avoid-ignoring-return-values
      await deleteByAccountRemoteIdAndFollowerAccountRemoteId(
        accountRemoteId: accountRemoteId,
        followerAccountRemoteId: followerAccountRemoteId,
      );
    }
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createAccountRemoteIdEqualExpression(accountRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future<void> deleteByAccountRemoteIdBatch(
    String accountRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createAccountRemoteIdEqualExpression(accountRemoteId),
      );
    } else {
      // ignore: avoid-ignoring-return-values
      await deleteByAccountRemoteId(accountRemoteId);
    }
  }

  CustomExpression<bool> _createAccountRemoteIdEqualExpression(
    String accountRemoteId,
  ) =>
      createMainTableEqualWhereExpression(
        fieldName: table.accountRemoteId.$name,
        value: accountRemoteId,
      );

  Future<int> deleteByFollowerAccountRemoteId(String followerAccountRemoteId) =>
      customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createFollowerAccountRemoteIdEqualExpression(followerAccountRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future<void> deleteByFollowerAccountRemoteIdBatch(
    String followerAccountRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createFollowerAccountRemoteIdEqualExpression(
          followerAccountRemoteId,
        ),
      );
    } else {
      // ignore: avoid-ignoring-return-values
      await deleteByFollowerAccountRemoteId(followerAccountRemoteId);
    }
  }

  CustomExpression<bool> _createFollowerAccountRemoteIdEqualExpression(
    String followerAccountRemoteId,
  ) =>
      createMainTableEqualWhereExpression(
        fieldName: table.followerAccountRemoteId.$name,
        value: followerAccountRemoteId,
      );
}
