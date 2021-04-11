import 'package:fedi/app/chat/pleroma/database/pleroma_chat_accounts_database_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/database_dao.dart';
import 'package:moor/moor.dart';

part 'pleroma_chat_accounts_database_dao.g.dart';

@UseDao(
  tables: [
    DbChatAccounts,
  ],
  queries: {
    "findByChatRemoteId":
        "SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;",
    "findByChatRemoteIdAndAccountRemoteId":
        "SELECT * FROM db_chat_accounts WHERE chat_remote_id = "
            ":chatRemoteId AND account_remote_id = :accountRemoteId;",
    "findByAccountRemoteId":
        "SELECT * FROM db_chat_accounts WHERE account_remote_id = :accountRemoteId;",
    "deleteByChatRemoteId": "DELETE FROM db_chat_accounts WHERE "
        "chat_remote_id = :chatRemoteId;",
  },
)
class ChatAccountsDao extends DatabaseDao<DbChatAccount, int,
    $DbChatAccountsTable, $DbChatAccountsTable> with _$ChatAccountsDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ChatAccountsDao(this.db) : super(db);

  @override
  $DbChatAccountsTable get table => dbChatAccounts;

  Selectable<DbChatAccount> findByChatRemoteId(String chatRemoteId) {
    return customSelect(
        'SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;',
        variables: [Variable<String>(chatRemoteId)],
        readsFrom: {dbChatAccounts}).map(dbChatAccounts.mapFromRow);
  }

  Selectable<DbChatAccount> findByChatRemoteIdAndAccountRemoteId(
      String chatRemoteId, String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId AND account_remote_id = :accountRemoteId;',
        variables: [
          Variable<String>(chatRemoteId),
          Variable<String>(accountRemoteId)
        ],
        readsFrom: {
          dbChatAccounts
        }).map(dbChatAccounts.mapFromRow);
  }

  Selectable<DbChatAccount> findByAccountRemoteId(String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_chat_accounts WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable<String>(accountRemoteId)],
        readsFrom: {dbChatAccounts}).map(dbChatAccounts.mapFromRow);
  }

  Future<int> deleteByChatRemoteId(String chatRemoteId) => customUpdate(
        'DELETE FROM $tableName '
        'WHERE ${_createChatRemoteIdEqualExpression(chatRemoteId)}',
        updates: {table},
        updateKind: UpdateKind.delete,
      );

  Future deleteByChatRemoteIdBatch(
    String chatRemoteId, {
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      batchTransaction.deleteWhere(
        table,
        (tbl) => _createChatRemoteIdEqualExpression(chatRemoteId),
      );
    } else {
      return await deleteByChatRemoteId(chatRemoteId);
    }
  }

  CustomExpression<bool> _createChatRemoteIdEqualExpression(
      String chatRemoteId) {
    return createMainTableEqualWhereExpression(
      fieldName: table.chatRemoteId.$name,
      value: chatRemoteId,
    );
  }
}
