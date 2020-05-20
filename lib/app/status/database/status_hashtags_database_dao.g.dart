// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_hashtags_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusHashtagsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusHashtagsTable get dbStatusHashtags => db.dbStatusHashtags;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_status_hashtags;',
            variables: [], readsFrom: {dbStatusHashtags})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbStatusHashtag _rowToDbStatusHashtag(QueryRow row) {
    return DbStatusHashtag(
      id: row.readInt('id'),
      statusRemoteId: row.readString('status_remote_id'),
      hashtag: row.readString('hashtag'),
    );
  }

  Selectable<DbStatusHashtag> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_status_hashtags WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbStatusHashtags}).map(_rowToDbStatusHashtag);
  }

  Future<List<DbStatusHashtag>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbStatusHashtag>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_status_hashtags WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbStatusHashtags})
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
      'DELETE FROM db_status_hashtags WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatusHashtags},
    );
  }

  Future<int> deleteByStatusRemoteId(String statusRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_hashtags WHERE status_remote_id = :statusRemoteId;',
      variables: [Variable.withString(statusRemoteId)],
      updates: {dbStatusHashtags},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_hashtags',
      variables: [],
      updates: {dbStatusHashtags},
    );
  }

  Selectable<DbStatusHashtag> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_status_hashtags',
        variables: [],
        readsFrom: {dbStatusHashtags}).map(_rowToDbStatusHashtag);
  }

  Future<List<DbStatusHashtag>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbStatusHashtag>> watchGetAll() {
    return getAllQuery().watch();
  }
}
