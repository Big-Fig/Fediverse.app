// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_chat_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ConversationDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbConversationsTable get dbConversations => attachedDatabase.dbConversations;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_conversations;',
            variables: [], readsFrom: {dbConversations})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbConversation> oldest() {
    return customSelect(
        'SELECT * FROM db_conversations ORDER BY updated_at ASC LIMIT 1;',
        variables: [],
        readsFrom: {dbConversations}).map(dbConversations.mapFromRow);
  }

  Selectable<int> countById(int? id) {
    return customSelect('SELECT COUNT(*) FROM db_conversations WHERE id = :id;',
            variables: [Variable<int?>(id)], readsFrom: {dbConversations})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int? id) {
    return customUpdate(
      'DELETE FROM db_conversations WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbConversations},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByRemoteId(String remoteId) {
    return customUpdate(
      'DELETE FROM db_conversations WHERE remote_id = :remoteId;',
      variables: [Variable<String>(remoteId)],
      updates: {dbConversations},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_conversations',
      variables: [],
      updates: {dbConversations},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<int?> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_conversations WHERE remote_id = :remoteId;',
        variables: [Variable<String>(remoteId)],
        readsFrom: {dbConversations}).map((QueryRow row) => row.readInt('id'));
  }
}
