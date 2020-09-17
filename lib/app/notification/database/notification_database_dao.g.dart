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

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_notifications WHERE id = :id;',
            variables: [Variable.withInt(id)], readsFrom: {dbNotifications})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Selectable<int> countUnreadAll() {
    return customSelect(
        'SELECT COUNT(*) FROM db_notifications WHERE unread = 1 AND dismissed;',
        variables: [],
        readsFrom: {
          dbNotifications
        }).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Selectable<int> countUnreadAllNotDismissed() {
    return customSelect(
        'SELECT COUNT(*) FROM db_notifications WHERE unread = 1 AND dismissed IS NULL;',
        variables: [],
        readsFrom: {
          dbNotifications
        }).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Selectable<int> countUnreadByType(String type) {
    return customSelect(
        'SELECT COUNT(*) FROM db_notifications WHERE unread = 1 AND type = :type;',
        variables: [
          Variable.withString(type)
        ],
        readsFrom: {
          dbNotifications
        }).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Selectable<int> countUnreadByTypeNotDismissed(String type) {
    return customSelect(
        'SELECT COUNT(*) FROM db_notifications WHERE unread = 1 AND type = :type AND dismissed IS NULL;',
        variables: [
          Variable.withString(type)
        ],
        readsFrom: {
          dbNotifications
        }).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_notifications WHERE id = :id;',
      variables: [Variable.withInt(id)],
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

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_notifications WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbNotifications}).map((QueryRow row) => row.readInt('id'));
  }
}
