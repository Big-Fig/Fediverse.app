import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/database/account_database_dao.dart';
import 'package:fedi/app/account/database/account_followers_database_dao.dart';
import 'package:fedi/app/account/database/account_followings_database_dao.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/database/conversation_chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/pleroma/database/pleroma_chat_accounts_database_dao.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/database/status_favourited_accounts_database_dao.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_dao.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_repository_impl.dart");

var _singleAccountRepositoryPagination = RepositoryPagination<IAccount>(
  limit: 1,
  newerThanItem: null,
  offset: null,
  olderThanItem: null,
);

class AccountRepository extends AsyncInitLoadingBloc
    implements IAccountRepository {
  late AccountDao dao;
  late AccountFollowingsDao accountFollowingsDao;
  late AccountFollowersDao accountFollowersDao;
  late StatusFavouritedAccountsDao statusFavouritedAccountsDao;
  late StatusRebloggedAccountsDao statusRebloggedAccountsDao;
  late ConversationAccountsDao conversationAccountsDao;
  late ChatAccountsDao chatAccountsDao;

  AccountRepository({required AppDatabase appDatabase}) {
    dao = appDatabase.accountDao;
    accountFollowingsDao = appDatabase.accountFollowingsDao;
    accountFollowersDao = appDatabase.accountFollowersDao;
    statusFavouritedAccountsDao = appDatabase.statusFavouritedAccountsDao;
    statusRebloggedAccountsDao = appDatabase.statusRebloggedAccountsDao;
    conversationAccountsDao = appDatabase.conversationAccountsDao;
    chatAccountsDao = appDatabase.chatAccountsDao;
  }

  @override
  Future internalAsyncInit() async {
    // nothing to init now
    return null;
  }

  @override
  Future<DbAccountWrapper> findByRemoteId(String? remoteId) async =>
      mapDataClassToItem(
        await dao.findByRemoteId(remoteId!).getSingle(),
      );

  @override
  Stream<DbAccountWrapper> watchByRemoteId(String? remoteId) =>
      dao.findByRemoteId(remoteId!).watchSingle().map(mapDataClassToItem);

  @override
  Future upsertAll(List<DbAccount> items) async {
    // insertOrReplace
    // if a row with the same primary or unique key already
    // exists, it will be deleted and re-created with the row being inserted.
    // We declared remoteId as unique so it possible to insertOrReplace by it too
    await dao.insertAll(
      items,
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future insertAll(List<DbAccount> items) async {
    // if item already exist rollback changes
    // call this only if you sure that items not exist instead user upsertAll
    return await dao.insertAll(
      items,
      InsertMode.insertOrRollback,
    );
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
      dao.findById(id).map(mapDataClassToItem).getSingle();

  @override
  Stream<DbAccountWrapper> watchById(int id) =>
      dao.findById(id).map(mapDataClassToItem).watchSingle();

  @override
  Future<bool> isExistWithId(int id) =>
      dao.countById(id).map((count) => count > 0).getSingle();

  @override
  Future<List<DbAccountWrapper>> getAll() =>
      dao.getAll().map(mapDataClassToItem).get();

  @override
  Future<int> countAll() => dao.countAll().getSingle();

  @override
  Stream<List<DbAccountWrapper>> watchAll() =>
      dao.getAll().map(mapDataClassToItem).watch();

  @override
  Future<int> insert(DbAccount item) => dao.insert(item);

  @override
  Future<int> upsert(DbAccount item) => dao.upsert(item);

  @override
  Future<bool> updateById(int? id, DbAccount dbAccount) {
    if (dbAccount.id != id) {
      dbAccount = dbAccount.copyWith(id: id);
    }
    return dao.replace(dbAccount);
  }

  DbAccountWrapper mapDataClassToItem(DbAccount dataClass) {
    return DbAccountWrapper(dbAccount: dataClass);
  }

  Insertable<DbAccount>? mapItemToDataClass(DbAccountWrapper item) =>
      item.dbAccount;

  @override
  Future upsertRemoteAccount(
    IPleromaAccount pleromaAccount, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
  }) async {
    await upsert(
      pleromaAccount.toDbAccount(),
    );

    if (conversationRemoteId != null) {
      var accountRemoteId = pleromaAccount.id;

      await conversationAccountsDao.insert(
        DbConversationAccount(
          id: null,
          conversationRemoteId: conversationRemoteId,
          accountRemoteId: accountRemoteId,
        ),
        mode: InsertMode.insertOrReplace,
      );
    }
    if (chatRemoteId != null) {
      var accountRemoteId = pleromaAccount.id;

      await chatAccountsDao.insert(
        DbChatAccount(
          id: null,
          chatRemoteId: chatRemoteId,
          accountRemoteId: accountRemoteId,
        ),
        mode: InsertMode.insertOrReplace,
      );
    }
  }

  @override
  Future upsertRemoteAccounts(
    List<IPleromaAccount> pleromaAccounts, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
  }) async {
    if (conversationRemoteId != null) {
      var existConversationAccount = await conversationAccountsDao
          .findByConversationRemoteId(conversationRemoteId)
          .get();

      var accountsToInsert = pleromaAccounts.where(
        (remoteAccount) {
          var found = existConversationAccount.firstWhereOrNull(
              (conversationAccount) =>
                  conversationAccount.accountRemoteId == remoteAccount.id);
          var exist = found != null;
          return !exist;
        },
      );

      if (accountsToInsert.isNotEmpty == true) {
        await conversationAccountsDao.insertAll(
            accountsToInsert
                .map(
                  (accountToInsert) => DbConversationAccount(
                    id: null,
                    conversationRemoteId: conversationRemoteId,
                    accountRemoteId: accountToInsert.id,
                  ),
                )
                .toList(),
            InsertMode.insertOrReplace);
      }
    }

    if (chatRemoteId != null) {
      var existChatAccounts =
          await chatAccountsDao.findByChatRemoteId(chatRemoteId).get();

      var accountsToInsert = pleromaAccounts.where(
        (remoteAccount) {
          var found = existChatAccounts.firstWhereOrNull((chatAccount) =>
              chatAccount.accountRemoteId == remoteAccount.id);
          var exist = found != null;
          return !exist;
        },
      );

      if (accountsToInsert.isNotEmpty == true) {
        await chatAccountsDao.insertAll(
          accountsToInsert
              .map(
                (accountToInsert) => DbChatAccount(
                  id: null,
                  chatRemoteId: chatRemoteId,
                  accountRemoteId: accountToInsert.id,
                ),
              )
              .toList(),
          InsertMode.insertOrReplace,
        );
      }
    }

    if (pleromaAccounts.isNotEmpty) {
      await upsertAll(
        pleromaAccounts
            .map(
              (pleromaAccount) => pleromaAccount.toDbAccount(),
            )
            .toList(),
      );
    }
  }

  @override
  Future updateLocalAccountByRemoteAccount({
    required IAccount oldLocalAccount,
    required IPleromaAccount newRemoteAccount,
  }) async {
    _logger.finer(() => "updateLocalAccountByRemoteAccount \n"
        "\t old: $oldLocalAccount \n"
        "\t newRemoteAccount: $newRemoteAccount");

    DbAccount newLocalDbAccount = newRemoteAccount.toDbAccount();
    if (newLocalDbAccount.pleromaRelationship == null) {
      newLocalDbAccount = newLocalDbAccount.copyWith(
        pleromaRelationship: oldLocalAccount.pleromaRelationship,
      );
    }
    await updateById(
      oldLocalAccount.localId,
      newLocalDbAccount,
    );
  }

  @override
  Future<List<DbAccountWrapper>> getAccounts({
    required AccountRepositoryFilters? filters,
    required RepositoryPagination<IAccount>? pagination,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  }) async {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    var typedAccountsList = await query.get();

    return dao
        .typedResultListToPopulated(typedAccountsList)
        .map(
          (dbAccount) => mapDataClassToItem(dbAccount),
        )
        .toList();
  }

  @override
  Stream<List<DbAccountWrapper>> watchAccounts({
    required AccountRepositoryFilters? filters,
    required RepositoryPagination<IAccount>? pagination,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  }) {
    var query = createQuery(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    Stream<List<TypedResult>> stream = query.watch();

    return stream.map((typedList) => dao
        .typedResultListToPopulated(typedList)
        .map(mapDataClassToItem)
        .toList());
  }

  @override
  Future<DbAccountWrapper?> getAccount({
    required AccountRepositoryFilters? filters,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  }) async {
    var accounts = await getAccounts(
      filters: filters,
      pagination: _singleAccountRepositoryPagination,
      orderingTermData: orderingTermData,
    );

    return accounts.firstOrNull;
  }

  @override
  Stream<DbAccountWrapper?> watchAccount({
    required AccountRepositoryFilters? filters,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  }) {
    var accountsStream = watchAccounts(
      filters: filters,
      pagination: _singleAccountRepositoryPagination,
      orderingTermData: orderingTermData,
    );
    return accountsStream.map(
      (accounts) => accounts.firstOrNull,
    );
  }

  @override
  Future addAccountFollowings({
    required String accountRemoteId,
    required List<PleromaAccount> followings,
  }) async {
    await upsertRemoteAccounts(
      followings,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    // await accountFollowingsDao.deleteByAccountRemoteId(accountRemoteId);
    await accountFollowingsDao.insertAll(
      followings
          .map(
            (followingAccount) => DbAccountFollowing(
              id: null,
              accountRemoteId: accountRemoteId,
              followingAccountRemoteId: followingAccount.id,
            ),
          )
          .toList(),
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future addAccountFollowers({
    required String accountRemoteId,
    required List<IPleromaAccount> followers,
  }) async {
    await upsertRemoteAccounts(
      followers,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    // await accountFollowersDao.deleteByAccountRemoteId(accountRemoteId);
    await accountFollowersDao.insertAll(
      followers
          .map(
            (followerAccount) => DbAccountFollower(
              id: null,
              accountRemoteId: accountRemoteId,
              followerAccountRemoteId: followerAccount.id,
            ),
          )
          .toList(),
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future updateStatusFavouritedBy({
    required String? statusRemoteId,
    required List<IPleromaAccount> favouritedByAccounts,
  }) async {
    await upsertRemoteAccounts(
      favouritedByAccounts,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    await statusFavouritedAccountsDao.deleteByStatusRemoteId(statusRemoteId!);
    await statusFavouritedAccountsDao.insertAll(
      favouritedByAccounts
          .map(
            (favouritedByAccount) => DbStatusFavouritedAccount(
              id: null,
              accountRemoteId: favouritedByAccount.id,
              statusRemoteId: statusRemoteId,
            ),
          )
          .toList(),
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future updateStatusRebloggedBy({
    required String? statusRemoteId,
    required List<IPleromaAccount> rebloggedByAccounts,
  }) async {
    await upsertRemoteAccounts(
      rebloggedByAccounts,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    await statusRebloggedAccountsDao.deleteByStatusRemoteId(statusRemoteId!);
    await statusRebloggedAccountsDao.insertAll(
      rebloggedByAccounts
          .map(
            (favouritedByAccount) => DbStatusRebloggedAccount(
              id: null,
              accountRemoteId: favouritedByAccount.id,
              statusRemoteId: statusRemoteId,
            ),
          )
          .toList(),
      InsertMode.insertOrReplace,
    );
  }

  @override
  Future<List<IAccount>> getConversationAccounts({
    required IConversationChat conversation,
  }) =>
      getAccounts(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
      );

  @override
  Stream<List<IAccount>> watchConversationAccounts({
    required IConversationChat conversation,
  }) =>
      watchAccounts(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
      );

  @override
  Future<List<IAccount>> getChatAccounts({required IPleromaChat chat}) =>
      getAccounts(
        filters: AccountRepositoryFilters.createForOnlyInChat(
          chat: chat,
        ),
        pagination: null,
      );

  @override
  Stream<List<IAccount>> watchChatAccounts({required IPleromaChat chat}) =>
      watchAccounts(
        filters: AccountRepositoryFilters.createForOnlyInChat(
          chat: chat,
        ),
        pagination: null,
      );

  @override
  Future removeAccountFollowing({
    required String? accountRemoteId,
    required String? followingAccountId,
  }) =>
      accountFollowingsDao.deleteByAccountRemoteIdAndFollowingAccountRemoteId(
        followingAccountId!,
        accountRemoteId!,
      );

  @override
  Future removeAccountFollower({
    required String? accountRemoteId,
    required String? followerAccountId,
  }) =>
      accountFollowersDao.deleteByAccountRemoteIdAndFollowerAccountRemoteId(
        followerAccountId!,
        accountRemoteId!,
      );

  JoinedSelectStatement createQuery({
    required AccountRepositoryFilters? filters,
    required RepositoryPagination<IAccount>? pagination,
    required AccountRepositoryOrderingTermData? orderingTermData,
  }) {
    _logger.fine(
      () => "createQuery \n"
          "\t filters=$filters\n"
          "\t pagination=$pagination\n"
          "\t orderingTermData=$orderingTermData",
    );

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTermData!.orderType == AccountOrderType.remoteId);
      query = dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }

    if (filters?.searchQuery != null) {
      query = dao.addSearchWhere(query, filters?.searchQuery);
    }

    if (orderingTermData != null) {
      query = dao.orderBy(
        query,
        [
          orderingTermData,
        ],
      );
    }

    var includeAccountFollowings = filters?.onlyInAccountFollowing != null;
    var includeAccountFollowers = filters?.onlyInAccountFollowers != null;
    var includeStatusFavouritedAccounts =
        filters?.onlyInStatusFavouritedBy != null;
    var includeStatusRebloggedAccounts =
        filters?.onlyInStatusRebloggedBy != null;
    var includeConversationAccounts = filters?.onlyInConversation != null;
    var includeChatAccounts = filters?.onlyInChat != null;

    var joinQuery = query.join(
      dao.populateAccountJoin(
        includeAccountFollowings: includeAccountFollowings,
        includeAccountFollowers: includeAccountFollowers,
        includeStatusFavouritedAccounts: includeStatusFavouritedAccounts,
        includeStatusRebloggedAccounts: includeStatusRebloggedAccounts,
        includeConversationAccounts: includeConversationAccounts,
        includeChatAccounts: includeChatAccounts,
      ),
    );

    if (includeAccountFollowings) {
      joinQuery = dao.addFollowingsWhere(
        joinQuery,
        filters?.onlyInAccountFollowing?.remoteId,
      );
    }
    if (includeAccountFollowers) {
      joinQuery = dao.addFollowersWhere(
        joinQuery,
        filters?.onlyInAccountFollowers?.remoteId,
      );
    }
    if (includeStatusFavouritedAccounts) {
      joinQuery = dao.addStatusFavouritedByWhere(
        joinQuery,
        filters?.onlyInStatusFavouritedBy?.remoteId,
      );
    }
    if (includeStatusRebloggedAccounts) {
      joinQuery = dao.addStatusRebloggedByWhere(
        joinQuery,
        filters?.onlyInStatusRebloggedBy?.remoteId,
      );
    }
    if (includeConversationAccounts) {
      joinQuery = dao.addConversationWhere(
        joinQuery,
        filters?.onlyInConversation?.remoteId,
      );
    }
    if (includeChatAccounts) {
      joinQuery = dao.addChatWhere(
        joinQuery,
        filters?.onlyInChat?.remoteId,
      );
    }

    var limit = pagination?.limit;
    if (limit != null) {
      joinQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }

    return joinQuery;
  }
}
