import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('status_favourite_account_list_service_impl.dart');

class StatusFavouriteAccountCachedListBloc extends DisposableOwner
    implements IAccountCachedListBloc {
  final IUnifediApiStatusService unifediApiStatusService;
  final IAccountRepository accountRepository;
  final IStatus status;

  AccountRepositoryFilters get _accountRepositoryFilters =>
      AccountRepositoryFilters.only(
        onlyInStatusFavouritedBy: status,
      );

  StatusFavouriteAccountCachedListBloc({
    required this.unifediApiStatusService,
    required this.accountRepository,
    required this.status,
  });

  @override
  IUnifediApiService get unifediApi => unifediApiStatusService;

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.fine(() => 'start refreshItemsFromRemoteForPage \n'
        '\t newerThanAccount = $newerThan'
        '\t olderThanAccount = $olderThan');

    List<IUnifediApiAccount> remoteAccounts;

    remoteAccounts = await unifediApiStatusService.favouritedBy(
      statusId: status.remoteId!,
      pagination: UnifediApiPagination(
        limit: limit,
        minId: newerThan?.remoteId,
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
    _logger.finest(() => 'start loadLocalItems \n'
        '\t newerThanAccount=$newerThan'
        '\t olderThanAccount=$olderThan');

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

    _logger.finer(() => 'finish loadLocalItems accounts ${accounts.length}');

    return accounts;
  }

  static StatusFavouriteAccountCachedListBloc createFromContext(
    BuildContext context, {
    required IStatus status,
  }) =>
      StatusFavouriteAccountCachedListBloc(
        accountRepository: IAccountRepository.of(context, listen: false),
        unifediApiStatusService:
            Provider.of<IUnifediApiStatusService>(context, listen: false),
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
