// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ConversationDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbConversationsTable get dbConversations => db.dbConversations;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_conversations;',
            variables: [], readsFrom: {dbConversations})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbConversation _rowToDbConversation(QueryRow row) {
    return DbConversation(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      unread: row.readBool('unread'),
    );
  }

  Selectable<DbConversation> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_conversations WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbConversations}).map(_rowToDbConversation);
  }

  Future<List<DbConversation>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbConversation>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbConversation> findByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT * FROM db_conversations WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbConversations}).map(_rowToDbConversation);
  }

  Future<List<DbConversation>> findByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).get();
  }

  Stream<List<DbConversation>> watchFindByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_conversations WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversations})
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
      'DELETE FROM db_conversations WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbConversations},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_conversations',
      variables: [],
      updates: {dbConversations},
    );
  }

  Selectable<DbConversation> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_conversations',
        variables: [], readsFrom: {dbConversations}).map(_rowToDbConversation);
  }

  Future<List<DbConversation>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbConversation>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT id FROM db_conversations WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbConversations}).map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
