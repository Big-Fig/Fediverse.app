import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/app_database_dao.dart';
import 'package:fedi/app/status/database/status_hashtags_database_model.dart';
import 'package:moor/moor.dart';

part 'status_hashtags_database_dao.g.dart';

@UseDao(
  tables: [
    DbStatusHashtags,
  ],
)
class StatusHashtagsDao extends AppDatabaseDao<
    DbStatusHashtag,
    int,
    $DbStatusHashtagsTable,
    $DbStatusHashtagsTable> with _$StatusHashtagsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  StatusHashtagsDao(this.db) : super(db);

  @override
  $DbStatusHashtagsTable get table => dbStatusHashtags;


  Future<int> deleteByStatusRemoteId(String statusRemoteId) => customUpdate(
    'DELETE FROM $tableName '
        'WHERE ${_createStatusRemoteIdEqualExpression(statusRemoteId)}',
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
