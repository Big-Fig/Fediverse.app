import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountRepository
    implements
        Disposable,
        IReadIdListRepository<DbAccountWrapper, int>,
        IWriteIdListRepository<DbAccount, int> {
  static IAccountRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountRepository>(context, listen: listen);

  Future<DbAccountWrapper> findByRemoteId(String remoteId);

  Stream<DbAccountWrapper> watchByRemoteId(String remoteId);

  Future upsertRemoteAccounts(List<IPleromaAccount> remoteAccounts,
      {@required conversationRemoteId});

  Future upsertRemoteAccount(IPleromaAccount remoteAccount,
      {@required conversationRemoteId});

  Future updateAccountFollowings(
      String accountRemoteId, List<PleromaAccount> followings);

  Future updateAccountFollowers(
      String accountRemoteId, List<PleromaAccount> followers);

  Future updateStatusRebloggedBy(
      {@required String statusRemoteId,
      @required List<PleromaAccount> rebloggedByAccounts});

  Future updateStatusFavouritedBy(
      {@required String statusRemoteId,
      @required List<PleromaAccount> favouritedByAccounts});

  Future updateLocalAccountByRemoteAccount(
      {@required IAccount oldLocalAccount,
      @required IPleromaAccount newRemoteAccount});

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
      @required AccountOrderingTermData orderingTermData});

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
      @required AccountOrderingTermData orderingTermData});

  Future<DbAccountWrapper> getAccount(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required AccountOrderingTermData orderingTermData});

  Stream<DbAccountWrapper> watchAccount(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required AccountOrderingTermData orderingTermData});
}
