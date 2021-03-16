// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_lists_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusListsTable get dbStatusLists => attachedDatabase.dbStatusLists;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_status_lists;',
            variables: [], readsFrom: {dbStatusLists})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbStatusList> findById(int? id) {
    return customSelect('SELECT * FROM db_status_lists WHERE id = :id;',
        variables: [Variable<int?>(id)],
        readsFrom: {dbStatusLists}).map(dbStatusLists.mapFromRow);
  }

  Selectable<int> countById(int? id) {
    return customSelect('SELECT COUNT(*) FROM db_status_lists WHERE id = :id;',
            variables: [Variable<int?>(id)], readsFrom: {dbStatusLists})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int? id) {
    return customUpdate(
      'DELETE FROM db_status_lists WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbStatusLists},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByRemoteId(String listRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_lists WHERE list_remote_id = :listRemoteId;',
      variables: [Variable<String>(listRemoteId)],
      updates: {dbStatusLists},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_lists',
      variables: [],
      updates: {dbStatusLists},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbStatusList> getAll() {
    return customSelect('SELECT * FROM db_status_lists',
        variables: [],
        readsFrom: {dbStatusLists}).map(dbStatusLists.mapFromRow);
  }

  Selectable<DbStatusList> findByListRemoteId(String listRemoteId) {
    return customSelect(
        'SELECT * FROM db_status_lists WHERE list_remote_id = :listRemoteId;',
        variables: [Variable<String>(listRemoteId)],
        readsFrom: {dbStatusLists}).map(dbStatusLists.mapFromRow);
  }
}
