import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/list/cached/account_cached_list_service.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("status_reblog_account_list_service_impl.dart");

class StatusReblogAccountCachedListBloc extends DisposableOwner
    implements IAccountCachedListBloc {
  final IPleromaStatusService pleromaStatusService;
  final IAccountRepository accountRepository;
  final IStatus status;

  StatusReblogAccountCachedListBloc({
    @required this.pleromaStatusService,
    @required this.accountRepository,
    @required this.status,
  });

  @override
  IPleromaApi get pleromaApi => pleromaStatusService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IAccount newerThan,
      @required IAccount olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThanAccount = $newerThan"
        "\t olderThanAccount = $olderThan");

    try {
      List<IPleromaAccount> remoteAccounts;

      remoteAccounts =
          await pleromaStatusService.reblogedBy(statusRemoteId: status.remoteId
              // pagination not supported
//          maxId: olderThanAccount?.remoteId,
//          sinceId: newerThanAccount?.remoteId,
//          limit: limit
              );

      if (remoteAccounts != null) {
        await accountRepository.upsertRemoteAccounts(remoteAccounts,
            conversationRemoteId: null);

        await accountRepository.updateStatusRebloggedBy(
            statusRemoteId: status.remoteId,
            rebloggedByAccounts: remoteAccounts);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "accounts is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }

  @override
  Future<List<IAccount>> loadLocalItems(
      {@required int limit,
      @required IAccount newerThan,
      @required IAccount olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThanAccount=$newerThan"
        "\t olderThanAccount=$olderThan");

    var accounts = await accountRepository.getAccounts(
        olderThanAccount: olderThan,
        newerThanAccount: newerThan,
        limit: limit,
        offset: null,
        orderingTermData: AccountOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: AccountOrderByType.remoteId),
        onlyInConversation: null,
        onlyInAccountFollowers: null,
        onlyInStatusFavouritedBy: status,
        onlyInAccountFollowing: null,
        onlyInStatusRebloggedBy: status,
        searchQuery: null);

    _logger.finer(() => "finish loadLocalItems accounts ${accounts.length}");
    return accounts;
  }

  static StatusReblogAccountCachedListBloc createFromContext(BuildContext context,
          {@required IStatus status}) =>
      StatusReblogAccountCachedListBloc(
          accountRepository: IAccountRepository.of(context, listen: false),
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          status: status);
}
