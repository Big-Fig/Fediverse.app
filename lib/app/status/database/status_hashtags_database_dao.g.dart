// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_hashtags_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusHashtagsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusHashtagsTable get dbStatusHashtags =>
      attachedDatabase.dbStatusHashtags;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_status_hashtags;',
            variables: [], readsFrom: {dbStatusHashtags})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbStatusHashtag> findById(int? id) {
    return customSelect('SELECT * FROM db_status_hashtags WHERE id = :id;',
        variables: [Variable<int?>(id)],
        readsFrom: {dbStatusHashtags}).map(dbStatusHashtags.mapFromRow);
  }

  Selectable<int> countById(int? id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_status_hashtags WHERE id = :id;',
            variables: [Variable<int?>(id)],
            readsFrom: {dbStatusHashtags})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int? id) {
    return customUpdate(
      'DELETE FROM db_status_hashtags WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbStatusHashtags},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByStatusRemoteId(String statusRemoteId) {
    return customUpdate(
      'DELETE FROM db_status_hashtags WHERE status_remote_id = :statusRemoteId;',
      variables: [Variable<String>(statusRemoteId)],
      updates: {dbStatusHashtags},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_status_hashtags',
      variables: [],
      updates: {dbStatusHashtags},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbStatusHashtag> getAll() {
    return customSelect('SELECT * FROM db_status_hashtags',
        variables: [],
        readsFrom: {dbStatusHashtags}).map(dbStatusHashtags.mapFromRow);
  }
}
