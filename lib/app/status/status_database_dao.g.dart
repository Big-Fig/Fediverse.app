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
      visibility: row.readString('visibility'),
      uri: row.readString('uri'),
      url: row.readString('url'),
      repliesCount: row.readInt('replies_count'),
      reblogsCount: row.readInt('reblogs_count'),
      favouritesCount: row.readInt('favourites_count'),
      favourited: row.readBool('favourited'),
      reblogged: row.readBool('reblogged'),
      muted: row.readBool('muted'),
      bookmarked: row.readBool('bookmarked'),
      pinned: row.readBool('pinned'),
      content: row.readString('content'),
      reblogLocalId: row.readInt('reblog_local_id'),
      application: row.readString('application'),
      account: row.readString('account'),
      mediaAttachments: row.readString('media_attachments'),
      mentions: row.readString('mentions'),
      tags: row.readString('tags'),
      emojis: row.readString('emojis'),
      poll: row.readString('poll'),
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
