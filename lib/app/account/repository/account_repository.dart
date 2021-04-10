import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class IAccountRepository
    implements
        IDisposable,
        IAppRemoteReadWriteRepository<
            DbAccount,
            IAccount,
            IPleromaAccount,
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

  Future upsertConversationRemoteAccounts(
    List<IPleromaAccount> remoteAccounts, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertConversationRemoteAccount(
    IPleromaAccount remoteAccount, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertChatRemoteAccount(
    IPleromaAccount remoteAccount, {
    required String chatRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertChatRemoteAccounts(
    List<IPleromaAccount> remoteAccount, {
    required String chatRemoteId,
  });

  Future addAccountFollowings({
    required String accountRemoteId,
    required List<PleromaAccount> followings,
    required Batch? batchTransaction,
  });

  Future addAccountFollowers({
    required String accountRemoteId,
    required List<IPleromaAccount> followers,
    required Batch? batchTransaction,
  });

  Future updateStatusRebloggedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> rebloggedByAccounts,
    required Batch? batchTransaction,
  });

  Future updateStatusFavouritedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> favouritedByAccounts,
    required Batch? batchTransaction,
  });

  Future<List<IAccount>> getConversationAccounts({
    required IConversationChat conversation,
  });

  Stream<List<IAccount>> watchConversationAccounts({
    required IConversationChat conversation,
  });

  Future<List<IAccount>> getChatAccounts({
    required IPleromaChat chat,
  });

  Stream<List<IAccount>> watchChatAccounts({
    required IPleromaChat chat,
  });

  Future removeAccountFollowing({
    required String accountRemoteId,
    required String followingAccountId,
    required Batch? batchTransaction,
  });

  Future removeAccountFollower({
    required String accountRemoteId,
    required String followerAccountId,
    required Batch? batchTransaction,
  });
}
