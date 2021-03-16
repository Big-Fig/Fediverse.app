// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_followers_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountFollowersDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbAccountFollowersTable get dbAccountFollowers =>
      attachedDatabase.dbAccountFollowers;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_account_followers;',
            variables: [], readsFrom: {dbAccountFollowers})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbAccountFollower> findById(int? id) {
    return customSelect('SELECT * FROM db_account_followers WHERE id = :id;',
        variables: [Variable<int?>(id)],
        readsFrom: {dbAccountFollowers}).map(dbAccountFollowers.mapFromRow);
  }

  Selectable<DbAccountFollower> findByAccountRemoteId(String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_account_followers WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable<String>(accountRemoteId)],
        readsFrom: {dbAccountFollowers}).map(dbAccountFollowers.mapFromRow);
  }

  Selectable<int> countById(int? id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_account_followers WHERE id = :id;',
            variables: [Variable<int?>(id)],
            readsFrom: {dbAccountFollowers})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int? id) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE id = :id;',
      variables: [Variable<int?>(id)],
      updates: {dbAccountFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE account_remote_id = :accountRemoteId;',
      variables: [Variable<String>(accountRemoteId)],
      updates: {dbAccountFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByFollowerAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE follower_account_remote_id = :accountRemoteId;',
      variables: [Variable<String>(accountRemoteId)],
      updates: {dbAccountFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByAccountRemoteIdAndFollowerAccountRemoteId(
      String followerAccountRemoteId, String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followers WHERE follower_account_remote_id = :followerAccountRemoteId AND account_remote_id = :accountRemoteId;',
      variables: [
        Variable<String>(followerAccountRemoteId),
        Variable<String>(accountRemoteId)
      ],
      updates: {dbAccountFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_account_followers',
      variables: [],
      updates: {dbAccountFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbAccountFollower> getAll() {
    return customSelect('SELECT * FROM db_account_followers',
        variables: [],
        readsFrom: {dbAccountFollowers}).map(dbAccountFollowers.mapFromRow);
  }
}
