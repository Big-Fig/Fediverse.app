import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_model.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc_impl.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_list_service_impl.dart");

class SelectAccountListService extends DisposableOwner
    implements ISelectAccountListService {
  final IPleromaAccountService pleromaAccountService;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final bool excludeMyAccount;
  @override
  ISearchInputBloc searchInputBloc;

  String get searchText => searchInputBloc.searchText;

  SelectAccountListService({
    @required this.pleromaAccountService,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.excludeMyAccount,
  }) : searchInputBloc = SearchInputBloc() {
    addDisposable(disposable: searchInputBloc);

    // todo: listen search query
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

    try {
      List<IPleromaAccount> remoteAccounts;

      if (searchText?.isNotEmpty == true) {
        remoteAccounts = await pleromaAccountService.search(query: searchText);
      } else {
        remoteAccounts = await pleromaAccountService.getAccountFollowings(
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit,
            accountRemoteId: myAccountBloc.account.remoteId);
      }

      if (remoteAccounts != null) {
        await accountRepository.upsertRemoteAccounts(remoteAccounts,
            conversationRemoteId: null);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "accounts is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
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

    var accounts = await accountRepository.getAccounts(
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
        searchQuery: searchText);

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

  static SelectAccountListService createFromContext(BuildContext context,
          {@required bool excludeMyAccount}) =>
      SelectAccountListService(
          excludeMyAccount: excludeMyAccount,
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false));
}
