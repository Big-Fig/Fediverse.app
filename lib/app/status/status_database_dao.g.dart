// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbStatusesTable get dbStatuses => db.dbStatuses;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_statuses;',
        variables: [],
        readsFrom: {dbStatuses}).map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbStatus _rowToDbStatus(QueryRow row) {
    return DbStatus(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      createdAt: row.readDateTime('created_at'),
      inReplyToRemoteId: row.readString('in_reply_to_remote_id'),
      inReplyToAccountRemoteId: row.readString('in_reply_to_account_remote_id'),
      sensitive: row.readBool('sensitive'),
      spoilerText: row.readString('spoiler_text'),
      visibility:
          $DbStatusesTable.$converter0.mapToDart(row.readString('visibility')),
      uri: row.readString('uri'),
      url: row.readString('url'),
      repliesCount: row.readInt('replies_count'),
      reblogsCount: row.readInt('reblogs_count'),
      favouritesCount: row.readInt('favourites_count'),
      favourited: row.readBool('favourited'),
      reblogged: row.readBool('reblogged'),
      muted: row.readBool('muted'),
      bookmarked: row.readBool('bookmarked'),
      content: row.readString('content'),
      reblog: $DbStatusesTable.$converter1.mapToDart(row.readString('reblog')),
      application:
          $DbStatusesTable.$converter2.mapToDart(row.readString('application')),
      account:
          $DbStatusesTable.$converter3.mapToDart(row.readString('account')),
      mediaAttachments: $DbStatusesTable.$converter4
          .mapToDart(row.readString('media_attachments')),
      mentions:
          $DbStatusesTable.$converter5.mapToDart(row.readString('mentions')),
      tags: $DbStatusesTable.$converter6.mapToDart(row.readString('tags')),
      emojis: $DbStatusesTable.$converter7.mapToDart(row.readString('emojis')),
      poll: $DbStatusesTable.$converter8.mapToDart(row.readString('poll')),
      card: $DbStatusesTable.$converter9.mapToDart(row.readString('card')),
      language: row.readString('language'),
      pleromaContent: $DbStatusesTable.$converter10
          .mapToDart(row.readString('pleroma_content')),
      pleromaConversationId: row.readInt('pleroma_conversation_id'),
      pleromaDirectConversationId:
          row.readInt('pleroma_direct_conversation_id'),
      pleromaInReplyToAccountAcct:
          row.readString('pleroma_in_reply_to_account_acct'),
      pleromaLocal: row.readBool('pleroma_local'),
      pleromaSpoilerText: $DbStatusesTable.$converter11
          .mapToDart(row.readString('pleroma_spoiler_text')),
      pleromaExpiresAt: row.readDateTime('pleroma_expires_at'),
      pleromaThreadMuted: row.readBool('pleroma_thread_muted'),
      pleromaEmojiReactions: $DbStatusesTable.$converter12
          .mapToDart(row.readString('pleroma_emoji_reactions')),
    );
  }

  Selectable<DbStatus> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbStatuses}).map(_rowToDbStatus);
  }

  Future<List<DbStatus>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbStatus>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbStatus> findByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT * FROM db_statuses WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbStatuses}).map(_rowToDbStatus);
  }

  Future<List<DbStatus>> findByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).get();
  }

  Stream<List<DbStatus>> watchFindByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery('SELECT COUNT(*) FROM db_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbStatuses}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> countById(int id) {
    return countByIdQuery(id).get();
  }

  Stream<List<int>> watchCountById(int id) {
    return countByIdQuery(id).watch();
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbStatuses},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_statuses',
      variables: [],
      updates: {dbStatuses},
    );
  }

  Selectable<DbStatus> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_statuses',
        variables: [], readsFrom: {dbStatuses}).map(_rowToDbStatus);
  }

  Future<List<DbStatus>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbStatus>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT id FROM db_statuses WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbStatuses}).map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
