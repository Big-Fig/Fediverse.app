import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/database/account_database_dao.dart';
import 'package:fedi/refactored/app/account/database/account_followers_database_dao.dart';
import 'package:fedi/refactored/app/account/database/account_followings_database_dao.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/database/conversation_accounts_database_dao.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/database/status_favourited_accounts_database_dao.dart';
import 'package:fedi/refactored/app/status/database/status_reblogged_accounts_database_dao.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_repository_impl.dart");

class AccountRepository extends AsyncInitLoadingBloc
    implements IAccountRepository {
  AccountDao dao;
  AccountFollowingsDao accountFollowingsDao;
  AccountFollowersDao accountFollowersDao;
  StatusFavouritedAccountsDao statusFavouritedAccountsDao;
  StatusRebloggedAccountsDao statusRebloggedAccountsDao;
  ConversationAccountsDao conversationAccountsDao;

  AccountRepository({@required AppDatabase appDatabase}) {
    dao = appDatabase.accountDao;
    accountFollowingsDao = appDatabase.accountFollowingsDao;
    accountFollowersDao = appDatabase.accountFollowersDao;
    statusFavouritedAccountsDao = appDatabase.statusFavouritedAccountsDao;
    statusRebloggedAccountsDao = appDatabase.statusRebloggedAccountsDao;
    conversationAccountsDao = appDatabase.conversationAccountsDao;
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
  Stream<DbAccountWrapper> watchByRemoteId(String remoteId) =>
      dao.findByRemoteIdQuery(remoteId).watchSingle().map(mapDataClassToItem);

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
  Future<int> countAll() => dao.countAllQuery().getSingle();

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

  DbAccountWrapper mapDataClassToItem(DbAccount dataClass) {
    if (dataClass == null) {
      return null;
    }
    return DbAccountWrapper(dataClass);
  }

  Insertable<DbAccount> mapItemToDataClass(DbAccountWrapper item) =>
      item.dbAccount;

  @override
  Future upsertRemoteAccount(IPleromaAccount remoteAccount,
      {@required conversationRemoteId}) async {
    await upsert(mapRemoteAccountToDbAccount(remoteAccount));

    if (conversationRemoteId != null) {
      var accountRemoteId = remoteAccount.id;

      await conversationAccountsDao.insert(
          DbConversationAccount(
              id: null,
              conversationRemoteId: conversationRemoteId,
              accountRemoteId: accountRemoteId),
          mode: InsertMode.insertOrReplace);
    }
  }

  @override
  Future upsertRemoteAccounts(List<IPleromaAccount> remoteAccounts,
      {@required String conversationRemoteId}) async {
    if (conversationRemoteId != null) {
      var existConversationAccount = await conversationAccountsDao
          .findByConversationRemoteId(conversationRemoteId);

      var accountsToInsert = remoteAccounts?.where((remoteAccount) {
        var found = existConversationAccount.firstWhere(
            (conversationAccount) =>
                conversationAccount.accountRemoteId == remoteAccount.id,
            orElse: () => null);
        var exist = found != null;
        return !exist;
      });

      if (accountsToInsert?.isNotEmpty == true) {
        await conversationAccountsDao.insertAll(
            accountsToInsert
                .map((accountToInsert) => DbConversationAccount(
                    id: null,
                    conversationRemoteId: conversationRemoteId,
                    accountRemoteId: accountToInsert.id))
                .toList(),
            InsertMode.insertOrReplace);
      }
    }

    if (remoteAccounts?.isNotEmpty == true) {
      await upsertAll(remoteAccounts.map(mapRemoteAccountToDbAccount).toList());
    }
  }

  @override
  Future updateLocalAccountByRemoteAccount(
      {@required IAccount oldLocalAccount,
      @required IPleromaAccount newRemoteAccount}) async {
    _logger.finer(() => "updateLocalAccountByRemoteAccount \n"
        "\t old: $oldLocalAccount \n"
        "\t newRemoteAccount: $newRemoteAccount");

    var newLocalAccount = mapRemoteAccountToDbAccount(newRemoteAccount);
    if (newLocalAccount.pleromaRelationship == null &&
        oldLocalAccount != null) {
      newLocalAccount = newLocalAccount.copyWith(
          pleromaRelationship: oldLocalAccount.pleromaRelationship);
    }
    await updateById(oldLocalAccount.localId, newLocalAccount);
  }

  @override
  Future<List<DbAccountWrapper>> getAccounts(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required int limit,
      @required int offset,
      @required AccountOrderingTermData orderingTermData}) async {
    var query = createQuery(
        olderThanAccount: olderThanAccount,
        newerThanAccount: newerThanAccount,
        onlyInConversation: onlyInConversation,
        onlyInStatusRebloggedBy: onlyInStatusRebloggedBy,
        onlyInStatusFavouritedBy: onlyInStatusFavouritedBy,
        onlyInAccountFollowers: onlyInAccountFollowers,
        onlyInAccountFollowing: onlyInAccountFollowing,
        searchQuery: searchQuery,
        limit: limit,
        offset: offset,
        orderingTermData: orderingTermData);

    var typedAccountsList = await query.get();

    return dao
        .typedResultListToPopulated(typedAccountsList)
        .map((dbAccount) => mapDataClassToItem(dbAccount))
        .toList();
  }

  @override
  Stream<List<DbAccountWrapper>> watchAccounts(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required int limit,
      @required int offset,
      @required AccountOrderingTermData orderingTermData}) {
    var query = createQuery(
      olderThanAccount: olderThanAccount,
      newerThanAccount: newerThanAccount,
      onlyInConversation: onlyInConversation,
      onlyInStatusRebloggedBy: onlyInStatusRebloggedBy,
      onlyInStatusFavouritedBy: onlyInStatusFavouritedBy,
      onlyInAccountFollowers: onlyInAccountFollowers,
      onlyInAccountFollowing: onlyInAccountFollowing,
      searchQuery: searchQuery,
      limit: limit,
      offset: offset,
      orderingTermData: orderingTermData,
    );

    Stream<List<TypedResult>> stream = query.watch();

    return stream.map((typedList) => dao
        .typedResultListToPopulated(typedList)
        .map(mapDataClassToItem)
        .toList());
  }

  JoinedSelectStatement createQuery(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required int limit,
      @required int offset,
      @required AccountOrderingTermData orderingTermData}) {
    _logger.fine(() => "createQuery \n"
        "\t olderThanAccount=$olderThanAccount\n"
        "\t newerThanAccount=$newerThanAccount\n"
        "\t onlyInStatusRebloggedBy=$onlyInStatusRebloggedBy\n"
        "\t onlyInStatusFavouritedBy=$onlyInStatusFavouritedBy\n"
        "\t onlyInAccountFollowers=$onlyInAccountFollowers\n"
        "\t onlyInAccountFollowing=$onlyInAccountFollowing\n"
        "\t onlyInConversation=$onlyInConversation\n"
        "\t searchQuery=$searchQuery\n"
        "\t limit=$limit\n"
        "\t offset=$offset\n"
        "\t orderingTermData=$orderingTermData\n");

    var query = dao.startSelectQuery();

    if (olderThanAccount != null || newerThanAccount != null) {
      query = dao.addRemoteIdBoundsWhere(query,
          maximumRemoteIdExcluding: olderThanAccount?.remoteId,
          minimumRemoteIdExcluding: newerThanAccount?.remoteId);
    }

    if (searchQuery != null) {
      query = dao.addSearchWhere(query, searchQuery);
    }

    if (orderingTermData != null) {
      query = dao.orderBy(query, [orderingTermData]);
    }

    var includeAccountFollowings = onlyInAccountFollowing != null;
    var includeAccountFollowers = onlyInAccountFollowers != null;
    var includeStatusFavouritedAccounts = onlyInStatusFavouritedBy != null;
    var includeStatusRebloggedAccounts = onlyInStatusRebloggedBy != null;
    var includeConversationAccounts = onlyInConversation != null;

    var joinQuery = query.join(dao.populateAccountJoin(
      includeAccountFollowings: includeAccountFollowings,
      includeAccountFollowers: includeAccountFollowers,
      includeStatusFavouritedAccounts: includeStatusFavouritedAccounts,
      includeStatusRebloggedAccounts: includeStatusRebloggedAccounts,
      includeConversationAccounts: includeConversationAccounts,
//       includeConversationAccounts: false,
    ));

    if (includeAccountFollowings) {
      joinQuery =
          dao.addFollowingsWhere(joinQuery, onlyInAccountFollowing.remoteId);
    }
    if (includeAccountFollowers) {
      joinQuery =
          dao.addFollowersWhere(joinQuery, onlyInAccountFollowers.remoteId);
    }
    if (includeStatusFavouritedAccounts) {
      joinQuery = dao.addStatusFavouritedByWhere(
          joinQuery, onlyInStatusFavouritedBy.remoteId);
    }
    if (includeStatusRebloggedAccounts) {
      joinQuery = dao.addStatusRebloggedByWhere(
          joinQuery, onlyInStatusRebloggedBy.remoteId);
    }
    if (includeConversationAccounts) {
      joinQuery =
          dao.addConversationWhere(joinQuery, onlyInConversation.remoteId);
    }

    assert(!(limit == null && offset != null));
    if (limit != null) {
      joinQuery.limit(limit, offset: offset);
    }
    return joinQuery;
  }

  @override
  Future<DbAccountWrapper> getAccount(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required AccountOrderingTermData orderingTermData}) async {
    var accounts = await getAccounts(
        olderThanAccount: olderThanAccount,
        newerThanAccount: newerThanAccount,
        onlyInConversation: onlyInConversation,
        onlyInStatusRebloggedBy: onlyInStatusRebloggedBy,
        onlyInStatusFavouritedBy: onlyInStatusFavouritedBy,
        onlyInAccountFollowers: onlyInAccountFollowers,
        onlyInAccountFollowing: onlyInAccountFollowing,
        searchQuery: searchQuery,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return accounts?.first;
  }

  @override
  Stream<DbAccountWrapper> watchAccount(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required AccountOrderingTermData orderingTermData}) {
    var accountsStream = watchAccounts(
        olderThanAccount: olderThanAccount,
        newerThanAccount: newerThanAccount,
        onlyInConversation: onlyInConversation,
        onlyInStatusRebloggedBy: onlyInStatusRebloggedBy,
        onlyInStatusFavouritedBy: onlyInStatusFavouritedBy,
        onlyInAccountFollowers: onlyInAccountFollowers,
        onlyInAccountFollowing: onlyInAccountFollowing,
        searchQuery: searchQuery,
        orderingTermData: orderingTermData,
        limit: 1,
        offset: null);
    return accountsStream.map((accounts) => accounts?.first);
  }

  @override
  Future updateAccountFollowings(
      String accountRemoteId, List<PleromaAccount> followings) async {
    await upsertRemoteAccounts(followings, conversationRemoteId: null);
    await accountFollowingsDao.deleteByAccountRemoteId(accountRemoteId);
    await accountFollowingsDao.insertAll(
        followings
            .map((followingAccount) => DbAccountFollowing(
                id: null,
                accountRemoteId: accountRemoteId,
                followingAccountRemoteId: followingAccount.id))
            .toList(),
        InsertMode.insertOrReplace);
  }

  @override
  Future updateAccountFollowers(
      String accountRemoteId, List<PleromaAccount> followers) async {
    await upsertRemoteAccounts(followers, conversationRemoteId: null);
    await accountFollowersDao.deleteByAccountRemoteId(accountRemoteId);
    await accountFollowersDao.insertAll(
        followers
            .map((followingAccount) => DbAccountFollower(
                id: null,
                accountRemoteId: accountRemoteId,
                followerAccountRemoteId: followingAccount.id))
            .toList(),
        InsertMode.insertOrReplace);
  }

  @override
  Future updateStatusFavouritedBy(
      {@required String statusRemoteId,
      @required List<PleromaAccount> favouritedByAccounts}) async {
    await upsertRemoteAccounts(favouritedByAccounts,
        conversationRemoteId: null);
    await statusFavouritedAccountsDao.deleteByStatusRemoteId(statusRemoteId);
    await statusFavouritedAccountsDao.insertAll(
        favouritedByAccounts
            .map((favouritedByAccount) => DbStatusFavouritedAccount(
                id: null,
                accountRemoteId: favouritedByAccount.id,
                statusRemoteId: statusRemoteId))
            .toList(),
        InsertMode.insertOrReplace);
  }

  @override
  Future updateStatusRebloggedBy(
      {@required String statusRemoteId,
      @required List<PleromaAccount> rebloggedByAccounts}) async {
    await upsertRemoteAccounts(rebloggedByAccounts, conversationRemoteId: null);
    await statusRebloggedAccountsDao.deleteByStatusRemoteId(statusRemoteId);
    await statusRebloggedAccountsDao.insertAll(
        rebloggedByAccounts
            .map((favouritedByAccount) => DbStatusRebloggedAccount(
                id: null,
                accountRemoteId: favouritedByAccount.id,
                statusRemoteId: statusRemoteId))
            .toList(),
        InsertMode.insertOrReplace);
  }

  @override
  Future<List<IAccount>> getConversationAccounts(
          {@required IConversation conversation}) =>
      getAccounts(
          searchQuery: null,
          olderThanAccount: null,
          newerThanAccount: null,
          onlyInConversation: conversation,
          onlyInStatusRebloggedBy: null,
          onlyInStatusFavouritedBy: null,
          onlyInAccountFollowers: null,
          onlyInAccountFollowing: null,
          limit: null,
          offset: null,
          orderingTermData: null);

  @override
  Stream<List<IAccount>> watchConversationAccounts(
          {@required IConversation conversation}) =>
      watchAccounts(
          searchQuery: null,
          olderThanAccount: null,
          newerThanAccount: null,
          onlyInConversation: conversation,
          onlyInStatusRebloggedBy: null,
          onlyInStatusFavouritedBy: null,
          onlyInAccountFollowers: null,
          onlyInAccountFollowing: null,
          limit: null,
          offset: null,
          orderingTermData: null);
}
