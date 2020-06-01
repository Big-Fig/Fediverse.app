// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_timeline_statuses_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$HomeTimelineStatusesDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbHomeTimelineStatusesTable get dbHomeTimelineStatuses =>
      db.dbHomeTimelineStatuses;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_home_timeline_statuses;',
            variables: [], readsFrom: {dbHomeTimelineStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbHomeTimelineStatus _rowToDbHomeTimelineStatus(QueryRow row) {
    return DbHomeTimelineStatus(
      id: row.readInt('id'),
      statusRemoteId: row.readString('status_remote_id'),
    );
  }

  Selectable<DbHomeTimelineStatus> findByIdQuery(int id) {
    return customSelectQuery(
        'SELECT * FROM db_home_timeline_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbHomeTimelineStatuses}).map(_rowToDbHomeTimelineStatus);
  }

  Future<List<DbHomeTimelineStatus>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbHomeTimelineStatus>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_home_timeline_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbHomeTimelineStatuses})
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
      'DELETE FROM db_home_timeline_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbHomeTimelineStatuses},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_home_timeline_statuses',
      variables: [],
      updates: {dbHomeTimelineStatuses},
    );
  }

  Selectable<DbHomeTimelineStatus> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_home_timeline_statuses',
        variables: [],
        readsFrom: {dbHomeTimelineStatuses}).map(_rowToDbHomeTimelineStatus);
  }

  Future<List<DbHomeTimelineStatus>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbHomeTimelineStatus>> watchGetAll() {
    return getAllQuery().watch();
  }
}
