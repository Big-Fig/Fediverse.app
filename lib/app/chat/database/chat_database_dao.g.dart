// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbChatsTable get dbChats => db.dbChats;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_chats;',
        variables: [],
        readsFrom: {dbChats}).map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery('SELECT COUNT(*) FROM db_chats WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbChats}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> countById(int id) {
    return countByIdQuery(id).get();
  }

  Stream<List<int>> watchCountById(int id) {
    return countByIdQuery(id).watch();
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_chats WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbChats},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_chats',
      variables: [],
      updates: {dbChats},
    );
  }

  DbChat _rowToDbChat(QueryRow row) {
    return DbChat(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      unread: row.readInt('unread'),
      updatedAt: row.readDateTime('updated_at'),
      accountRemoteId: row.readString('account_remote_id'),
    );
  }

  Selectable<DbChat> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_chats',
        variables: [], readsFrom: {dbChats}).map(_rowToDbChat);
  }

  Future<List<DbChat>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbChat>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT id FROM db_chats WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbChats}).map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
