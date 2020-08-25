// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_favourited_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusFavouritedAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusFavouritedAccountsTable get dbStatusFavouritedAccounts =>
      db.dbStatusFavouritedAccounts;
  Selectable<int> countAllQuery() {
    return customSelectQuery(
            'SELECT Count(*) FROM db_status_favourited_accounts;',
            variables: [],
            readsFrom: {dbStatusFavouritedAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbStatusFavouritedAccount _rowToDbStatusFavouritedAccount(QueryRow row) {
    return DbStatusFavouritedAccount(
      id: row.readInt('id'),
      statusRemoteId: row.readString('status_remote_id'),
      accountRemoteId: row.readString('account_remote_id'),
    );
  }

  Selectable<DbStatusFavouritedAccount> findByIdQuery(int id) {
    return customSelectQuery(
            'SELECT * FROM db_status_favourited_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusFavouritedAccounts})
        .map(_rowToDbStatusFavouritedAccount);
  }

  Future<List<DbStatusFavouritedAccount>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbStatusFavouritedAccount>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
        'SELECT COUNT(*) FROM db_status_favourited_accounts WHERE id = :id;',
        variables: [
          Variable.withInt(id)
        ],
        readsFrom: {
          dbStatusFavouritedAccounts
        }).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> countById(int id) {
    return countByIdQuery(id).get();
  }

  Stream<List<int>> watchCountById(int id) {
    return countByIdQuery(id).watch();
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_status_favourited_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatusFavouritedAccounts},
    );
  }

  Future<int> deleteByStatusRemoteId(String statusRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_favourited_accounts WHERE status_remote_id = :statusRemoteId;',
      variables: [Variable.withString(statusRemoteId)],
      updates: {dbStatusFavouritedAccounts},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_favourited_accounts',
      variables: [],
      updates: {dbStatusFavouritedAccounts},
    );
  }

  Selectable<DbStatusFavouritedAccount> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_status_favourited_accounts',
            variables: [], readsFrom: {dbStatusFavouritedAccounts})
        .map(_rowToDbStatusFavouritedAccount);
  }

  Future<List<DbStatusFavouritedAccount>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbStatusFavouritedAccount>> watchGetAll() {
    return getAllQuery().watch();
  }
}
