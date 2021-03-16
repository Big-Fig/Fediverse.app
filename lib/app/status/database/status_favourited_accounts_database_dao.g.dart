// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_favourited_accounts_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusFavouritedAccountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusFavouritedAccountsTable get dbStatusFavouritedAccounts =>
      attachedDatabase.dbStatusFavouritedAccounts;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_status_favourited_accounts;',
            variables: [], readsFrom: {dbStatusFavouritedAccounts})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbStatusFavouritedAccount> findById(int? id) {
    return customSelect(
            'SELECT * FROM db_status_favourited_accounts WHERE id = :id;',
            variables: [Variable<int?>(id)],
            readsFrom: {dbStatusFavouritedAccounts})
        .map(dbStatusFavouritedAccounts.mapFromRow);
  }

  Selectable<int> countById(int? id) {
    return customSelect(
        'SELECT COUNT(*) FROM db_status_favourited_accounts WHERE id = :id;',
        variables: [
          Variable<int?>(id)
        ],
        readsFrom: {
          dbStatusFavouritedAccounts
        }).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int? id) {
    return customUpdate(
      'DELETE FROM db_status_favourited_accounts WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbStatusFavouritedAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByStatusRemoteId(String statusRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_favourited_accounts WHERE status_remote_id = :statusRemoteId;',
      variables: [Variable<String>(statusRemoteId)],
      updates: {dbStatusFavouritedAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_favourited_accounts',
      variables: [],
      updates: {dbStatusFavouritedAccounts},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbStatusFavouritedAccount> getAll() {
    return customSelect('SELECT * FROM db_status_favourited_accounts',
            variables: [], readsFrom: {dbStatusFavouritedAccounts})
        .map(dbStatusFavouritedAccounts.mapFromRow);
  }
}
