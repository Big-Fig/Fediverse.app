// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbAccountsTable get dbAccounts => attachedDatabase.dbAccounts;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_accounts;',
        variables: [],
        readsFrom: {dbAccounts}).map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbAccount> findById(int id) {
    return customSelect('SELECT * FROM db_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccounts}).map(dbAccounts.mapFromRow);
  }

  Selectable<DbAccount> findByRemoteId(String remoteId) {
    return customSelect(
        'SELECT * FROM db_accounts WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbAccounts}).map(dbAccounts.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccounts}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_accounts',
      variables: [],
      updates: {dbAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbAccount> getAll() {
    return customSelect('SELECT * FROM db_accounts',
        variables: [], readsFrom: {dbAccounts}).map(dbAccounts.mapFromRow);
  }

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_accounts WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbAccounts}).map((QueryRow row) => row.readInt('id'));
  }
}
