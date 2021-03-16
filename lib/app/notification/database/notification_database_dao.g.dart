// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NotificationDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbNotificationsTable get dbNotifications => attachedDatabase.dbNotifications;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_notifications;',
            variables: [], readsFrom: {dbNotifications})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<int> countById(int? id) {
    return customSelect('SELECT COUNT(*) FROM db_notifications WHERE id = :id;',
            variables: [Variable<int?>(id)], readsFrom: {dbNotifications})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Selectable<DbNotification> oldest() {
    return customSelect(
        'SELECT * FROM db_notifications ORDER BY created_at ASC LIMIT 1;',
        variables: [],
        readsFrom: {dbNotifications}).map(dbNotifications.mapFromRow);
  }

  Future<int> deleteById(int? id) {
    return customUpdate(
      'DELETE FROM db_notifications WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbNotifications},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_notifications',
      variables: [],
      updates: {dbNotifications},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbNotification> getAll() {
    return customSelect('SELECT * FROM db_notifications',
        variables: [],
        readsFrom: {dbNotifications}).map(dbNotifications.mapFromRow);
  }

  Selectable<int?> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_notifications WHERE remote_id = :remoteId;',
        variables: [Variable<String>(remoteId)],
        readsFrom: {dbNotifications}).map((QueryRow row) => row.readInt('id'));
  }

  Future<int> deleteOlderThanDate(DateTime createdAt) {
    return customUpdate(
      'DELETE FROM db_notifications WHERE created_at < :createdAt',
      variables: [Variable<DateTime>(createdAt)],
      updates: {dbNotifications},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteOlderThanLocalId(int? id) {
    return customUpdate(
      'DELETE FROM db_notifications WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbNotifications},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbNotification> getNewestByLocalIdWithOffset(int offset) {
    return customSelect(
        'SELECT * FROM db_notifications ORDER BY id DESC LIMIT 1 OFFSET :offset',
        variables: [Variable<int>(offset)],
        readsFrom: {dbNotifications}).map(dbNotifications.mapFromRow);
  }
}
