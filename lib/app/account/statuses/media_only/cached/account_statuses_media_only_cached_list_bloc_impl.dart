import 'package:easy_dispose_provider/easy_dispose_provider.dart';
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
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('account_statuses_media_only_cached_list_bloc_impl.dart');

class AccountStatusesMediaOnlyCachedListBloc
    extends AccountStatusesCachedListBloc {
  StatusRepositoryFilters get _statusRepositoryFilters =>
      StatusRepositoryFilters.only(
        onlyWithMedia: true,
        withMuted: false,
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        excludeTextConditions: excludeTextConditions,
      );

  AccountStatusesMediaOnlyCachedListBloc({
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

  static AccountStatusesMediaOnlyCachedListBloc createFromContext(
    BuildContext context, {
    required IAccount account,
  }) =>
      AccountStatusesMediaOnlyCachedListBloc(
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
      onlyWithMedia: true,
      accountId: account.remoteId,
      pinned: null,
      tagged: null,
      excludeReblogs: null,
      excludeReplies: null,
      excludeVisibilities: null,
      withMuted: null,
      pagination: UnifediApiPagination(
        minId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
        limit: limit,
      ),
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
            AccountStatusesMediaOnlyCachedListBloc.createFromContext(
          context,
          account: account,
        ),
        child: StatusCachedListBlocProxyProvider(
          child: child,
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
