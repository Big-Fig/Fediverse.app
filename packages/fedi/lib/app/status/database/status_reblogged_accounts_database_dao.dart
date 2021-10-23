import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_model.dart';
import 'package:moor/moor.dart';

part 'status_reblogged_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusRebloggedAccounts,
  ],
)
class StatusRebloggedAccountsDao extends DatabaseDao<
    DbStatusRebloggedAccount,
    int,
    $DbStatusRebloggedAccountsTable,
    $DbStatusRebloggedAccountsTable> with _$StatusRebloggedAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusRebloggedAccountsDao(this.db) : super(db);

  @override
  $DbStatusRebloggedAccountsTable get table => dbStatusRebloggedAccounts;

  Future<int> deleteByStatusRemoteId(String statusRemoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createStatusRemoteIdEqualExpression(statusRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future<void> deleteByStatusRemoteIdBatch(
    String statusRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createStatusRemoteIdEqualExpression(statusRemoteId),
      );
    } else {
      // ignore: avoid-ignoring-return-values
      await deleteByStatusRemoteId(statusRemoteId);
    }
  }

  CustomExpression<bool> _createStatusRemoteIdEqualExpression(
    String statusRemoteId,
  ) =>
      createMainTableEqualWhereExpression(
        fieldName: table.statusRemoteId.$name,
        value: statusRemoteId,
      );
}
