// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_chat_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbChatAccountsTable get dbChatAccounts => attachedDatabase.dbChatAccounts;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_chat_accounts;',
            variables: [], readsFrom: {dbChatAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbChatAccount> findById(int id) {
    return customSelect('SELECT * FROM db_chat_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbChatAccounts}).map(dbChatAccounts.mapFromRow);
  }

  Selectable<DbChatAccount> findByChatRemoteId(String chatRemoteId) {
    return customSelect(
        'SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;',
        variables: [Variable.withString(chatRemoteId)],
        readsFrom: {dbChatAccounts}).map(dbChatAccounts.mapFromRow);
  }

  Selectable<DbChatAccount> findByChatRemoteIdAndAccountRemoteId(
      String chatRemoteId, String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId AND account_remote_id = :accountRemoteId;',
        variables: [
          Variable.withString(chatRemoteId),
          Variable.withString(accountRemoteId)
        ],
        readsFrom: {
          dbChatAccounts
        }).map(dbChatAccounts.mapFromRow);
  }

  Selectable<DbChatAccount> findByAccountRemoteId(String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_chat_accounts WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable.withString(accountRemoteId)],
        readsFrom: {dbChatAccounts}).map(dbChatAccounts.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_chat_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)], readsFrom: {dbChatAccounts})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_chat_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbChatAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByChatRemoteId(String chatRemoteId) {
    return customUpdate(
      'DELETE FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;',
      variables: [Variable.withString(chatRemoteId)],
      updates: {dbChatAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_chat_accounts',
      variables: [],
      updates: {dbChatAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbChatAccount> getAll() {
    return customSelect('SELECT * FROM db_chat_accounts',
        variables: [],
        readsFrom: {dbChatAccounts}).map(dbChatAccounts.mapFromRow);
  }
}
