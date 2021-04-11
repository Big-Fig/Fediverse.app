// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_chat_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbChatAccountsTable get dbChatAccounts => attachedDatabase.dbChatAccounts;
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

  Future<int> deleteByChatRemoteId(String chatRemoteId) {
    return customUpdate(
      'DELETE FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;',
      variables: [Variable<String>(chatRemoteId)],
      updates: {dbChatAccounts},
      updateKind: UpdateKind.delete,
    );
  }
}
