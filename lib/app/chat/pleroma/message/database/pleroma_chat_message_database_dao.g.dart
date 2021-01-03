// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_chat_message_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatMessageDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbChatMessagesTable get dbChatMessages => attachedDatabase.dbChatMessages;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_chat_messages;',
            variables: [], readsFrom: {dbChatMessages})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_chat_messages WHERE id = :id;',
            variables: [Variable.withInt(id)], readsFrom: {dbChatMessages})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_chat_messages WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbChatMessages},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_chat_messages',
      variables: [],
      updates: {dbChatMessages},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbChatMessage> getAll() {
    return customSelect('SELECT * FROM db_chat_messages',
        variables: [],
        readsFrom: {dbChatMessages}).map(dbChatMessages.mapFromRow);
  }

  Selectable<DbChatMessage> oldest() {
    return customSelect(
        'SELECT * FROM db_chat_messages ORDER BY created_at ASC LIMIT 1;',
        variables: [],
        readsFrom: {dbChatMessages}).map(dbChatMessages.mapFromRow);
  }

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_chat_messages WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbChatMessages}).map((QueryRow row) => row.readInt('id'));
  }

  Future<int> deleteOlderThanDate(DateTime createdAt) {
    return customUpdate(
      'DELETE FROM db_chat_messages WHERE created_at < :createdAt',
      variables: [Variable.withDateTime(createdAt)],
      updates: {dbChatMessages},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteOlderThanLocalId(int localId) {
    return customUpdate(
      'DELETE FROM db_chat_messages WHERE id = :localId;',
      variables: [Variable.withInt(localId)],
      updates: {dbChatMessages},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbChatMessage> getNewestByLocalIdWithOffset(int limit) {
    return customSelect(
        'SELECT * FROM db_chat_messages ORDER BY id DESC LIMIT :limit',
        variables: [Variable.withInt(limit)],
        readsFrom: {dbChatMessages}).map(dbChatMessages.mapFromRow);
  }
}
