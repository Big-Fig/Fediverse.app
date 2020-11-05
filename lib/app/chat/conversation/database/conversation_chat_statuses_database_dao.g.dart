// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_chat_statuses_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ConversationStatusesDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbConversationStatusesTable get dbConversationStatuses =>
      attachedDatabase.dbConversationStatuses;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_conversation_statuses;',
            variables: [], readsFrom: {dbConversationStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbConversationStatus> findById(int id) {
    return customSelect(
            'SELECT * FROM db_conversation_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversationStatuses})
        .map(dbConversationStatuses.mapFromRow);
  }

  Selectable<DbConversationStatus> findByConversationRemoteId(
      String conversationRemoteId) {
    return customSelect(
        'SELECT * FROM db_conversation_statuses WHERE conversation_remote_id = :conversationRemoteId;',
        variables: [
          Variable.withString(conversationRemoteId)
        ],
        readsFrom: {
          dbConversationStatuses
        }).map(dbConversationStatuses.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_conversation_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbConversationStatuses})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_conversation_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbConversationStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByConversationRemoteId(String conversationRemoteId) {
    return customUpdate(
      'DELETE FROM db_conversation_statuses WHERE conversation_remote_id = :conversationRemoteId;',
      variables: [Variable.withString(conversationRemoteId)],
      updates: {dbConversationStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_conversation_statuses',
      variables: [],
      updates: {dbConversationStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbConversationStatus> getAll() {
    return customSelect('SELECT * FROM db_conversation_statuses',
            variables: [], readsFrom: {dbConversationStatuses})
        .map(dbConversationStatuses.mapFromRow);
  }
}