// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_reblogged_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusRebloggedAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusRebloggedAccountsTable get dbStatusRebloggedAccounts =>
      db.dbStatusRebloggedAccounts;
  Selectable<int> countAllQuery() {
    return customSelectQuery(
            'SELECT Count(*) FROM db_status_reblogged_accounts;',
            variables: [],
            readsFrom: {dbStatusRebloggedAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbStatusRebloggedAccount _rowToDbStatusRebloggedAccount(QueryRow row) {
    return DbStatusRebloggedAccount(
      id: row.readInt('id'),
      statusRemoteId: row.readString('status_remote_id'),
      accountRemoteId: row.readString('account_remote_id'),
    );
  }

  Selectable<DbStatusRebloggedAccount> findByIdQuery(int id) {
    return customSelectQuery(
            'SELECT * FROM db_status_reblogged_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusRebloggedAccounts})
        .map(_rowToDbStatusRebloggedAccount);
  }

  Future<List<DbStatusRebloggedAccount>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbStatusRebloggedAccount>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_status_reblogged_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusRebloggedAccounts})
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
      'DELETE FROM db_status_reblogged_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatusRebloggedAccounts},
    );
  }

  Future<int> deleteByStatusRemoteId(String statusRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_reblogged_accounts WHERE status_remote_id = :statusRemoteId;',
      variables: [Variable.withString(statusRemoteId)],
      updates: {dbStatusRebloggedAccounts},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_reblogged_accounts',
      variables: [],
      updates: {dbStatusRebloggedAccounts},
    );
  }

  Selectable<DbStatusRebloggedAccount> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_status_reblogged_accounts',
            variables: [], readsFrom: {dbStatusRebloggedAccounts})
        .map(_rowToDbStatusRebloggedAccount);
  }

  Future<List<DbStatusRebloggedAccount>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbStatusRebloggedAccount>> watchGetAll() {
    return getAllQuery().watch();
  }
}
