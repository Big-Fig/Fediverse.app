// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_followers_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountFollowersDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbAccountFollowersTable get dbAccountFollowers => db.dbAccountFollowers;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_account_followers;',
            variables: [], readsFrom: {dbAccountFollowers})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbAccountFollower _rowToDbAccountFollower(QueryRow row) {
    return DbAccountFollower(
      id: row.readInt('id'),
      accountRemoteId: row.readString('account_remote_id'),
      followerAccountRemoteId: row.readString('follower_account_remote_id'),
    );
  }

  Selectable<DbAccountFollower> findByIdQuery(int id) {
    return customSelectQuery(
        'SELECT * FROM db_account_followers WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccountFollowers}).map(_rowToDbAccountFollower);
  }

  Future<List<DbAccountFollower>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbAccountFollower>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbAccountFollower> findByAccountRemoteIdQuery(
      String accountRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_account_followers WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable.withString(accountRemoteId)],
        readsFrom: {dbAccountFollowers}).map(_rowToDbAccountFollower);
  }

  Future<List<DbAccountFollower>> findByAccountRemoteId(
      String accountRemoteId) {
    return findByAccountRemoteIdQuery(accountRemoteId).get();
  }

  Stream<List<DbAccountFollower>> watchFindByAccountRemoteId(
      String accountRemoteId) {
    return findByAccountRemoteIdQuery(accountRemoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_account_followers WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbAccountFollowers})
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
      'DELETE FROM db_account_followers WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbAccountFollowers},
    );
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbAccountFollowers},
    );
  }

  Future<int> deleteByFollowerAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE follower_account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbAccountFollowers},
    );
  }

  Future<int> deleteByAccountRemoteIdAndFollowerAccountRemoteId(
      String followerAccountRemoteId, String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE follower_account_remote_id = :followerAccountRemoteId AND account_remote_id = :accountRemoteId;',
      variables: [
        Variable.withString(followerAccountRemoteId),
        Variable.withString(accountRemoteId)
      ],
      updates: {dbAccountFollowers},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_account_followers',
      variables: [],
      updates: {dbAccountFollowers},
    );
  }

  Selectable<DbAccountFollower> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_account_followers',
        variables: [],
        readsFrom: {dbAccountFollowers}).map(_rowToDbAccountFollower);
  }

  Future<List<DbAccountFollower>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbAccountFollower>> watchGetAll() {
    return getAllQuery().watch();
  }
}
