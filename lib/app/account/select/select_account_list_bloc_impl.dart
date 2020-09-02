import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_proxy_provider.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

typedef AccountListLoader = Future<List<IAccount>> Function({
  @required int limit,
  @required IAccount newerThan,
  @required IAccount olderThan,
});

typedef PleromaAccountListLoader = Future<List<IPleromaAccount>> Function({
  @required int limit,
  @required IAccount newerThan,
  @required IAccount olderThan,
});

var _logger = Logger("select_account_list_bloc_impl.dart");

class SelectAccountListBloc extends DisposableOwner
    implements ISelectAccountListBloc {
  final IPleromaAccountService pleromaAccountService;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final bool excludeMyAccount;

  final PleromaAccountListLoader customDefaultRemoteAccountListLoader;
  final AccountListLoader customDefaultLocalAccountListLoader;
  @override
  ISearchInputBloc searchInputBloc;

  String get searchText => searchInputBloc.confirmedSearchTerm;

  SelectAccountListBloc({
    @required this.pleromaAccountService,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.excludeMyAccount,
    @required this.customDefaultRemoteAccountListLoader,
    @required this.customDefaultLocalAccountListLoader,
  }) : searchInputBloc = SearchInputBloc() {
    addDisposable(disposable: searchInputBloc);
  }

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IAccount newerThan,
      @required IAccount olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaAccount> remoteAccounts;

    var searchTermExist = searchText?.isNotEmpty == true;
    if (searchTermExist) {
      remoteAccounts =
          await pleromaAccountService.search(query: searchText, resolve: true);
    } else {
      if (customDefaultRemoteAccountListLoader != null) {
        remoteAccounts = await customDefaultRemoteAccountListLoader(
          limit: limit,
          olderThan: olderThan,
          newerThan: newerThan,
        );
      } else {
        remoteAccounts = await pleromaAccountService.getAccountFollowings(
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit,
            accountRemoteId: myAccountBloc.account.remoteId);
      }
    }

    if (remoteAccounts != null) {
      await accountRepository.upsertRemoteAccounts(remoteAccounts,
          conversationRemoteId: null, chatRemoteId: null);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "accounts is null");
      return false;
    }
  }

  @override
  Future<List<IAccount>> loadLocalItems(
      {@required int limit,
      @required IAccount newerThan,
      @required IAccount olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    List<IAccount> accounts;
    var searchTermExist = searchText?.isNotEmpty == true;
    if (searchTermExist) {
      accounts = await accountRepository.getAccounts(
          olderThanAccount: olderThan,
          newerThanAccount: newerThan,
          limit: limit,
          offset: null,
          orderingTermData: AccountOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: AccountOrderByType.remoteId),
          onlyInConversation: null,
          onlyInAccountFollowers: null,
          onlyInStatusFavouritedBy: null,
          onlyInAccountFollowing: null,
          onlyInStatusRebloggedBy: null,
          searchQuery: searchText,
          onlyInChat: null);
    } else {
      if (customDefaultLocalAccountListLoader != null) {
        accounts = await customDefaultLocalAccountListLoader(
          limit: limit,
          olderThan: olderThan,
          newerThan: newerThan,
        );
      } else {
        accounts = await accountRepository.getAccounts(
            olderThanAccount: olderThan,
            newerThanAccount: newerThan,
            limit: limit,
            offset: null,
            orderingTermData: AccountOrderingTermData(
                orderingMode: OrderingMode.desc,
                orderByType: AccountOrderByType.remoteId),
            onlyInConversation: null,
            onlyInAccountFollowers: null,
            onlyInStatusFavouritedBy: null,
            onlyInAccountFollowing: null,
            onlyInStatusRebloggedBy: null,
            searchQuery: null,
            onlyInChat: null);
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
          valid &= account.acct.contains(searchText);
        }
        return valid;
      }).toList();
    }

    _logger.finer(() => "finish loadLocalItems accounts ${accounts.length}");
    return accounts;
  }

  static SelectAccountListBloc createFromContext(
    BuildContext context, {
    @required bool excludeMyAccount,
    @required PleromaAccountListLoader customDefaultRemoteAccountListLoader,
    @required AccountListLoader customDefaultLocalAccountListLoader,
  }) =>
      SelectAccountListBloc(
        excludeMyAccount: excludeMyAccount,
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        customDefaultRemoteAccountListLoader:
            customDefaultRemoteAccountListLoader,
        customDefaultLocalAccountListLoader:
            customDefaultLocalAccountListLoader,
      );

  static Widget provideToContext(
    BuildContext context, {
    @required bool excludeMyAccount,
    @required Widget child,
    @required PleromaAccountListLoader customDefaultRemoteAccountListLoader,
    @required AccountListLoader customDefaultLocalAccountListLoader,
  }) {
    return DisposableProvider<ISelectAccountListBloc>(
      create: (context) => SelectAccountListBloc.createFromContext(
        context,
        excludeMyAccount: excludeMyAccount,
        customDefaultRemoteAccountListLoader:
            customDefaultRemoteAccountListLoader,
        customDefaultLocalAccountListLoader:
            customDefaultLocalAccountListLoader,
      ),
      child: SelectAccountListBlocProxyProvider(child: child),
    );
  }
}
