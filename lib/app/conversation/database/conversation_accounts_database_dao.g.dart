// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ConversationAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbConversationAccountsTable get dbConversationAccounts =>
      db.dbConversationAccounts;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_conversation_accounts;',
            variables: [], readsFrom: {dbConversationAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbConversationAccount _rowToDbConversationAccount(QueryRow row) {
    return DbConversationAccount(
      id: row.readInt('id'),
      conversationRemoteId: row.readString('conversation_remote_id'),
      accountRemoteId: row.readString('account_remote_id'),
    );
  }

  Selectable<DbConversationAccount> findByIdQuery(int id) {
    return customSelectQuery(
        'SELECT * FROM db_conversation_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbConversationAccounts}).map(_rowToDbConversationAccount);
  }

  Future<List<DbConversationAccount>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbConversationAccount>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbConversationAccount> findByConversationRemoteIdQuery(
      String conversationRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId;',
        variables: [Variable.withString(conversationRemoteId)],
        readsFrom: {dbConversationAccounts}).map(_rowToDbConversationAccount);
  }

  Future<List<DbConversationAccount>> findByConversationRemoteId(
      String conversationRemoteId) {
    return findByConversationRemoteIdQuery(conversationRemoteId).get();
  }

  Stream<List<DbConversationAccount>> watchFindByConversationRemoteId(
      String conversationRemoteId) {
    return findByConversationRemoteIdQuery(conversationRemoteId).watch();
  }

  Selectable<DbConversationAccount>
      findByConversationRemoteIdAndAccountRemoteIdQuery(
          String conversationRemoteId, String accountRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId AND account_remote_id = :accountRemoteId;',
        variables: [
          Variable.withString(conversationRemoteId),
          Variable.withString(accountRemoteId)
        ],
        readsFrom: {
          dbConversationAccounts
        }).map(_rowToDbConversationAccount);
  }

  Future<List<DbConversationAccount>>
      findByConversationRemoteIdAndAccountRemoteId(
          String conversationRemoteId, String accountRemoteId) {
    return findByConversationRemoteIdAndAccountRemoteIdQuery(
            conversationRemoteId, accountRemoteId)
        .get();
  }

  Stream<List<DbConversationAccount>>
      watchFindByConversationRemoteIdAndAccountRemoteId(
          String conversationRemoteId, String accountRemoteId) {
    return findByConversationRemoteIdAndAccountRemoteIdQuery(
            conversationRemoteId, accountRemoteId)
        .watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_conversation_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversationAccounts})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> countById(int id) {
    return countByIdQuery(id).get();
  }

  Stream<List<int>> watchCountById(int id) {
    return countByIdQuery(id).watch();
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_conversation_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbConversationAccounts},
    );
  }

  Future<int> deleteByConversationRemoteId(String conversationRemoteId) {
    return customUpdate(
      'DELETE FROM db_conversation_accounts WHERE conversation_remote_id = :conversationRemoteId;',
      variables: [Variable.withString(conversationRemoteId)],
      updates: {dbConversationAccounts},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_conversation_accounts',
      variables: [],
      updates: {dbConversationAccounts},
    );
  }

  Selectable<DbConversationAccount> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_conversation_accounts',
        variables: [],
        readsFrom: {dbConversationAccounts}).map(_rowToDbConversationAccount);
  }

  Future<List<DbConversationAccount>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbConversationAccount>> watchGetAll() {
    return getAllQuery().watch();
  }
}
