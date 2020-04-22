// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_followings_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountFollowingsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbAccountFollowingsTable get dbAccountFollowings => db.dbAccountFollowings;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_account_followings;',
            variables: [], readsFrom: {dbAccountFollowings})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbAccountFollowing _rowToDbAccountFollowing(QueryRow row) {
    return DbAccountFollowing(
      id: row.readInt('id'),
      accountRemoteId: row.readString('account_remote_id'),
      followingAccountRemoteId: row.readString('following_account_remote_id'),
    );
  }

  Selectable<DbAccountFollowing> findByIdQuery(int id) {
    return customSelectQuery(
        'SELECT * FROM db_account_followings WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccountFollowings}).map(_rowToDbAccountFollowing);
  }

  Future<List<DbAccountFollowing>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbAccountFollowing>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<DbAccountFollowing> findByAccountRemoteIdQuery(
      String accountRemoteId) {
    return customSelectQuery(
        'SELECT * FROM db_account_followings WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable.withString(accountRemoteId)],
        readsFrom: {dbAccountFollowings}).map(_rowToDbAccountFollowing);
  }

  Future<List<DbAccountFollowing>> findByAccountRemoteId(
      String accountRemoteId) {
    return findByAccountRemoteIdQuery(accountRemoteId).get();
  }

  Stream<List<DbAccountFollowing>> watchFindByAccountRemoteId(
      String accountRemoteId) {
    return findByAccountRemoteIdQuery(accountRemoteId).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_account_followings WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbAccountFollowings})
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
      'DELETE FROM db_account_followings WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbAccountFollowings},
    );
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followings WHERE account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbAccountFollowings},
    );
  }

  Future<int> deleteByFollowingAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followings WHERE following_account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbAccountFollowings},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_account_followings',
      variables: [],
      updates: {dbAccountFollowings},
    );
  }

  Selectable<DbAccountFollowing> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_account_followings',
        variables: [],
        readsFrom: {dbAccountFollowings}).map(_rowToDbAccountFollowing);
  }

  Future<List<DbAccountFollowing>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbAccountFollowing>> watchGetAll() {
    return getAllQuery().watch();
  }
}
