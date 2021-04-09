import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
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

  Future upsertRemoteAccounts(
    List<IPleromaAccount> remoteAccounts, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
  });

  Future upsertRemoteAccount(
    IPleromaAccount remoteAccount, {
    required String? conversationRemoteId,
    required String? chatRemoteId,
  });

  Future addAccountFollowings({
    required String accountRemoteId,
    required List<PleromaAccount> followings,
  });

  Future addAccountFollowers({
    required String accountRemoteId,
    required List<IPleromaAccount> followers,
  });

  Future updateStatusRebloggedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> rebloggedByAccounts,
  });

  Future updateStatusFavouritedBy({
    required String statusRemoteId,
    required List<IPleromaAccount> favouritedByAccounts,
  });

  Future<List<IAccount>> getAccounts({
    required AccountRepositoryFilters? filters,
    required RepositoryPagination<IAccount>? pagination,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  });

  Stream<List<IAccount>> watchAccounts({
    required AccountRepositoryFilters? filters,
    required RepositoryPagination<IAccount>? pagination,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  });

  Future<IAccount?> getAccount({
    required AccountRepositoryFilters? filters,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
  });

  Stream<IAccount?> watchAccount({
    required AccountRepositoryFilters? filters,
    AccountRepositoryOrderingTermData? orderingTermData =
        AccountRepositoryOrderingTermData.remoteIdDesc,
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
  });

  Future removeAccountFollower({
    required String accountRemoteId,
    required String followerAccountId,
  });
}
