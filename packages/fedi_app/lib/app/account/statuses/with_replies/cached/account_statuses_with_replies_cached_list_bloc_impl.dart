import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/filter/repository/filter_repository.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/repository/status_repository_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger =
    Logger('account_statuses_with_replies_cached_list_bloc_impl.dart');

class AccountStatusesWithRepliesCachedListBloc
    extends AccountStatusesCachedListBloc {
  StatusRepositoryFilters get _statusRepositoryFilters =>
      StatusRepositoryFilters.only(
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        excludeTextConditions: excludeTextConditions,
        onlyWithMedia: false,
        withMuted: false,
      );

  AccountStatusesWithRepliesCachedListBloc({
    required IAccount account,
    required IUnifediApiAccountService unifediApiAccountService,
    required IStatusRepository statusRepository,
    required IFilterRepository filterRepository,
    required IMyAccountBloc myAccountBloc,
  }) : super(
          account: account,
          unifediApiAccountService: unifediApiAccountService,
          statusRepository: statusRepository,
          filterRepository: filterRepository,
          myAccountBloc: myAccountBloc,
        );

  @override
  IUnifediApiService get unifediApi => unifediApiAccountService;

  static AccountStatusesWithRepliesCachedListBloc createFromContext(
    BuildContext context, {
    required IAccount account,
  }) =>
      AccountStatusesWithRepliesCachedListBloc(
        account: account,
        unifediApiAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
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
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus? item) =>
      statusRepository.watchFindAllInAppType(
        filters: _statusRepositoryFilters,
        pagination: RepositoryPagination<IStatus>(
          newerThanItem: item,
        ),
        orderingTerms: [
          StatusRepositoryOrderingTermData.remoteIdDesc,
        ],
      );

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.finest(
      () => 'refreshItemsFromRemoteForPage \n'
          '\t limit=$limit'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    var remoteStatuses = await unifediApiAccountService.getAccountStatuses(
      accountId: account.remoteId,
      pagination: UnifediApiPagination(
        limit: limit,
        minId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
      tagged: null,
      pinned: null,
      excludeReplies: null,
      excludeReblogs: null,
      excludeVisibilities: null,
      withMuted: null,
      onlyWithMedia: null,
    );

    await statusRepository.upsertAllInRemoteType(
      remoteStatuses,
      batchTransaction: null,
    );
  }

  @override
  Stream<bool> get settingsChangedStream => const Stream.empty();

  static Widget provideToContext(
    BuildContext context, {
    required IAccount account,
    required Widget child,
  }) =>
      DisposableProvider<IStatusCachedListBloc>(
        create: (context) =>
            AccountStatusesWithRepliesCachedListBloc.createFromContext(
          context,
          account: account,
        ),
        child: StatusCachedListBlocProxyProvider(child: child),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
