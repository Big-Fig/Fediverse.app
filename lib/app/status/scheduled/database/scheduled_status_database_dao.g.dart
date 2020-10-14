// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_status_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ScheduledStatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbScheduledStatusesTable get dbScheduledStatuses =>
      attachedDatabase.dbScheduledStatuses;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_scheduled_statuses;',
            variables: [], readsFrom: {dbScheduledStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbScheduledStatus> findById(int id) {
    return customSelect('SELECT * FROM db_scheduled_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbScheduledStatuses}).map(dbScheduledStatuses.mapFromRow);
  }

  Selectable<DbScheduledStatus> findByRemoteId(String remoteId) {
    return customSelect(
        'SELECT * FROM db_scheduled_statuses WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbScheduledStatuses}).map(dbScheduledStatuses.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_scheduled_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbScheduledStatuses})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_scheduled_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbScheduledStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_scheduled_statuses',
      variables: [],
      updates: {dbScheduledStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbScheduledStatus> getAll() {
    return customSelect('SELECT * FROM db_scheduled_statuses',
        variables: [],
        readsFrom: {dbScheduledStatuses}).map(dbScheduledStatuses.mapFromRow);
  }

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
            'SELECT id FROM db_scheduled_statuses WHERE remote_id = :remoteId;',
            variables: [Variable.withString(remoteId)],
            readsFrom: {dbScheduledStatuses})
        .map((QueryRow row) => row.readInt('id'));
  }
}
