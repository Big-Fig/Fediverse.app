import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger('account_follower_account_cached_list_bloc_impl.dart');

class AccountFollowerAccountCachedListBloc extends DisposableOwner
    implements IAccountCachedListBloc {
  final IUnifediApiAccountService unifediApiAccountService;
  final IAccountRepository accountRepository;
  final IAccount account;

  AccountRepositoryFilters get _accountRepositoryFilters =>
      AccountRepositoryFilters(
        onlyInAccountFollowers: account,
      );

  AccountFollowerAccountCachedListBloc({
    required this.unifediApiAccountService,
    required this.accountRepository,
    required this.account,
  });

  @override
  IUnifediApiService get unifediApi => unifediApiAccountService;

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.fine(() => 'start refreshItemsFromRemoteForPage \n'
        '\t newerThanAccount = $newerThan'
        '\t olderThanAccount = $olderThan');

    List<IUnifediApiAccount> remoteAccounts;

    remoteAccounts = await unifediApiAccountService.getAccountFollowers(
      accountId: account.remoteId,
      pagination: UnifediApiPagination(
        maxId: olderThan?.remoteId,
        minId: newerThan?.remoteId,
        limit: limit,
      ),
      withRelationship: null,
    );

    if (remoteAccounts.isNotEmpty) {
      await accountRepository.batch((batch) {
        accountRepository.upsertAllInRemoteType(
          remoteAccounts,
          batchTransaction: batch,
        );

        accountRepository.addAccountFollowers(
          accountRemoteId: account.remoteId,
          followers: remoteAccounts,
          batchTransaction: batch,
        );
      });

      return true;
    } else {
      _logger.severe(() => 'error during refreshItemsFromRemoteForPage: '
          'accounts is null');

      return false;
    }
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
      pagination: RepositoryPagination<IAccount>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [
        AccountRepositoryOrderingTermData.remoteIdDesc,
      ],
      filters: _accountRepositoryFilters,
    );

    _logger.finer(() => 'finish loadLocalItems accounts ${accounts.length}');

    return accounts;
  }

  static AccountFollowerAccountCachedListBloc createFromContext(
    BuildContext context, {
    required IAccount account,
  }) =>
      AccountFollowerAccountCachedListBloc(
        accountRepository: IAccountRepository.of(context, listen: false),
        unifediApiAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
        account: account,
      );

  static Widget provideToContext(
    BuildContext context, {
    required IAccount account,
    required Widget child,
  }) {
    return DisposableProvider<IAccountCachedListBloc>(
      create: (context) =>
          AccountFollowerAccountCachedListBloc.createFromContext(
        context,
        account: account,
      ),
      child: AccountCachedListBlocProxyProvider(
        child: child,
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
