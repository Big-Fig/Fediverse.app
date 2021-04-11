import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:fedi/app/status/database'
    '/status_favourited_accounts_database_model.dart';
import 'package:moor/moor.dart';

part 'status_favourited_accounts_database_dao.g.dart';

@UseDao(tables: [
  DbStatusFavouritedAccounts,
])
class StatusFavouritedAccountsDao extends DatabaseDao<
    DbStatusFavouritedAccount,
    int,
    $DbStatusFavouritedAccountsTable,
    $DbStatusFavouritedAccountsTable> with _$StatusFavouritedAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusFavouritedAccountsDao(this.db) : super(db);

  @override
  $DbStatusFavouritedAccountsTable get table => dbStatusFavouritedAccounts;

  Future<int> deleteByStatusRemoteId(String statusRemoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createStatusRemoteIdEqualExpression(statusRemoteId).content}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByStatusRemoteIdBatch(
    String statusRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createStatusRemoteIdEqualExpression(statusRemoteId),
      );
    } else {
      return await deleteByStatusRemoteId(statusRemoteId);
    }
  }

  CustomExpression<bool> _createStatusRemoteIdEqualExpression(
      String statusRemoteId) {
    return createMainTableEqualWhereExpression(
      fieldName: table.statusRemoteId.$name,
      value: statusRemoteId,
    );
  }
}
