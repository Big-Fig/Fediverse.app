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

  Selectable<DbConversation> findById(int id) {
    return customSelect('SELECT * FROM db_conversations WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbConversations}).map(dbConversations.mapFromRow);
  }

  Selectable<DbConversation> findByRemoteId(String remoteId) {
    return customSelect(
        'SELECT * FROM db_conversations WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbConversations}).map(dbConversations.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_conversations WHERE id = :id;',
            variables: [Variable.withInt(id)], readsFrom: {dbConversations})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_conversations WHERE id = :id;',
      variables: [Variable.withInt(id)],
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

  Selectable<DbConversation> getAll() {
    return customSelect('SELECT * FROM db_conversations',
        variables: [],
        readsFrom: {dbConversations}).map(dbConversations.mapFromRow);
  }

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_conversations WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbConversations}).map((QueryRow row) => row.readInt('id'));
  }
}
