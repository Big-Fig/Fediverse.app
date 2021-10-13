import 'package:fedi/app/chat/conversation/database/conversation_chat_statuses_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:moor/moor.dart';

part 'conversation_chat_statuses_database_dao.g.dart';

@UseDao(
  tables: [DbConversationStatuses],
)
class ConversationStatusesDao extends DatabaseDao<
    DbConversationStatus,
    int,
    $DbConversationStatusesTable,
    $DbConversationStatusesTable> with _$ConversationStatusesDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ConversationStatusesDao(this.db) : super(db);

  @override
  $DbConversationStatusesTable get table => dbConversationStatuses;

  Selectable<DbConversationStatus> findByConversationRemoteId(
    String conversationRemoteId,
  ) {
    return customSelect(
      'SELECT * FROM $tableName WHERE conversation_remote_id = :conversationRemoteId;',
      variables: [
        Variable<String>(conversationRemoteId),
      ],
      readsFrom: {dbConversationStatuses},
    ).map(dbConversationStatuses.mapFromRow);
  }

  Future<int> deleteByConversationRemoteId(String conversationRemoteId) =>
      customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createConversationRemoteIdEqualExpression(conversationRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByConversationRemoteIdBatch(
    String conversationRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) =>
            _createConversationRemoteIdEqualExpression(conversationRemoteId),
      );
    } else {
      return deleteByConversationRemoteId(conversationRemoteId);
    }
  }

  CustomExpression<bool> _createConversationRemoteIdEqualExpression(
    String conversationRemoteId,
  ) {
    return createMainTableEqualWhereExpression(
      fieldName: table.conversationRemoteId.$name,
      value: conversationRemoteId,
    );
  }

  CustomExpression<bool> _createStatusRemoteIdEqualExpression(
    String statusRemoteId,
  ) {
    return createMainTableEqualWhereExpression(
      fieldName: table.statusRemoteId.$name,
      value: statusRemoteId,
    );
  }

  Future<int> deleteByConversationRemoteIdAndStatusRemoteId({
    required String conversationRemoteId,
    required String statusRemoteId,
  }) =>
      customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createConversationRemoteIdEqualExpression(conversationRemoteId)}'
        'AND ${_createStatusRemoteIdEqualExpression(statusRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByConversationRemoteIdAndStatusRemoteIdBatch({
    required String conversationRemoteId,
    required String statusRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) =>
            _createConversationRemoteIdEqualExpression(conversationRemoteId) &
            _createStatusRemoteIdEqualExpression(statusRemoteId),
      );
    } else {
      return deleteByConversationRemoteId(conversationRemoteId);
    }
  }
}
