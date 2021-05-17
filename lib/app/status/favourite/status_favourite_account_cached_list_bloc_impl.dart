import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_favourite_account_list_service_impl.dart");

class StatusFavouriteAccountCachedListBloc extends DisposableOwner
    implements IAccountCachedListBloc {
  final IPleromaApiAuthStatusService pleromaAuthStatusService;
  final IAccountRepository accountRepository;
  final IStatus status;

  AccountRepositoryFilters get _accountRepositoryFilters =>
      AccountRepositoryFilters(
        onlyInStatusFavouritedBy: status,
      );

  StatusFavouriteAccountCachedListBloc({
    required this.pleromaAuthStatusService,
    required this.accountRepository,
    required this.status,
  });

  @override
  IPleromaApi get pleromaApi => pleromaAuthStatusService;

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThanAccount = $newerThan"
        "\t olderThanAccount = $olderThan");

    List<IPleromaApiAccount> remoteAccounts;

    remoteAccounts = await pleromaAuthStatusService.favouritedBy(
      statusRemoteId: status.remoteId!,
      pagination: PleromaApiPaginationRequest(
        limit: limit,
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
    );

    await accountRepository.batch((batch) {
      accountRepository.upsertAllInRemoteType(
        remoteAccounts,
        batchTransaction: batch,
      );

      accountRepository.updateStatusFavouritedBy(
        statusRemoteId: status.remoteId!,
        favouritedByAccounts: remoteAccounts,
        batchTransaction: batch,
      );
    });
  }

  @override
  Future<List<IAccount>> loadLocalItems({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThanAccount=$newerThan"
        "\t olderThanAccount=$olderThan");

    var accounts = await accountRepository.findAllInAppType(
      filters: _accountRepositoryFilters,
      pagination: RepositoryPagination<IAccount>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [
        AccountRepositoryOrderingTermData.remoteIdDesc,
      ],
    );

    _logger.finer(() => "finish loadLocalItems accounts ${accounts.length}");

    return accounts;
  }

  static StatusFavouriteAccountCachedListBloc createFromContext(
    BuildContext context, {
    required IStatus status,
  }) =>
      StatusFavouriteAccountCachedListBloc(
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAuthStatusService:
            IPleromaApiAuthStatusService.of(context, listen: false),
        status: status,
      );

  static Widget provideToContext(
    BuildContext context, {
    required IStatus status,
    required Widget child,
  }) =>
      DisposableProvider<IAccountCachedListBloc>(
        create: (context) =>
            StatusFavouriteAccountCachedListBloc.createFromContext(
          context,
          status: status,
        ),
        child: AccountCachedListBlocProxyProvider(child: child),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
