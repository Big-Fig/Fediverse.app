import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

typedef AccountListLoader = Future<List<IAccount>> Function({
  required int? limit,
  required IAccount? newerThan,
  required IAccount? olderThan,
});

typedef PleromaAccountListLoader = Future<List<IPleromaApiAccount>> Function({
  required int? limit,
  required IAccount? newerThan,
  required IAccount? olderThan,
});

var _logger = Logger("select_account_list_bloc_impl.dart");

class SelectAccountListBloc extends DisposableOwner
    implements ISelectAccountListBloc {
  final IPleromaApiAuthAccountService pleromaAuthAccountService;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final bool excludeMyAccount;
  final bool followingsOnly;

  final StreamController<IAccount> accountSelectedStreamController =
      StreamController<IAccount>.broadcast();

  @override
  Stream<IAccount> get accountSelectedStream =>
      accountSelectedStreamController.stream;

  final PleromaAccountListLoader? customEmptySearchRemoteAccountListLoader;
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
  }) : searchInputBloc = SearchInputBloc() {
    addDisposable(disposable: searchInputBloc);
    addDisposable(streamController: accountSelectedStreamController);
  }

  @override
  IPleromaApi get pleromaApi => pleromaAuthAccountService;

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaApiAccount> remoteAccounts;

    var searchTermExist = searchText?.isNotEmpty == true;
    if (searchTermExist) {
      var following = followingsOnly;
      remoteAccounts = await pleromaAuthAccountService.search(
        query: searchText!,
        resolve: true,
        following: following,
      );

      await accountRepository.batch((batch) {
        accountRepository.upsertAllInRemoteType(
          remoteAccounts,
          batchTransaction: batch,
        );
        if (following) {
          accountRepository.addAccountFollowings(
            accountRemoteId: myAccountBloc.account.remoteId,
            followings: remoteAccounts.toPleromaApiAccounts(),
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
          accountRepository.upsertAllInRemoteType(
            remoteAccounts,
            batchTransaction: batch,
          );
          accountRepository.addAccountFollowings(
            accountRemoteId: myAccountBloc.account.remoteId,
            followings: remoteAccounts.toPleromaApiAccounts(),
            batchTransaction: batch,
          );
        });
      }
    }
  }

  Future<List<IPleromaApiAccount>> defaultEmptySearchRemoteAccountListLoader({
    required IAccount? olderThan,
    required IAccount? newerThan,
    required int? limit,
  }) async {
    // my account followings by default
    return await pleromaAuthAccountService.getAccountFollowings(
      pagination: PleromaApiPaginationRequest(
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
        limit: limit,
      ),
      accountRemoteId: myAccountBloc.account.remoteId,
    );
  }

  @override
  Future<List<IAccount>> loadLocalItems({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    List<IAccount> accounts;
    var searchTermExist = searchText?.isNotEmpty == true;
    if (searchTermExist) {
      var onlyInAccountFollowing;
      if (followingsOnly) {
        onlyInAccountFollowing = myAccountBloc.account;
      }
      accounts = await accountRepository.findAllInAppType(
        filters: AccountRepositoryFilters(
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

    _logger.finer(() => "finish loadLocalItems accounts ${accounts.length}");

    return accounts;
  }

  Future<List<IAccount>> defaultEmptySearchLocalAccountListLoader({
    required IAccount? olderThan,
    required IAccount? newerThan,
    required int? limit,
  }) async {
    return await accountRepository.findAllInAppType(
      filters: AccountRepositoryFilters(
        onlyInAccountFollowing: myAccountBloc.account,
      ),
      pagination: RepositoryPagination<IAccount>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [AccountRepositoryOrderingTermData.remoteIdDesc],
    );
  }

  static SelectAccountListBloc createFromContext(
    BuildContext context, {
    required bool excludeMyAccount,
    required PleromaAccountListLoader? customRemoteAccountListLoader,
    required AccountListLoader? customLocalAccountListLoader,
    required bool followingsOnly,
  }) =>
      SelectAccountListBloc(
        excludeMyAccount: excludeMyAccount,
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAuthAccountService:
            IPleromaApiAuthAccountService.of(context, listen: false),
        customEmptySearchRemoteAccountListLoader: customRemoteAccountListLoader,
        customEmptySearchLocalAccountListLoader: customLocalAccountListLoader,
        followingsOnly: followingsOnly,
      );

  static Widget provideToContext(
    BuildContext context, {
    required bool excludeMyAccount,
    required bool followingsOnly,
    required Widget child,
    required PleromaAccountListLoader? customRemoteAccountListLoader,
    required AccountListLoader? customLocalAccountListLoader,
  }) {
    return DisposableProvider<ISelectAccountListBloc>(
      create: (context) => SelectAccountListBloc.createFromContext(
        context,
        followingsOnly: followingsOnly,
        excludeMyAccount: excludeMyAccount,
        customRemoteAccountListLoader: customRemoteAccountListLoader,
        customLocalAccountListLoader: customLocalAccountListLoader,
      ),
      child: SelectAccountListBlocProxyProvider(child: child),
    );
  }

  @override
  void onAccountSelected(IAccount account) {
    accountSelectedStreamController.add(account);
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
