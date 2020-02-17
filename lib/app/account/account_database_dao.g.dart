// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbAccountsTable get dbAccounts => db.dbAccounts;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_accounts;',
        variables: [],
        readsFrom: {dbAccounts}).map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbAccount _rowToDbAccount(QueryRow row) {
    return DbAccount(
      id: row.readInt('id'),
      remoteId: row.readString('remote_id'),
      username: row.readString('username'),
      url: row.readString('url'),
      note: row.readString('note'),
      locked: row.readBool('locked'),
      headerStatic: row.readString('header_static'),
      header: row.readString('header'),
      followingCount: row.readInt('following_count'),
      followersCount: row.readInt('followers_count'),
      statusesCount: row.readInt('statuses_count'),
      displayName: row.readString('display_name'),
      createdAt: row.readDateTime('created_at'),
      bot: row.readBool('bot'),
      avatarStatic: row.readString('avatar_static'),
      avatar: row.readString('avatar'),
      acct: row.readString('acct'),
      lastStatusAt: row.readDateTime('last_status_at'),
      fields: $DbAccountsTable.$converter0.mapToDart(row.readString('fields')),
      emojis: $DbAccountsTable.$converter1.mapToDart(row.readString('emojis')),
      source: $DbAccountsTable.$converter2.mapToDart(row.readString('source')),
      pleromaTags: $DbAccountsTable.$converter3
          .mapToDart(row.readString('pleroma_tags')),
      pleromaRelationship: $DbAccountsTable.$converter4
          .mapToDart(row.readString('pleroma_relationship')),
      pleromaIsAdmin: row.readBool('pleroma_is_admin'),
      pleromaIsModerator: row.readBool('pleroma_is_moderator'),
      pleromaConfirmationPending: row.readBool('pleroma_confirmation_pending'),
      pleromaHideFavorites: row.readBool('pleroma_hide_favorites'),
      pleromaHideFollowers: row.readBool('pleroma_hide_followers'),
      pleromaHideFollows: row.readBool('pleroma_hide_follows'),
      pleromaHideFollowersCount: row.readBool('pleroma_hide_followers_count'),
      pleromaHideFollowsCount: row.readBool('pleroma_hide_follows_count'),
      pleromaChatToken: row.readString('pleroma_chat_token'),
      pleromaDeactivated: row.readBool('pleroma_deactivated'),
      pleromaAllowFollowingMove: row.readBool('pleroma_allow_following_move'),
      pleromaUnreadConversationCount:
          row.readInt('pleroma_unread_conversation_count'),
      pleromaSkipThreadContainment:
          row.readBool('pleroma_skip_thread_containment'),
      pleromaNotificationSettings: $DbAccountsTable.$converter5
          .mapToDart(row.readString('pleroma_notification_settings')),
    );
  }

  Selectable<DbAccount> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccounts}).map(_rowToDbAccount);
  }

  Future<List<DbAccount>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbAccount>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbAccount> findByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT * FROM db_accounts WHERE remote_id LIKE :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbAccounts}).map(_rowToDbAccount);
  }

  Future<List<DbAccount>> findByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).get();
  }

  Stream<List<DbAccount>> watchFindByRemoteId(String remoteId) {
    return findByRemoteIdQuery(remoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery('SELECT COUNT(*) FROM db_accounts WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccounts}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> countById(int id) {
    return countByIdQuery(id).get();
  }

  Stream<List<int>> watchCountById(int id) {
    return countByIdQuery(id).watch();
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_accounts WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbAccounts},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_accounts',
      variables: [],
      updates: {dbAccounts},
    );
  }

  Selectable<DbAccount> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_accounts',
        variables: [], readsFrom: {dbAccounts}).map(_rowToDbAccount);
  }

  Future<List<DbAccount>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbAccount>> watchGetAll() {
    return getAllQuery().watch();
  }

  Selectable<int> findLocalIdByRemoteIdQuery(String remoteId) {
    return customSelectQuery(
        'SELECT id FROM db_accounts WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbAccounts}).map((QueryRow row) => row.readInt('id'));
  }

  Future<List<int>> findLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).get();
  }

  Stream<List<int>> watchFindLocalIdByRemoteId(String remoteId) {
    return findLocalIdByRemoteIdQuery(remoteId).watch();
  }
}
