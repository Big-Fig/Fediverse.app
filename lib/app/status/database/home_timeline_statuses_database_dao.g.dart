// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_timeline_statuses_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$HomeTimelineStatusesDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbHomeTimelineStatusesTable get dbHomeTimelineStatuses =>
      attachedDatabase.dbHomeTimelineStatuses;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_home_timeline_statuses;',
            variables: [], readsFrom: {dbHomeTimelineStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbHomeTimelineStatus> findById(int id) {
    return customSelect(
            'SELECT * FROM db_home_timeline_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbHomeTimelineStatuses})
        .map(dbHomeTimelineStatuses.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_home_timeline_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbHomeTimelineStatuses})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_home_timeline_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbHomeTimelineStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_home_timeline_statuses WHERE account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbHomeTimelineStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_home_timeline_statuses',
      variables: [],
      updates: {dbHomeTimelineStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbHomeTimelineStatus> getAll() {
    return customSelect('SELECT * FROM db_home_timeline_statuses',
            variables: [], readsFrom: {dbHomeTimelineStatuses})
        .map(dbHomeTimelineStatuses.mapFromRow);
  }
}
