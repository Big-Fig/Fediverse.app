import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_model.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("account_list_service_impl.dart");

class SelectAccountListService extends DisposableOwner
    implements ISelectAccountListService {
  final IPleromaAccountService pleromaAccountService;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final bool excludeMyAccount;
  final TextEditingController searchTextEditingController =
      TextEditingController();

  // ignore: close_sinks
  final BehaviorSubject<String> searchTextSubject = BehaviorSubject.seeded("");

  @override
  String get searchText => searchTextSubject.value;

  @override
  Stream<String> get searchTextStream => searchTextSubject.stream;

  SelectAccountListService({
    @required this.pleromaAccountService,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.excludeMyAccount,
  }) {
    addDisposable(subject: searchTextSubject);
    addDisposable(textEditingController: searchTextEditingController);

    var listener = () {
      onSearchTextChanged();
    };
    searchTextEditingController.addListener(listener);
    addDisposable(disposable: CustomDisposable(() {
      searchTextEditingController.removeListener(listener);
    }));

  }

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IAccount newerThanAccount,
      @required IAccount olderThanAccount}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThanAccount = $newerThanAccount"
        "\t olderThanAccount = $olderThanAccount");

    try {
      List<IPleromaAccount> remoteAccounts;

      if (searchText?.isNotEmpty == true) {
        remoteAccounts = await pleromaAccountService.search(query: searchText);
      } else {
        remoteAccounts = await pleromaAccountService.getAccountFollowings(
            maxId: olderThanAccount?.remoteId,
            sinceId: newerThanAccount?.remoteId,
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
      @required IAccount newerThanAccount,
      @required IAccount olderThanAccount}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThanAccount=$newerThanAccount"
        "\t olderThanAccount=$olderThanAccount");

    var accounts = await accountRepository.getAccounts(
        olderThanAccount: olderThanAccount,
        newerThanAccount: newerThanAccount,
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

  @override
  clearSearch() {
    searchTextEditingController.text = "";
  }

  void onSearchTextChanged() {
    var oldText = searchTextSubject.value ?? "";
    var newText = searchTextEditingController.text ?? "";
    if (newText != oldText) {
      searchTextSubject.add(newText);
    }
  }
}
