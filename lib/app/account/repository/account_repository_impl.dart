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
import 'package:fedi/app/database/dao/populated_database_dao_mixin.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/status/database/status_favourited_accounts_database_dao.dart';
import 'package:fedi/app/status/database/status_reblogged_accounts_database_dao.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:moor/moor.dart';

class AccountRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbAccount,
    DbAccountPopulated,
    IAccount,
    IPleromaApiAccount,
    int,
    String,
    $DbAccountsTable,
    $DbAccountsTable,
    AccountRepositoryFilters,
    AccountRepositoryOrderingTermData> implements IAccountRepository {
  @override
  final AccountDao dao;
  final AccountFollowingsDao accountFollowingsDao;
  final AccountFollowersDao accountFollowersDao;
  final StatusFavouritedAccountsDao statusFavouritedAccountsDao;
  final StatusRebloggedAccountsDao statusRebloggedAccountsDao;
  final ConversationAccountsDao conversationAccountsDao;
  final ChatAccountsDao chatAccountsDao;

  @override
  PopulatedDatabaseDaoMixin<
      DbAccount,
      DbAccountPopulated,
      int,
      $DbAccountsTable,
      $DbAccountsTable,
      AccountRepositoryFilters,
      AccountRepositoryOrderingTermData> get populatedDao => dao;

  AccountRepository({
    required AppDatabase appDatabase,
  })  : dao = appDatabase.accountDao,
        accountFollowingsDao = appDatabase.accountFollowingsDao,
        accountFollowersDao = appDatabase.accountFollowersDao,
        statusFavouritedAccountsDao = appDatabase.statusFavouritedAccountsDao,
        statusRebloggedAccountsDao = appDatabase.statusRebloggedAccountsDao,
        conversationAccountsDao = appDatabase.conversationAccountsDao,
        chatAccountsDao = appDatabase.chatAccountsDao;

  Future upsertRemoteAccount(
    IPleromaApiAccount pleromaAccount, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      _upsertRemoteAccountMetadata(
        pleromaAccount,
        conversationRemoteId: conversationRemoteId,
        chatRemoteId: chatRemoteId,
        batchTransaction: batchTransaction,
      );

      // ignore: unawaited_futures
      upsertInDbTypeBatch(
        pleromaAccount.toDbAccount(),
        batchTransaction: batchTransaction,
      );
    } else {
      await batch((batch) {
        upsertRemoteAccount(
          pleromaAccount,
          conversationRemoteId: conversationRemoteId,
          chatRemoteId: chatRemoteId,
          batchTransaction: batch,
        );
      });
    }
  }

  Future _upsertRemoteAccountMetadata(
    IPleromaApiAccount pleromaAccount, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      var accountRemoteId = pleromaAccount.id;
      if (conversationRemoteId != null) {
        // ignore: unawaited_futures
        conversationAccountsDao.insertBatch(
          entity: DbConversationAccount(
            id: null,
            conversationRemoteId: conversationRemoteId,
            accountRemoteId: accountRemoteId,
          ),
          mode: InsertMode.insertOrReplace,
          batchTransaction: batchTransaction,
        );
      }
      if (chatRemoteId != null) {
        // ignore: unawaited_futures
        chatAccountsDao.insertBatch(
          entity: DbChatAccount(
            id: null,
            chatRemoteId: chatRemoteId,
            accountRemoteId: accountRemoteId,
          ),
          mode: InsertMode.insertOrReplace,
          batchTransaction: batchTransaction,
        );
      }
    } else {
      return await batch((batch) {
        _upsertRemoteAccountMetadata(
          pleromaAccount,
          conversationRemoteId: conversationRemoteId,
          chatRemoteId: chatRemoteId,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future addAccountFollowings({
    required String accountRemoteId,
    required List<PleromaApiAccount> followings,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      upsertAllInRemoteType(
        followings,
        batchTransaction: batchTransaction,
      );
      // await accountFollowingsDao.deleteByAccountRemoteId(accountRemoteId);
      // ignore: unawaited_futures
      accountFollowingsDao.insertAll(
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
    } else {
      await dao.batch(
        (batch) => addAccountFollowings(
          accountRemoteId: accountRemoteId,
          followings: followings,
          batchTransaction: batch,
        ),
      );
    }
  }

  @override
  Future addAccountFollowers({
    required String accountRemoteId,
    required List<IPleromaApiAccount> followers,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
      upsertAllInRemoteType(
        followers,
        batchTransaction: batchTransaction,
      );
      // await accountFollowersDao.deleteByAccountRemoteId(accountRemoteId);
      // ignore: unawaited_futures
      accountFollowersDao.insertAll(
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
    } else {
      await dao.batch(
        (batch) => addAccountFollowers(
          accountRemoteId: accountRemoteId,
          followers: followers,
          batchTransaction: batch,
        ),
      );
    }
  }

  @override
  Future updateStatusFavouritedBy({
    required String statusRemoteId,
    required List<IPleromaApiAccount> favouritedByAccounts,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
        upsertAllInRemoteType(
          favouritedByAccounts,
          batchTransaction: batchTransaction,
        );
      // ignore: unawaited_futures
        statusFavouritedAccountsDao.deleteByStatusRemoteId(statusRemoteId);
      // ignore: unawaited_futures
        statusFavouritedAccountsDao.insertAll(
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
          batchTransaction: batchTransaction,
        );
    } else {
      await dao.batch(
        (batch) => updateStatusFavouritedBy(
          statusRemoteId: statusRemoteId,
          favouritedByAccounts: favouritedByAccounts,
          batchTransaction: batch,
        ),
      );
    }
  }

  @override
  Future updateStatusRebloggedBy({
    required String statusRemoteId,
    required List<IPleromaApiAccount> rebloggedByAccounts,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      // ignore: unawaited_futures
        upsertAllInRemoteType(
          rebloggedByAccounts,
          batchTransaction: batchTransaction,
        );
      // ignore: unawaited_futures
        statusRebloggedAccountsDao.deleteByStatusRemoteIdBatch(
          statusRemoteId,
          batchTransaction: batchTransaction,
        );
      // ignore: unawaited_futures
        statusRebloggedAccountsDao.insertAll(
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
          batchTransaction: batchTransaction,
        );
    } else {
      return batch(
        (batch) => updateStatusRebloggedBy(
          statusRemoteId: statusRemoteId,
          rebloggedByAccounts: rebloggedByAccounts,
          batchTransaction: batch,
        ),
      );
    }
  }

  @override
  Future<List<IAccount>> getConversationAccounts({
    required IConversationChat conversation,
  }) =>
      findAllInAppType(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
        orderingTerms: null,
      );

  @override
  Stream<List<IAccount>> watchConversationAccounts({
    required IConversationChat conversation,
  }) =>
      watchFindAllInAppType(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
        orderingTerms: null,
      );

  @override
  Future<List<IAccount>> getChatAccounts({required IPleromaChat chat}) =>
      findAllInAppType(
        filters: AccountRepositoryFilters.createForOnlyInChat(
          chat: chat,
        ),
        pagination: null,
        orderingTerms: null,
      );

  @override
  Stream<List<IAccount>> watchChatAccounts({required IPleromaChat chat}) =>
      watchFindAllInAppType(
        filters: AccountRepositoryFilters.createForOnlyInChat(
          chat: chat,
        ),
        pagination: null,
        orderingTerms: null,
      );

  @override
  Future removeAccountFollowing({
    required String accountRemoteId,
    required String followingAccountId,
    required Batch? batchTransaction,
  }) =>
      accountFollowingsDao
          .deleteByAccountRemoteIdAndFollowingAccountRemoteIdBatch(
        followingAccountRemoteId: followingAccountId,
        accountRemoteId: accountRemoteId,
        batchTransaction: batchTransaction,
      );

  @override
  Future removeAccountFollower({
    required String accountRemoteId,
    required String followerAccountId,
    required Batch? batchTransaction,
  }) =>
      accountFollowersDao
          .deleteByAccountRemoteIdAndFollowerAccountRemoteIdBatch(
        followerAccountRemoteId: followerAccountId,
        accountRemoteId: accountRemoteId,
        batchTransaction: batchTransaction,
      );

  @override
  DbAccount mapAppItemToDbItem(IAccount appItem) => appItem.toDbAccount();

  @override
  IPleromaApiAccount mapAppItemToRemoteItem(IAccount appItem) =>
      appItem.toPleromaApiAccount();

  @override
  DbAccount mapRemoteItemToDbItem(IPleromaApiAccount remoteItem) =>
      remoteItem.toDbAccount();

  @override
  IAccount mapRemoteItemToAppItem(IPleromaApiAccount remoteItem) =>
      remoteItem.toDbAccountWrapper();

  @override
  DbAccountPopulated mapAppItemToDbPopulatedItem(IAccount appItem) =>
      appItem.toDbAccountPopulated();

  @override
  IAccount mapDbPopulatedItemToAppItem(DbAccountPopulated dbPopulatedItem) =>
      DbAccountPopulatedWrapper(dbAccountPopulated: dbPopulatedItem);

  @override
  IPleromaApiAccount mapDbPopulatedItemToRemoteItem(
    DbAccountPopulated dbPopulatedItem,
  ) =>
      mapDbPopulatedItemToAppItem(dbPopulatedItem).toPleromaApiAccount();

  @override
  AccountRepositoryFilters get emptyFilters => AccountRepositoryFilters.empty;

  @override
  List<AccountRepositoryOrderingTermData> get defaultOrderingTerms =>
      AccountRepositoryOrderingTermData.defaultTerms;

  @override
  Future<void> insertInDbTypeBatch(
    Insertable<DbAccount> dbItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) =>
      dao.insertBatch(
        entity: dbItem,
        mode: mode,
        batchTransaction: batchTransaction,
      );

  @override
  Future<int> insertInRemoteType(
    IPleromaApiAccount remoteItem, {
    required InsertMode? mode,
  }) async {
    await _upsertRemoteAccountMetadata(
      remoteItem,
      conversationRemoteId: null,
      chatRemoteId: null,
      batchTransaction: null,
    );

    var id = await insertInDbType(
      remoteItem.toDbAccount(),
      mode: mode,
    );

    return id;
  }

  @override
  Future<void> insertInRemoteTypeBatch(
    IPleromaApiAccount remoteItem, {
    required InsertMode? mode,
    required Batch? batchTransaction,
  }) {
    // todo: mode
    return upsertRemoteAccount(
      remoteItem,
      conversationRemoteId: null,
      chatRemoteId: null,
      batchTransaction: batchTransaction,
    );
  }

  @override
  Future<void> updateAppTypeByRemoteType({
    required IAccount appItem,
    required IPleromaApiAccount remoteItem,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      if (appItem.localId != null) {
        // ignore: unawaited_futures
          updateByDbIdInDbType(
            dbId: appItem.localId!,
            dbItem: remoteItem.toDbAccount(),
            batchTransaction: batchTransaction,
          );
      } else {
        // ignore: unawaited_futures
          upsertInRemoteTypeBatch(
            remoteItem,
            batchTransaction: batchTransaction,
          );
      }
    } else {
      await batch((batch) {
        updateAppTypeByRemoteType(
          appItem: appItem,
          remoteItem: remoteItem,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future<void> updateByDbIdInDbType({
    required int dbId,
    required DbAccount dbItem,
    required Batch? batchTransaction,
  }) =>
      insertInDbTypeBatch(
        dbItem.copyWith(id: dbId),
        mode: InsertMode.insertOrReplace,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertChatRemoteAccount(
    IPleromaApiAccount remoteAccount, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteAccount(
        remoteAccount,
        conversationRemoteId: null,
        chatRemoteId: chatRemoteId,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertChatRemoteAccounts(
    List<IPleromaApiAccount> remoteAccounts, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      for (var remoteAccount in remoteAccounts) {
        // ignore: unawaited_futures
          upsertChatRemoteAccount(
            remoteAccount,
            chatRemoteId: chatRemoteId,
            batchTransaction: batchTransaction,
          );
      }
    } else {
      await batch((batch) {
        upsertChatRemoteAccounts(
          remoteAccounts,
          chatRemoteId: chatRemoteId,
          batchTransaction: batch,
        );
      });
    }
  }

  @override
  Future upsertConversationRemoteAccount(
    IPleromaApiAccount remoteAccount, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) =>
      upsertRemoteAccount(
        remoteAccount,
        conversationRemoteId: conversationRemoteId,
        chatRemoteId: null,
        batchTransaction: batchTransaction,
      );

  @override
  Future upsertConversationRemoteAccounts(
    List<IPleromaApiAccount> remoteAccounts, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      for (var remoteAccount in remoteAccounts) {
        // ignore: unawaited_futures
          upsertConversationRemoteAccount(
            remoteAccount,
            conversationRemoteId: conversationRemoteId,
            batchTransaction: batchTransaction,
          );
      }
    } else {
      await batch(
        (batch) {
          upsertConversationRemoteAccounts(
            remoteAccounts,
            conversationRemoteId: conversationRemoteId,
            batchTransaction: batch,
          );
        },
      );
    }
  }
}

extension DbAccountListExtension on List<DbAccount> {
  List<DbAccountPopulatedWrapper> toDbAccountPopulatedWrapperList() => map(
        (item) => item.toDbAccountWrapper(),
      ).toList();
}

extension DbAccountWrapperExtension on DbAccountPopulatedWrapper {
  DbAccount toDbAccount() => dbAccount;
}
