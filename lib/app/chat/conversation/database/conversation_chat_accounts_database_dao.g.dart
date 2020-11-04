// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_chat_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ConversationAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbConversationAccountsTable get dbConversationAccounts =>
      attachedDatabase.dbConversationAccounts;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_conversation_accounts;',
            variables: [], readsFrom: {dbConversationAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbConversationAccount> findById(int id) {
    return customSelect(
            'SELECT * FROM db_conversation_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversationAccounts})
        .map(dbConversationAccounts.mapFromRow);
  }

  Selectable<DbConversationAccount> findByConversationRemoteId(
      String conversationRemoteId) {
    return customSelect(
        'SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId;',
        variables: [
          Variable.withString(conversationRemoteId)
        ],
        readsFrom: {
          dbConversationAccounts
        }).map(dbConversationAccounts.mapFromRow);
  }

  Selectable<DbConversationAccount>
      findByConversationRemoteIdAndAccountRemoteId(
          String conversationRemoteId, String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId AND account_remote_id = :accountRemoteId;',
        variables: [
          Variable.withString(conversationRemoteId),
          Variable.withString(accountRemoteId)
        ],
        readsFrom: {
          dbConversationAccounts
        }).map(dbConversationAccounts.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_conversation_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversationAccounts})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_conversation_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbConversationAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByConversationRemoteId(String conversationRemoteId) {
    return customUpdate(
      'DELETE FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId;',
      variables: [Variable.withString(conversationRemoteId)],
      updates: {dbConversationAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_conversation_accounts',
      variables: [],
      updates: {dbConversationAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbConversationAccount> getAll() {
    return customSelect('SELECT * FROM db_conversation_accounts',
            variables: [], readsFrom: {dbConversationAccounts})
        .map(dbConversationAccounts.mapFromRow);
  }
}
