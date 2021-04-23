import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger("account_statuses_without_replies_cached_list_bloc_impl.dart");

class AccountStatusesWithoutRepliesListBloc
    extends AccountStatusesCachedListBloc {
  StatusRepositoryFilters get _statusRepositoryFilters =>
      StatusRepositoryFilters(
        onlyNoNsfwSensitive: false,
        onlyNoReplies: true,
        onlyFromAccount: account,
        excludeTextConditions: excludeTextConditions,
        onlyWithMedia: false,
        withMuted: false,
      );

  AccountStatusesWithoutRepliesListBloc({
    required IAccount account,
    required IPleromaApiAccountService pleromaAccountService,
    required IStatusRepository statusRepository,
    required IFilterRepository filterRepository,
    required IMyAccountBloc myAccountBloc,
    required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
          webSocketsHandlerManagerBloc: webSocketsHandlerManagerBloc,
          statusRepository: statusRepository,
          filterRepository: filterRepository,
          myAccountBloc: myAccountBloc,
        );

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  static AccountStatusesWithoutRepliesListBloc createFromContext(
    BuildContext context, {
    required IAccount account,
  }) {
    return AccountStatusesWithoutRepliesListBloc(
      account: account,
      pleromaAccountService: IPleromaApiAccountService.of(context, listen: false),
      webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      filterRepository: IFilterRepository.of(
        context,
        listen: false,
      ),
      myAccountBloc: IMyAccountBloc.of(
        context,
        listen: false,
      ),
    );
  }

  @override
  Future<List<IStatus>> loadLocalItems({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    var statuses = await statusRepository.findAllInAppType(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [
        StatusRepositoryOrderingTermData.remoteIdDesc,
      ],
    );

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus? item) {
    return statusRepository.watchFindAllInAppType(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        newerThanItem: item,
      ),
      orderingTerms: [
        StatusRepositoryOrderingTermData.remoteIdDesc,
      ],
    );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.finest(() => "refreshItemsFromRemoteForPage \n"
        "\t limit=$limit"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var remoteStatuses = await pleromaAccountService.getAccountStatuses(
      excludeReplies: true,
      accountRemoteId: account.remoteId,
      pagination: PleromaApiPaginationRequest(
        limit: limit,
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
    );

    await statusRepository.upsertAllInRemoteType(
      remoteStatuses,
      batchTransaction: null,
    );
  }

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  static Widget provideToContext(
    BuildContext context, {
    required IAccount account,
    required Widget child,
  }) {
    return DisposableProvider<IStatusCachedListBloc>(
      create: (context) =>
          AccountStatusesWithoutRepliesListBloc.createFromContext(
        context,
        account: account,
      ),
      child: StatusCachedListBlocProxyProvider(
        child: child,
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
