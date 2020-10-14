// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_followings_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountFollowingsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbAccountFollowingsTable get dbAccountFollowings =>
      attachedDatabase.dbAccountFollowings;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_account_followings;',
            variables: [], readsFrom: {dbAccountFollowings})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbAccountFollowing> findById(int id) {
    return customSelect('SELECT * FROM db_account_followings WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbAccountFollowings}).map(dbAccountFollowings.mapFromRow);
  }

  Selectable<DbAccountFollowing> findByAccountRemoteId(String accountRemoteId) {
    return customSelect(
        'SELECT * FROM db_account_followings WHERE account_remote_id = :accountRemoteId;',
        variables: [Variable.withString(accountRemoteId)],
        readsFrom: {dbAccountFollowings}).map(dbAccountFollowings.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_account_followings WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbAccountFollowings})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_account_followings WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbAccountFollowings},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followings WHERE account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbAccountFollowings},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByFollowingAccountRemoteId(String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followings WHERE following_account_remote_id = :accountRemoteId;',
      variables: [Variable.withString(accountRemoteId)],
      updates: {dbAccountFollowings},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteByAccountRemoteIdAndFollowingAccountRemoteId(
      String followingAccountRemoteId, String accountRemoteId) {
    return customUpdate(
      'DELETE FROM db_account_followings WHERE following_account_remote_id = :followingAccountRemoteId AND account_remote_id = :accountRemoteId;',
      variables: [
        Variable.withString(followingAccountRemoteId),
        Variable.withString(accountRemoteId)
      ],
      updates: {dbAccountFollowings},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_account_followings',
      variables: [],
      updates: {dbAccountFollowings},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbAccountFollowing> getAll() {
    return customSelect('SELECT * FROM db_account_followings',
        variables: [],
        readsFrom: {dbAccountFollowings}).map(dbAccountFollowings.mapFromRow);
  }
}
