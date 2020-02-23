import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/database/account_database_dao.dart';
import 'package:fedi/app/account/database/account_following_database_dao.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

class AccountRepository extends AsyncInitLoadingBloc
    implements IAccountRepository {
  AccountDao dao;
  AccountFollowingsDao followingsDao;

  AccountRepository({
    @required AppDatabase appDatabase
  }) {
    dao = appDatabase.accountDao;
    followingsDao = appDatabase.accountFollowingsDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future<DbAccountWrapper> findByRemoteId(String remoteId) async =>
      mapDataClassToItem(await dao.findByRemoteIdQuery(remoteId).getSingle());

  @override
  Future upsertAll(Iterable<DbAccount> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(items, InsertMode.insertOrReplace);
  }

  @override
  Future insertAll(Iterable<DbAccount> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(items, InsertMode.insertOrRollback);
  }

  @override
  Future clear() => dao.clear();

  @override
  Future<bool> deleteById(int id) async {
    var affectedRows = await dao.deleteById(id);
    assert(affectedRows == 0 || affectedRows == 1);
    return (affectedRows) == 1;
  }

  @override
  Future<DbAccountWrapper> findById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbAccountWrapper> watchById(int id) =>
      dao.findByIdQuery(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countByIdQuery(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbAccountWrapper>> getAll() =>
      dao.getAllQuery().map(mapDataClassToItem).get();

  @override
  Stream<List<DbAccountWrapper>> watchAll() =>
      dao.getAllQuery().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbAccount item) => dao.insert(item);

  @override
  Future<int> upsert(DbAccount item) => dao.upsert(item);

  @override
  Future<bool> updateById(int id, DbAccount dbAccount) {
    if (dbAccount.id != id) {
      dbAccount = dbAccount.copyWith(id: id);
    }
    return dao.replace(dbAccount);
  }

  DbAccountWrapper mapDataClassToItem(DbAccount dataClass) =>
      DbAccountWrapper(dataClass);

  Insertable<DbAccount> mapItemToDataClass(DbAccountWrapper item) =>
      item.dbAccount;

  @override
  Future upsertRemoteAccount(IPleromaAccount remoteAccount) async {
    await upsert(mapRemoteAccountToDbAccount(remoteAccount));
  }

  @override
  Future upsertRemoteAccounts(List<IPleromaAccount> remoteAccounts) async {
    await upsertAll(remoteAccounts.map(mapRemoteAccountToDbAccount).toList());
  }

  @override
  Future updateAccountFollowings(
      String accountRemoteId, List<PleromaAccount> followings) async {
    await followingsDao.deleteByAccountRemoteId(accountRemoteId);
    await followingsDao.insertAll(
        followings.map((followingAccount) => DbAccountFollowing(
            id: null,
            accountRemoteId: accountRemoteId,
            followingAccountRemoteId: followingAccount.id)).toList(),
        InsertMode.insertOrReplace);
  }

  @override
  Future<List<String>> getAccountFollowingsRemoteIds(
      String accountRemoteId) async {
    return (await followingsDao.findByAccountRemoteId(accountRemoteId))
        .map((accountFollowing) => accountFollowing.followingAccountRemoteId).toList();
  }
}
