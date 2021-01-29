// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusesTable get dbStatuses => attachedDatabase.dbStatuses;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_statuses;',
        variables: [],
        readsFrom: {dbStatuses}).map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbStatuses}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Selectable<DbStatus> oldest() {
    return customSelect(
        'SELECT * FROM db_statuses ORDER BY created_at ASC LIMIT 1;',
        variables: [],
        readsFrom: {dbStatuses}).map(dbStatuses.mapFromRow);
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByRemoteId(String remoteId) {
    return customUpdate(
      'DELETE FROM db_statuses WHERE remote_id = :remoteId;',
      variables: [Variable.withString(remoteId)],
      updates: {dbStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_statuses',
      variables: [],
      updates: {dbStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbStatus> getAll() {
    return customSelect('SELECT * FROM db_statuses',
        variables: [], readsFrom: {dbStatuses}).map(dbStatuses.mapFromRow);
  }

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_statuses WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbStatuses}).map((QueryRow row) => row.readInt('id'));
  }

  Future<int> deleteOlderThanDate(DateTime createdAt) {
    return customUpdate(
      'DELETE FROM db_statuses WHERE created_at < :createdAt',
      variables: [Variable.withDateTime(createdAt)],
      updates: {dbStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteOlderThanLocalId(int localId) {
    return customUpdate(
      'DELETE FROM db_statuses WHERE id = :localId;',
      variables: [Variable.withInt(localId)],
      updates: {dbStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbStatus> getNewestByLocalIdWithOffset(int offset) {
    return customSelect(
        'SELECT * FROM db_statuses ORDER BY id DESC LIMIT 1 OFFSET :offset',
        variables: [Variable.withInt(offset)],
        readsFrom: {dbStatuses}).map(dbStatuses.mapFromRow);
  }
}
