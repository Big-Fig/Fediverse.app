// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NotificationDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbNotificationsTable get dbNotifications => db.dbNotifications;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_notifications;',
            variables: [], readsFrom: {dbNotifications})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_notifications WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbNotifications})
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
      'DELETE FROM db_notifications WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbNotifications},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_notifications',
      variables: [],
      updates: {dbNotifications},
    );
  }

  DbNotification _rowToDbNotification(QueryRow row) {
    return DbNotification(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      accountRemoteId: row.readString('account_remote_id'),
      statusRemoteId: row.readString('status_remote_id'),
      type: $DbNotificationsTable.$converter0.mapToDart(row.readString('type')),
      createdAt: row.readDateTime('created_at'),
    );
  }

  Selectable<DbNotification> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_notifications',
        variables: [], readsFrom: {dbNotifications}).map(_rowToDbNotification);
  }

  Future<List<DbNotification>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbNotification>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT id FROM db_notifications WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbNotifications}).map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
