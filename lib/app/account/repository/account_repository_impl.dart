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
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/database/status_favourited_accounts_database_dao.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_dao.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_repository_impl.dart");

class AccountRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbAccount,
    DbAccountPopulated,
    IAccount,
    IPleromaAccount,
    int,
    String,
    $DbAccountsTable,
    $DbAccountsTable,
    AccountRepositoryFilters,
    AccountRepositoryOrderingTermData> implements IAccountRepository {
  @override
  late AccountDao dao;
  late AccountFollowingsDao accountFollowingsDao;
  late AccountFollowersDao accountFollowersDao;
  late StatusFavouritedAccountsDao statusFavouritedAccountsDao;
  late StatusRebloggedAccountsDao statusRebloggedAccountsDao;
  late ConversationAccountsDao conversationAccountsDao;
  late ChatAccountsDao chatAccountsDao;

  AccountRepository({
    required AppDatabase appDatabase,
  }) {
    dao = appDatabase.accountDao;
    accountFollowingsDao = appDatabase.accountFollowingsDao;
    accountFollowersDao = appDatabase.accountFollowersDao;
    statusFavouritedAccountsDao = appDatabase.statusFavouritedAccountsDao;
    statusRebloggedAccountsDao = appDatabase.statusRebloggedAccountsDao;
    conversationAccountsDao = appDatabase.conversationAccountsDao;
    chatAccountsDao = appDatabase.chatAccountsDao;
  }

  // @override
  // Future upsertRemoteAccount(
  //   IPleromaAccount pleromaAccount, {
  //   required String? conversationRemoteId,
  //   required String? chatRemoteId,
  // }) async {
  //   await upsertInRemoteType(
  //     pleromaAccount,
  //   );
  //
  //   if (conversationRemoteId != null) {
  //     var accountRemoteId = pleromaAccount.id;
  //
  //     await conversationAccountsDao.insert(
  //       entity: DbConversationAccount(
  //         id: null,
  //         conversationRemoteId: conversationRemoteId,
  //         accountRemoteId: accountRemoteId,
  //       ),
  //       mode: InsertMode.insertOrReplace,
  //     );
  //   }
  //   if (chatRemoteId != null) {
  //     var accountRemoteId = pleromaAccount.id;
  //
  //     await chatAccountsDao.insert(
  //       entity: DbChatAccount(
  //         id: null,
  //         chatRemoteId: chatRemoteId,
  //         accountRemoteId: accountRemoteId,
  //       ),
  //       mode: InsertMode.insertOrReplace,
  //     );
  //   }
  // }
  //
  // @override
  // Future upsertRemoteAccounts(
  //   List<IPleromaAccount> pleromaAccounts, {
  //   required String? conversationRemoteId,
  //   required String? chatRemoteId,
  // }) async {
  //   if (conversationRemoteId != null) {
  //     var existConversationAccount = await conversationAccountsDao
  //         .findByConversationRemoteId(conversationRemoteId)
  //         .get();
  //
  //     var accountsToInsert = pleromaAccounts.where(
  //       (remoteAccount) {
  //         var found = existConversationAccount.firstWhereOrNull(
  //           (conversationAccount) =>
  //               conversationAccount.accountRemoteId == remoteAccount.id,
  //         );
  //         var exist = found != null;
  //         return !exist;
  //       },
  //     );
  //
  //     if (accountsToInsert.isNotEmpty == true) {
  //       await conversationAccountsDao.insertAll(
  //         entities: accountsToInsert
  //             .map(
  //               (accountToInsert) => DbConversationAccount(
  //                 id: null,
  //                 conversationRemoteId: conversationRemoteId,
  //                 accountRemoteId: accountToInsert.id,
  //               ),
  //             )
  //             .toList(),
  //         mode: InsertMode.insertOrReplace,
  //       );
  //     }
  //   }
  //
  //   if (chatRemoteId != null) {
  //     var existChatAccounts =
  //         await chatAccountsDao.findByChatRemoteId(chatRemoteId).get();
  //
  //     var accountsToInsert = pleromaAccounts.where(
  //       (remoteAccount) {
  //         var found = existChatAccounts.firstWhereOrNull(
  //           (chatAccount) => chatAccount.accountRemoteId == remoteAccount.id,
  //         );
  //         var exist = found != null;
  //         return !exist;
  //       },
  //     );
  //
  //     if (accountsToInsert.isNotEmpty == true) {
  //       await chatAccountsDao.insertAll(
  //         entities: accountsToInsert
  //             .map(
  //               (accountToInsert) => DbChatAccount(
  //                 id: null,
  //                 chatRemoteId: chatRemoteId,
  //                 accountRemoteId: accountToInsert.id,
  //               ),
  //             )
  //             .toList(),
  //         mode: InsertMode.insertOrReplace,
  //       );
  //     }
  //   }
  //
  //   if (pleromaAccounts.isNotEmpty) {
  //     await upsertAllInRemoteType(pleromaAccounts);
  //   }
  // }

  //
  // @override
  // Future updateLocalAccountByRemoteAccount({
  //   required IAccount oldLocalAccount,
  //   required IPleromaAccount newRemoteAccount,
  // }) async {
  //   _logger.finer(() => "updateLocalAccountByRemoteAccount \n"
  //       "\t old: $oldLocalAccount \n"
  //       "\t newRemoteAccount: $newRemoteAccount");
  //
  //   DbAccount newLocalDbAccount = newRemoteAccount.toDbAccount();
  //   if (newLocalDbAccount.pleromaRelationship == null) {
  //     newLocalDbAccount = newLocalDbAccount.copyWith(
  //       pleromaRelationship: oldLocalAccount.pleromaRelationship,
  //     );
  //   }
  //   await updateByIdInDbType(
  //     dbId: oldLocalAccount.localId!,
  //     dbItem: newLocalDbAccount,
  //   );
  // }

  @override
  Future addAccountFollowings({
    required String accountRemoteId,
    required List<PleromaAccount> followings,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction == null) {
      await dao.batch(
        (batch) => addAccountFollowings(
          accountRemoteId: accountRemoteId,
          followings: followings,
          batchTransaction: batch,
        ),
      );
    } else {
      await upsertAllInRemoteType(
        followings,
        batchTransaction: batchTransaction,
      );
      // await accountFollowingsDao.deleteByAccountRemoteId(accountRemoteId);
      await accountFollowingsDao.insertAll(
        entities: followings
            .map(
              (followingAccount) => DbAccountFollowing(
                id: null,
                accountRemoteId: accountRemoteId,
                followingAccountRemoteId: followingAccount.id,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
    }
  }

  @override
  Future addAccountFollowers({
    required String accountRemoteId,
    required List<IPleromaAccount> followers,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction == null) {
      await dao.batch(
        (batch) => addAccountFollowers(
          accountRemoteId: accountRemoteId,
          followers: followers,
          batchTransaction: batch,
        ),
      );
    } else {
      await upsertAllInRemoteType(
        followers,
        batchTransaction: batchTransaction,
      );
      // await accountFollowersDao.deleteByAccountRemoteId(accountRemoteId);
      await accountFollowersDao.insertAll(
        entities: followers
            .map(
              (followerAccount) => DbAccountFollower(
                id: null,
                accountRemoteId: accountRemoteId,
                followerAccountRemoteId: followerAccount.id,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );
    }
  }

  @override
  Future updateStatusFavouritedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> favouritedByAccounts,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction == null) {
      await dao.batch(
        (batch) => updateStatusFavouritedBy(
          statusRemoteId: statusRemoteId,
          favouritedByAccounts: favouritedByAccounts,
          batchTransaction: batch,
        ),
      );
    } else {
      await upsertRemoteAccounts(
        favouritedByAccounts,
        batchTransaction: batchTransaction,
      );
      await statusFavouritedAccountsDao.deleteByStatusRemoteId(statusRemoteId);
      await statusFavouritedAccountsDao.insertAll(
        entities: favouritedByAccounts
            .map(
              (favouritedByAccount) => DbStatusFavouritedAccount(
                id: null,
                accountRemoteId: favouritedByAccount.id,
                statusRemoteId: statusRemoteId,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
      );
    }
  }

  @override
  Future updateStatusRebloggedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> rebloggedByAccounts,
  }) async {
    await upsertRemoteAccounts(
      rebloggedByAccounts,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    await statusRebloggedAccountsDao.deleteByStatusRemoteId(statusRemoteId);
    await statusRebloggedAccountsDao.insertAll(
      entities: rebloggedByAccounts
          .map(
            (favouritedByAccount) => DbStatusRebloggedAccount(
              id: null,
              accountRemoteId: favouritedByAccount.id,
              statusRemoteId: statusRemoteId,
            ),
          )
          .toList(),
      mode: InsertMode.insertOrReplace,
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
    required String accountRemoteId,
    required String followerAccountId,
  }) =>
      accountFollowersDao.deleteByAccountRemoteIdAndFollowerAccountRemoteId(
        followerAccountId,
        accountRemoteId,
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

  @override
  DbAccount mapAppItemToDbItem(IAccount appItem) => appItem.toDbAccount();

  @override
  IPleromaAccount mapAppItemToRemoteItem(IAccount appItem) =>
      appItem.toPleromaAccount();

  @override
  IAccount mapDbItemToAppItem(DbAccount dbItem) => dbItem.toDbAccountWrapper();

  @override
  IPleromaAccount mapDbItemToRemoteItem(DbAccount dbItem) =>
      dbItem.toDbAccountWrapper().toPleromaAccount();

  @override
  DbAccount mapRemoteItemToDbItem(IPleromaAccount remoteItem) =>
      remoteItem.toDbAccount();

  @override
  IAccount mapRemoteItemToAppItem(IPleromaAccount appItem) =>
      appItem.toDbAccountWrapper();

  @override
  AccountRepositoryFilters get emptyFilters => AccountRepositoryFilters.empty;

  @override
  List<AccountRepositoryOrderingTermData> get defaultOrderingTerms =>
      AccountRepositoryOrderingTermData.defaultTerms;

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required RepositoryPagination<DbAccount>? pagination,
    required List<AccountRepositoryOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(orderingTermData.orderType == AccountOrderType.remoteId);
      query = dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }
  }

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required AccountRepositoryFilters? filters,
  }) {
    // TODO: implement addFiltersToQuery
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required List<AccountRepositoryOrderingTermData>? orderingTerms,
  }) {
    dao.orderBy(
      query,
      orderingTerms ?? [],
    );
  }

  @override
  Future upsertChatRemoteAccount(
    IPleromaAccount remoteAccount, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  }) {
    // TODO: implement upsertChatRemoteAccount
    throw UnimplementedError();
  }

  @override
  Future upsertChatRemoteAccounts(
    List<IPleromaAccount> remoteAccount, {
    required String chatRemoteId,
  }) {
    // TODO: implement upsertChatRemoteAccounts
    throw UnimplementedError();
  }

  @override
  Future upsertConversationRemoteAccount(
    IPleromaAccount remoteAccount, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) {
    // TODO: implement upsertConversationRemoteAccount
    throw UnimplementedError();
  }

  @override
  Future upsertConversationRemoteAccounts(
    List<IPleromaAccount> remoteAccounts, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) {
    // TODO: implement upsertConversationRemoteAccounts
    throw UnimplementedError();
  }

  @override
  JoinedSelectStatement<Table, DataClass>
      convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbAccountsTable, DbAccount> query,
    required AccountRepositoryFilters? filters,
  }) {
    // TODO: implement convertSimpleSelectStatementToJoinedSelectStatement
    throw UnimplementedError();
  }

  @override
  DbAccountPopulated mapAppItemToDbPopulatedItem(IAccount appItem) {
    // TODO: implement mapAppItemToDbPopulatedItem
    throw UnimplementedError();
  }

  @override
  IAccount mapDbPopulatedItemToAppItem(DbAccountPopulated dbPopulatedItem) {
    // TODO: implement mapDbPopulatedItemToAppItem
    throw UnimplementedError();
  }

  @override
  IPleromaAccount mapDbPopulatedItemToRemoteItem(
      DbAccountPopulated dbPopulatedItem) {
    // TODO: implement mapDbPopulatedItemToRemoteItem
    throw UnimplementedError();
  }

  @override
  DbAccountPopulated mapTypedResultToDbPopulatedItem(TypedResult typedResult) {
    // TODO: implement mapTypedResultToDbPopulatedItem
    throw UnimplementedError();
  }
}

extension DbAccountListExtension on List<DbAccount> {
  List<DbAccountWrapper> toDbAccountWrapperList() => map(
        (item) => item.toDbAccountWrapper(),
      ).toList();
}

extension DbAccountWrapperExtension on DbAccountWrapper {
  DbAccount toDbAccount() => dbAccount;
}
