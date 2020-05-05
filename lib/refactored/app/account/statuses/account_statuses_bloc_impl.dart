import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/account/websockets/account_websockets_handler_impl.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_statuses_bloc_impl.dart");

class AccountStatusesBloc extends IStatusCachedListService {
  final IAccount account;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final INotificationRepository notificationRepository;
  final IConversationRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;

  AccountStatusesBloc(
      {@required this.account,
      @required this.pleromaAccountService,
      @required this.statusRepository,
      @required this.notificationRepository,
      @required this.conversationRepository,
      @required this.pleromaWebSocketsService,
      @required bool listenWebSocketsChanges})
      : super() {
    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: AccountWebSocketsHandler(
              statusRepository: statusRepository,
              accountId: account.remoteId,
              notificationRepository: notificationRepository,
              conversationRepository: conversationRepository,
              pleromaWebSocketsService: pleromaWebSocketsService));
    }
  }

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  static AccountStatusesBloc createFromContext(BuildContext context,
      {@required IAccount account}) {
    return AccountStatusesBloc(
        account: account,
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        conversationRepository:
            IConversationRepository.of(context, listen: false),
        listenWebSocketsChanges:
            IMyAccountSettingsBloc.of(context, listen: false)
                .isRealtimeWebSocketsEnabled,
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false));
  }

  @override
  Future preRefreshAllAction() async {
    // nothing by default
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    var statuses = await statusRepository.getStatuses(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: null,
        onlyWithMedia: false,
        onlyNotMuted: false,
        excludeVisibilities: null,
        olderThanStatus: olderThan,
        newerThanStatus: newerThan,
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        limit: limit,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyInConversation: null);

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    return statusRepository.watchStatuses(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: null,
        onlyWithMedia: false,
        onlyNotMuted: false,
        excludeVisibilities: null,
        olderThanStatus: null,
        newerThanStatus: item,
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyInConversation: null);
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.finest(() => "refreshItemsFromRemoteForPage \n"
        "\t limit=$limit"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    try {
      var remoteStatuses = await pleromaAccountService.getAccountStatuses(
          accountRemoteId: account.remoteId,
          limit: limit,
          sinceId: newerThan?.remoteId,
          maxId: olderThan?.remoteId);

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
