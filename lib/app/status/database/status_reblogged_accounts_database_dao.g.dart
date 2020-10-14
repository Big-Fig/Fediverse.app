// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_reblogged_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusRebloggedAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusRebloggedAccountsTable get dbStatusRebloggedAccounts =>
      attachedDatabase.dbStatusRebloggedAccounts;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_status_reblogged_accounts;',
            variables: [], readsFrom: {dbStatusRebloggedAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbStatusRebloggedAccount> findById(int id) {
    return customSelect(
            'SELECT * FROM db_status_reblogged_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusRebloggedAccounts})
        .map(dbStatusRebloggedAccounts.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_status_reblogged_accounts WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusRebloggedAccounts})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_status_reblogged_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatusRebloggedAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByStatusRemoteId(String statusRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_reblogged_accounts WHERE status_remote_id = :statusRemoteId;',
      variables: [Variable.withString(statusRemoteId)],
      updates: {dbStatusRebloggedAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_reblogged_accounts',
      variables: [],
      updates: {dbStatusRebloggedAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbStatusRebloggedAccount> getAll() {
    return customSelect('SELECT * FROM db_status_reblogged_accounts',
            variables: [], readsFrom: {dbStatusRebloggedAccounts})
        .map(dbStatusRebloggedAccounts.mapFromRow);
  }
}
