import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:fedi/app/status/database/home_timeline_statuses_database_model.dart';
import 'package:moor/moor.dart';

part 'home_timeline_statuses_database_dao.g.dart';

@UseDao(
  tables: [
    DbHomeTimelineStatuses,
  ],
)
class HomeTimelineStatusesDao extends DatabaseDao<
    DbHomeTimelineStatus,
    int,
    $DbHomeTimelineStatusesTable,
    $DbHomeTimelineStatusesTable> with _$HomeTimelineStatusesDaoMixin {
  final AppDatabase db;

// Called by the AppDatabase class
  HomeTimelineStatusesDao(this.db) : super(db);

  @override
  $DbHomeTimelineStatusesTable get table => dbHomeTimelineStatuses;

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
  ) {
    return createMainTableEqualWhereExpression(
      fieldName: table.accountRemoteId.$name,
      value: accountRemoteId,
    );
  }
}
