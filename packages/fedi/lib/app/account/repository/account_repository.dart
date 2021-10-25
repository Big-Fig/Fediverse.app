import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccountRepository
    implements
        IDisposable,
        IAppRemoteReadWriteRepository<
            DbAccount,
            IAccount,
            IUnifediApiAccount,
            int,
            String,
            AccountRepositoryFilters,
            AccountRepositoryOrderingTermData> {
  static IAccountRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountRepository>(
        context,
        listen: listen,
      );

  Future<void> upsertConversationRemoteAccounts(
    List<IUnifediApiAccount> remoteAccounts, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertConversationRemoteAccount(
    IUnifediApiAccount remoteAccount, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertChatRemoteAccount(
    IUnifediApiAccount remoteAccount, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertChatRemoteAccounts(
    List<IUnifediApiAccount> remoteAccounts, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> addAccountFollowings({
    required String accountRemoteId,
    required List<UnifediApiAccount> followings,
    required Batch? batchTransaction,
  });

  Future<void> addAccountFollowers({
    required String accountRemoteId,
    required List<IUnifediApiAccount> followers,
    required Batch? batchTransaction,
  });

  Future<void> updateStatusRebloggedBy({
    required String statusRemoteId,
    required List<IUnifediApiAccount> rebloggedByAccounts,
    required Batch? batchTransaction,
  });

  Future<void> updateStatusFavouritedBy({
    required String statusRemoteId,
    required List<IUnifediApiAccount> favouritedByAccounts,
    required Batch? batchTransaction,
  });

  Future<List<IAccount>> getConversationAccounts({
    required IConversationChat conversation,
  });

  Stream<List<IAccount>> watchConversationAccounts({
    required IConversationChat conversation,
  });

  Future<List<IAccount>> getChatAccounts({
    required IUnifediChat chat,
  });

  Stream<List<IAccount>> watchChatAccounts({
    required IUnifediChat chat,
  });

  Future<void> removeAccountFollowing({
    required String accountRemoteId,
    required String followingAccountId,
    required Batch? batchTransaction,
  });

  Future<void> removeAccountFollower({
    required String accountRemoteId,
    required String followerAccountId,
    required Batch? batchTransaction,
  });
}
