import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc_impl.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

typedef AccountListLoader = Future<List<IAccount>> Function({
  required int? limit,
  required IAccount? newerThan,
  required IAccount? olderThan,
});

typedef UnifediApiAccountListLoader = Future<List<IUnifediApiAccount>>
    Function({
  required int? limit,
  required IAccount? newerThan,
  required IAccount? olderThan,
});

var _logger = Logger('select_account_list_bloc_impl.dart');

class SelectAccountListBloc extends DisposableOwner
    implements ISelectAccountListBloc {
  final IUnifediApiAccountService pleromaAuthAccountService;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final bool excludeMyAccount;
  final bool followingsOnly;

  final StreamController<IAccount> accountSelectedStreamController =
      StreamController<IAccount>.broadcast();

  @override
  Stream<IAccount> get accountSelectedStream =>
      accountSelectedStreamController.stream;

  final UnifediApiAccountListLoader? customEmptySearchRemoteAccountListLoader;
  final AccountListLoader? customEmptySearchLocalAccountListLoader;
  @override
  ISearchInputBloc searchInputBloc;

  String? get searchText => searchInputBloc.confirmedSearchTerm;

  SelectAccountListBloc({
    required this.pleromaAuthAccountService,
    required this.accountRepository,
    required this.myAccountBloc,
    required this.excludeMyAccount,
    required this.customEmptySearchRemoteAccountListLoader,
    required this.customEmptySearchLocalAccountListLoader,
    required this.followingsOnly,
  }) : searchInputBloc = SearchInputBloc(
          initialQuery: null,
        ) {
    searchInputBloc.disposeWith(this);
    accountSelectedStreamController.disposeWith(this);
  }

  @override
  IUnifediApiService get unifediApi => pleromaAuthAccountService;

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    List<IUnifediApiAccount> remoteAccounts;

    var searchTermExist = searchText?.isNotEmpty == true;
    if (searchTermExist) {
      var following = followingsOnly;
      remoteAccounts = await pleromaAuthAccountService.search(
        query: searchText!,
        resolve: true,
        following: following,
        limit: null,
      );

      await accountRepository.batch((batch) {
        accountRepository.upsertAllInRemoteType(
          remoteAccounts,
          batchTransaction: batch,
        );
        if (following) {
          accountRepository.addAccountFollowings(
            accountRemoteId: myAccountBloc.account.remoteId,
            followings: remoteAccounts.toUnifediApiAccountList(),
            batchTransaction: batch,
          );
        }
      });
    } else {
      if (customEmptySearchRemoteAccountListLoader != null) {
        remoteAccounts = await customEmptySearchRemoteAccountListLoader!(
          limit: limit,
          olderThan: olderThan,
          newerThan: newerThan,
        );

        await accountRepository.upsertAllInRemoteType(
          remoteAccounts,
          batchTransaction: null,
        );
      } else {
        remoteAccounts = await defaultEmptySearchRemoteAccountListLoader(
          limit: limit,
          olderThan: olderThan,
          newerThan: newerThan,
        );

        await accountRepository.batch((batch) {
          accountRepository
            ..upsertAllInRemoteType(
              remoteAccounts,
              batchTransaction: batch,
            )
            ..addAccountFollowings(
              accountRemoteId: myAccountBloc.account.remoteId,
              followings: remoteAccounts.toUnifediApiAccountList(),
              batchTransaction: batch,
            );
        });
      }
    }
  }

  Future<List<IUnifediApiAccount>> defaultEmptySearchRemoteAccountListLoader({
    required IAccount? olderThan,
    required IAccount? newerThan,
    required int? limit,
  }) async =>
      pleromaAuthAccountService.getAccountFollowings(
        pagination: UnifediApiPagination(
          minId: newerThan?.remoteId,
          maxId: olderThan?.remoteId,
          limit: limit,
        ),
        withRelationship: null,
        accountId: myAccountBloc.account.remoteId,
      );

  @override
  Future<List<IAccount>> loadLocalItems({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.finest(
      () => 'start loadLocalItems \n'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    List<IAccount> accounts;
    var searchTermExist = searchText?.isNotEmpty == true;
    if (searchTermExist) {
      IAccount? onlyInAccountFollowing;
      if (followingsOnly) {
        onlyInAccountFollowing = myAccountBloc.account;
      }
      accounts = await accountRepository.findAllInAppType(
        filters: AccountRepositoryFilters.only(
          onlyInAccountFollowing: onlyInAccountFollowing,
          searchQuery: searchText,
        ),
        pagination: RepositoryPagination<IAccount>(
          olderThanItem: olderThan,
          newerThanItem: newerThan,
          limit: limit,
        ),
        orderingTerms: [
          AccountRepositoryOrderingTermData.remoteIdDesc,
        ],
      );
    } else {
      if (customEmptySearchLocalAccountListLoader != null) {
        accounts = await customEmptySearchLocalAccountListLoader!(
          limit: limit,
          olderThan: olderThan,
          newerThan: newerThan,
        );
      } else {
        accounts = await defaultEmptySearchLocalAccountListLoader(
          limit: limit,
          olderThan: olderThan,
          newerThan: newerThan,
        );
      }
    }

    if (excludeMyAccount) {
      accounts = accounts.where((account) {
        bool valid;
        if (excludeMyAccount) {
          valid = !myAccountBloc.checkAccountIsMe(account);
        } else {
          valid = true;
        }

        if (valid && searchText != null) {
          valid &= account.acct.contains(searchText!);
        }

        return valid;
      }).toList();
    }

    _logger.finer(() => 'finish loadLocalItems accounts ${accounts.length}');

    return accounts;
  }

  Future<List<IAccount>> defaultEmptySearchLocalAccountListLoader({
    required IAccount? olderThan,
    required IAccount? newerThan,
    required int? limit,
  }) async =>
      accountRepository.findAllInAppType(
        filters: AccountRepositoryFilters.only(
          onlyInAccountFollowing: myAccountBloc.account,
        ),
        pagination: RepositoryPagination<IAccount>(
          olderThanItem: olderThan,
          newerThanItem: newerThan,
          limit: limit,
        ),
        orderingTerms: [AccountRepositoryOrderingTermData.remoteIdDesc],
      );

  static SelectAccountListBloc createFromContext(
    BuildContext context, {
    required bool excludeMyAccount,
    required UnifediApiAccountListLoader? customRemoteAccountListLoader,
    required AccountListLoader? customLocalAccountListLoader,
    required bool followingsOnly,
  }) =>
      SelectAccountListBloc(
        excludeMyAccount: excludeMyAccount,
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAuthAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
        customEmptySearchRemoteAccountListLoader: customRemoteAccountListLoader,
        customEmptySearchLocalAccountListLoader: customLocalAccountListLoader,
        followingsOnly: followingsOnly,
      );

  static Widget provideToContext(
    BuildContext context, {
    required bool excludeMyAccount,
    required bool followingsOnly,
    required Widget child,
    required UnifediApiAccountListLoader? customRemoteAccountListLoader,
    required AccountListLoader? customLocalAccountListLoader,
  }) =>
      DisposableProvider<ISelectAccountListBloc>(
        create: (context) => SelectAccountListBloc.createFromContext(
          context,
          followingsOnly: followingsOnly,
          excludeMyAccount: excludeMyAccount,
          customRemoteAccountListLoader: customRemoteAccountListLoader,
          customLocalAccountListLoader: customLocalAccountListLoader,
        ),
        child: SelectAccountListBlocProxyProvider(child: child),
      );

  @override
  void onAccountSelected(IAccount account) {
    accountSelectedStreamController.add(account);
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
