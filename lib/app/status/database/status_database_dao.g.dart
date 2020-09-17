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

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
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
}
