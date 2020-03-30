import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_bloc.dart';
import 'package:fedi/refactored/app/pagination/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_statuses_bloc_impl.dart");

class AccountStatusesBloc extends CachedPleromaPaginationBloc<IStatus>
    implements IAccountStatusesBloc {
  final IAccount account;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;

  AccountStatusesBloc(
      {@required this.account,
      @required this.pleromaAccountService,
      @required this.statusRepository,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedNetworkPaginationPage<IStatus> olderPage,
      @required CachedNetworkPaginationPage<IStatus> newerPage}) async {
    var statuses = await statusRepository.getStatuses(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: null,
        onlyWithMedia: false,
        onlyNotMuted: false,
        excludeVisibilities: null,
        olderThanStatus: newerPage?.items?.last,
        newerThanStatus: olderPage?.items?.first,
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        limit: itemsCountPerPage,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyInConversation: null);

    return statuses;
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedNetworkPaginationPage<IStatus> olderPage,
      @required CachedNetworkPaginationPage<IStatus> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    try {
      var remoteStatuses = await pleromaAccountService.getAccountStatuses(
          accountRemoteId: account.remoteId,
          limit: itemsCountPerPage,
          sinceId: olderPage?.items?.first?.remoteId,
          maxId: newerPage?.items?.last?.remoteId);

      if (remoteStatuses != null) {
        await statusRepository.upsertRemoteStatuses(remoteStatuses,
            listRemoteId: null, conversationRemoteId: null);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "statuses is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }
}
