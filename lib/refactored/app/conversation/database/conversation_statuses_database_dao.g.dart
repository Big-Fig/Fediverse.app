// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_statuses_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ConversationStatusesDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbConversationStatusesTable get dbConversationStatuses =>
      db.dbConversationStatuses;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_conversation_statuses;',
            variables: [], readsFrom: {dbConversationStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbConversationStatus _rowToDbConversationStatus(QueryRow row) {
    return DbConversationStatus(
      id: row.readInt('id'),
      conversationRemoteId: row.readString('conversation_remote_id'),
      statusRemoteId: row.readString('status_remote_id'),
    );
  }

  Selectable<DbConversationStatus> findByIdQuery(int id) {
    return customSelectQuery(
        'SELECT * FROM db_conversation_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbConversationStatuses}).map(_rowToDbConversationStatus);
  }

  Future<List<DbConversationStatus>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbConversationStatus>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbConversationStatus> findByConversationRemoteIdQuery(
      String conversationRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_conversation_statuses WHERE conversation_remote_id = :conversationRemoteId;',
        variables: [Variable.withString(conversationRemoteId)],
        readsFrom: {dbConversationStatuses}).map(_rowToDbConversationStatus);
  }

  Future<List<DbConversationStatus>> findByConversationRemoteId(
      String conversationRemoteId) {
    return findByConversationRemoteIdQuery(conversationRemoteId).get();
  }

  Stream<List<DbConversationStatus>> watchFindByConversationRemoteId(
      String conversationRemoteId) {
    return findByConversationRemoteIdQuery(conversationRemoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_conversation_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversationStatuses})
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
      'DELETE FROM db_conversation_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbConversationStatuses},
    );
  }

  Future<int> deleteByConversationRemoteId(String conversationRemoteId) {
    return customUpdate(
      'DELETE FROM db_conversation_statuses WHERE conversation_remote_id = :conversationRemoteId;',
      variables: [Variable.withString(conversationRemoteId)],
      updates: {dbConversationStatuses},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_conversation_statuses',
      variables: [],
      updates: {dbConversationStatuses},
    );
  }

  Selectable<DbConversationStatus> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_conversation_statuses',
        variables: [],
        readsFrom: {dbConversationStatuses}).map(_rowToDbConversationStatus);
  }

  Future<List<DbConversationStatus>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbConversationStatus>> watchGetAll() {
    return getAllQuery().watch();
  }
}
