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
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:moor/moor.dart';

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
  }) {
    dao = appDatabase.accountDao;
    accountFollowingsDao = appDatabase.accountFollowingsDao;
    accountFollowersDao = appDatabase.accountFollowersDao;
    statusFavouritedAccountsDao = appDatabase.statusFavouritedAccountsDao;
    statusRebloggedAccountsDao = appDatabase.statusRebloggedAccountsDao;
    conversationAccountsDao = appDatabase.conversationAccountsDao;
    chatAccountsDao = appDatabase.chatAccountsDao;
  }

  Future upsertRemoteAccount(
    IPleromaAccount pleromaAccount, {
    int? dbId,
    required String? conversationRemoteId,
    required String? chatRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      await upsertInDbTypeBatch(
        pleromaAccount.toDbAccount().copyWith(id: dbId),
        batchTransaction: batchTransaction,
      );

      await _upsertRemoteAccountMetadata(
        pleromaAccount,
        conversationRemoteId: conversationRemoteId,
        chatRemoteId: chatRemoteId,
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
    IPleromaAccount pleromaAccount, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      if (conversationRemoteId != null) {
        var accountRemoteId = pleromaAccount.id;

        await conversationAccountsDao.insertBatch(
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
        var accountRemoteId = pleromaAccount.id;

        await chatAccountsDao.insertBatch(
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
      await upsertAllInRemoteType(
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
        batchTransaction: batchTransaction,
      );
    }
  }

  @override
  Future updateStatusRebloggedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> rebloggedByAccounts,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      await upsertAllInRemoteType(
        rebloggedByAccounts,
        batchTransaction: batchTransaction,
      );
      await statusRebloggedAccountsDao.deleteByStatusRemoteIdBatch(
        statusRemoteId,
        batchTransaction: batchTransaction,
      );
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
  IPleromaAccount mapAppItemToRemoteItem(IAccount appItem) =>
      appItem.toPleromaAccount();

  @override
  DbAccount mapRemoteItemToDbItem(IPleromaAccount remoteItem) =>
      remoteItem.toDbAccount();

  @override
  IAccount mapRemoteItemToAppItem(IPleromaAccount appItem) =>
      appItem.toDbAccountWrapper();

  @override
  DbAccountPopulated mapAppItemToDbPopulatedItem(IAccount appItem) =>
      appItem.toDbAccountPopulated();

  @override
  IAccount mapDbPopulatedItemToAppItem(DbAccountPopulated dbPopulatedItem) =>
      DbAccountPopulatedWrapper(dbAccountPopulated: dbPopulatedItem);

  @override
  IPleromaAccount mapDbPopulatedItemToRemoteItem(
          DbAccountPopulated dbPopulatedItem) =>
      mapDbPopulatedItemToAppItem(dbPopulatedItem).toPleromaAccount();

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
    IPleromaAccount remoteItem, {
    required InsertMode? mode,
  }) async {
    var id = await insertInDbType(
      remoteItem.toDbAccount(),
      mode: mode,
    );

    await _upsertRemoteAccountMetadata(
      remoteItem,
      conversationRemoteId: null,
      chatRemoteId: null,
      batchTransaction: null,
    );

    return id;
  }

  @override
  Future<void> insertInRemoteTypeBatch(
    IPleromaAccount remoteItem, {
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
    required IPleromaAccount remoteItem,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      if (appItem.localId != null) {
        await updateByDbIdInDbType(
          dbId: appItem.localId!,
          dbItem: remoteItem.toDbAccount(),
          batchTransaction: batchTransaction,
        );
      } else {
        await upsertInRemoteTypeBatch(
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
    IPleromaAccount remoteAccount, {
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
    List<IPleromaAccount> remoteAccounts, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  }) =>
      batch(
        (batch) {
          remoteAccounts.forEach(
            (remoteAccount) {
              upsertChatRemoteAccount(
                remoteAccount,
                chatRemoteId: chatRemoteId,
                batchTransaction: batch,
              );
            },
          );
        },
      );

  @override
  Future upsertConversationRemoteAccount(
    IPleromaAccount remoteAccount, {
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
    List<IPleromaAccount> remoteAccounts, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  }) async {
    if (batchTransaction != null) {
      for (var remoteAccount in remoteAccounts) {
        await upsertConversationRemoteAccount(
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
