// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_lists_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusListsTable get dbStatusLists => db.dbStatusLists;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_status_lists;',
            variables: [], readsFrom: {dbStatusLists})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbStatusList _rowToDbStatusList(QueryRow row) {
    return DbStatusList(
      id: row.readInt('id'),
      statusRemoteId: row.readString('status_remote_id'),
      listRemoteId: row.readString('list_remote_id'),
    );
  }

  Selectable<DbStatusList> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_status_lists WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbStatusLists}).map(_rowToDbStatusList);
  }

  Future<List<DbStatusList>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbStatusList>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_status_lists WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusLists})
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
      'DELETE FROM db_status_lists WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatusLists},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_lists',
      variables: [],
      updates: {dbStatusLists},
    );
  }

  Selectable<DbStatusList> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_status_lists',
        variables: [], readsFrom: {dbStatusLists}).map(_rowToDbStatusList);
  }

  Future<List<DbStatusList>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbStatusList>> watchGetAll() {
    return getAllQuery().watch();
  }
}
