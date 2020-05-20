// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbChatAccountsTable get dbChatAccounts => db.dbChatAccounts;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_chat_accounts;',
            variables: [], readsFrom: {dbChatAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbChatAccount _rowToDbChatAccount(QueryRow row) {
    return DbChatAccount(
      id: row.readInt('id'),
      chatRemoteId: row.readString('chat_remote_id'),
      accountRemoteId: row.readString('account_remote_id'),
    );
  }

  Selectable<DbChatAccount> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_chat_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbChatAccounts}).map(_rowToDbChatAccount);
  }

  Future<List<DbChatAccount>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbChatAccount>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbChatAccount> findByChatRemoteIdQuery(String chatRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;',
        variables: [Variable.withString(chatRemoteId)],
        readsFrom: {dbChatAccounts}).map(_rowToDbChatAccount);
  }

  Future<List<DbChatAccount>> findByChatRemoteId(String chatRemoteId) {
    return findByChatRemoteIdQuery(chatRemoteId).get();
  }

  Stream<List<DbChatAccount>> watchFindByChatRemoteId(String chatRemoteId) {
    return findByChatRemoteIdQuery(chatRemoteId).watch();
  }

  Selectable<DbChatAccount> findByChatRemoteIdAndAccountRemoteIdQuery(
      String chatRemoteId, String accountRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId AND account_remote_id = :accountRemoteId;',
        variables: [
          Variable.withString(chatRemoteId),
          Variable.withString(accountRemoteId)
        ],
        readsFrom: {
          dbChatAccounts
        }).map(_rowToDbChatAccount);
  }

  Future<List<DbChatAccount>> findByChatRemoteIdAndAccountRemoteId(
      String chatRemoteId, String accountRemoteId) {
    return findByChatRemoteIdAndAccountRemoteIdQuery(
            chatRemoteId, accountRemoteId)
        .get();
  }

  Stream<List<DbChatAccount>> watchFindByChatRemoteIdAndAccountRemoteId(
      String chatRemoteId, String accountRemoteId) {
    return findByChatRemoteIdAndAccountRemoteIdQuery(
            chatRemoteId, accountRemoteId)
        .watch();
  }

  Selectable<DbChatAccount> findByAccountRemoteIdQuery(String accountRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_chat_accounts WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable.withString(accountRemoteId)],
        readsFrom: {dbChatAccounts}).map(_rowToDbChatAccount);
  }

  Future<List<DbChatAccount>> findByAccountRemoteId(String accountRemoteId) {
    return findByAccountRemoteIdQuery(accountRemoteId).get();
  }

  Stream<List<DbChatAccount>> watchFindByAccountRemoteId(
      String accountRemoteId) {
    return findByAccountRemoteIdQuery(accountRemoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_chat_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbChatAccounts})
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
      'DELETE FROM db_chat_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbChatAccounts},
    );
  }

  Future<int> deleteByChatRemoteId(String chatRemoteId) {
    return customUpdate(
      'DELETE FROM db_chat_accounts WHERE chat_remote_id = :chatRemoteId;',
      variables: [Variable.withString(chatRemoteId)],
      updates: {dbChatAccounts},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_chat_accounts',
      variables: [],
      updates: {dbChatAccounts},
    );
  }

  Selectable<DbChatAccount> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_chat_accounts',
        variables: [], readsFrom: {dbChatAccounts}).map(_rowToDbChatAccount);
  }

  Future<List<DbChatAccount>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbChatAccount>> watchGetAll() {
    return getAllQuery().watch();
  }
}
