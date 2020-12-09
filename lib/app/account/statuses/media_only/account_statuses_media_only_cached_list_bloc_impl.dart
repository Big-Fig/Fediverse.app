import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_statuses_media_only_cached_list_bloc_impl.dart");

class AccountStatusesMediaOnlyCachedListBloc
    extends AccountStatusesCachedListBloc {
  AccountStatusesMediaOnlyCachedListBloc({
    @required IAccount account,
    @required IPleromaAccountService pleromaAccountService,
    @required this.statusRepository,
    @required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
          webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
        );

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;
  final IStatusRepository statusRepository;

  static AccountStatusesMediaOnlyCachedListBloc createFromContext(
      BuildContext context,
      {@required IAccount account}) {
    return AccountStatusesMediaOnlyCachedListBloc(
      account: account,
      pleromaAccountService: IPleromaAccountService.of(context, listen: false),
      webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
    );
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
      onlyWithMedia: true,
      withMuted: false,
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
      onlyInConversation: null,
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
    );

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    return statusRepository.watchStatuses(
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: null,
      onlyWithMedia: true,
      withMuted: false,
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
      onlyInConversation: null,
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
    );
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

    var remoteStatuses = await pleromaAccountService.getAccountStatuses(
        onlyWithMedia: true,
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
  }

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  static Widget provideToContext(BuildContext context,
      {@required IAccount account, @required Widget child}) {
    return DisposableProvider<IStatusCachedListBloc>(
      create: (context) =>
          AccountStatusesMediaOnlyCachedListBloc.createFromContext(context,
              account: account),
      child: child,
    );
  }
}
