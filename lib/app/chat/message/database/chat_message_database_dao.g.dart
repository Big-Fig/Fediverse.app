// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatMessageDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbChatMessagesTable get dbChatMessages => db.dbChatMessages;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_chat_messages;',
            variables: [], readsFrom: {dbChatMessages})
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
            'SELECT COUNT(*) FROM db_chat_messages WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbChatMessages})
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
      'DELETE FROM db_chat_messages WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbChatMessages},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_chat_messages',
      variables: [],
      updates: {dbChatMessages},
    );
  }

  DbChatMessage _rowToDbChatMessage(QueryRow row) {
    return DbChatMessage(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      chatRemoteId: row.readString('chat_remote_id'),
      accountRemoteId: row.readString('account_remote_id'),
      content: row.readString('content'),
      createdAt: row.readDateTime('created_at'),
      emojis:
          $DbChatMessagesTable.$converter0.mapToDart(row.readString('emojis')),
      mediaAttachment: $DbChatMessagesTable.$converter1
          .mapToDart(row.readString('media_attachment')),
      card: $DbChatMessagesTable.$converter2.mapToDart(row.readString('card')),
    );
  }

  Selectable<DbChatMessage> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_chat_messages',
        variables: [], readsFrom: {dbChatMessages}).map(_rowToDbChatMessage);
  }

  Future<List<DbChatMessage>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbChatMessage>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT id FROM db_chat_messages WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbChatMessages}).map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
