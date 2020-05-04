// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_status_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ScheduledStatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbScheduledStatusesTable get dbScheduledStatuses => db.dbScheduledStatuses;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_scheduled_statuses;',
            variables: [], readsFrom: {dbScheduledStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbScheduledStatus _rowToDbScheduledStatus(QueryRow row) {
    return DbScheduledStatus(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      scheduledAt: row.readDateTime('scheduled_at'),
      params: $DbScheduledStatusesTable.$converter0
          .mapToDart(row.readString('params')),
      mediaAttachments: $DbScheduledStatusesTable.$converter1
          .mapToDart(row.readString('media_attachments')),
    );
  }

  Selectable<DbScheduledStatus> findByIdQuery(int id) {
    return customSelectQuery(
        'SELECT * FROM db_scheduled_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbScheduledStatuses}).map(_rowToDbScheduledStatus);
  }

  Future<List<DbScheduledStatus>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbScheduledStatus>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbScheduledStatus> findByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT * FROM db_scheduled_statuses WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbScheduledStatuses}).map(_rowToDbScheduledStatus);
  }

  Future<List<DbScheduledStatus>> findByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).get();
  }

  Stream<List<DbScheduledStatus>> watchFindByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_scheduled_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbScheduledStatuses})
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
      'DELETE FROM db_scheduled_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbScheduledStatuses},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_scheduled_statuses',
      variables: [],
      updates: {dbScheduledStatuses},
    );
  }

  Selectable<DbScheduledStatus> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_scheduled_statuses',
        variables: [],
        readsFrom: {dbScheduledStatuses}).map(_rowToDbScheduledStatus);
  }

  Future<List<DbScheduledStatus>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbScheduledStatus>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
            'SELECT id FROM db_scheduled_statuses WHERE remote_id = :remoteId;',
            variables: [Variable.withString(remoteId)],
            readsFrom: {dbScheduledStatuses})
        .map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
