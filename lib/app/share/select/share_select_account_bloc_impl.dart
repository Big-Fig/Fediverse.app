import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ShareSelectAccountBloc extends DisposableOwner
    implements IShareSelectAccountBloc {
  @override
  final ISelectAccountListBloc selectAccountListBloc;

  ShareSelectAccountBloc({
    @required IMyAccountBloc myAccountBloc,
    @required IAccountRepository accountRepository,
    @required IPleromaAccountService pleromaAccountService,
    @required PleromaAccountListLoader customRemoteAccountListLoader,
    @required AccountListLoader customLocalAccountListLoader,
  }) : selectAccountListBloc = SelectAccountListBloc(
            pleromaAccountService: pleromaAccountService,
            accountRepository: accountRepository,
            myAccountBloc: myAccountBloc,
            excludeMyAccount: true,
            customEmptySearchRemoteAccountListLoader:
                customRemoteAccountListLoader,
            customEmptySearchLocalAccountListLoader:
                customLocalAccountListLoader,
            followingsOnly: false) {
    addDisposable(subject: targetAccountsSubject);
    addDisposable(disposable: selectAccountListBloc);
  }

  BehaviorSubject<List<IAccount>> targetAccountsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<IAccount> get targetAccounts => targetAccountsSubject.value;

  @override
  Stream<List<IAccount>> get targetAccountsStream =>
      targetAccountsSubject.stream;

  @override
  int get targetAccountsCount => targetAccounts?.length ?? 0;

  @override
  Stream<int> get targetAccountsCountStream =>
      targetAccountsStream.map((targetAccounts) => targetAccounts?.length ?? 0);

  @override
  bool get isTargetAccountsNotEmpty => targetAccounts.isNotEmpty;

  @override
  Stream<bool> get isTargetAccountsNotEmptyStream =>
      targetAccountsStream.map((targetAccounts) => targetAccounts.isNotEmpty);

  @override
  void addAccountsToShare(List<IAccount> accounts) {
    // avoid duplicated
    removeAccountsToShare(accounts);

    targetAccounts.addAll(accounts);
    targetAccountsSubject.add(targetAccounts);
  }

  @override
  void removeAccountsToShare(List<IAccount> accounts) {
    targetAccounts.removeWhere((currentTargetAccount) {
      var firstWhere = accounts.firstWhere(
          (currentAccount) =>
              currentTargetAccount.remoteId == currentAccount.remoteId,
          orElse: () => null);

      return firstWhere != null;
    });
  }

  @override
  void changeAccounts(List<IAccount> accounts) {
    targetAccountsSubject.add([...accounts]);
  }
}
