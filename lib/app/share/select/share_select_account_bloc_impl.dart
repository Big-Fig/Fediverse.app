import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class ShareSelectAccountBloc extends DisposableOwner
    implements IShareSelectAccountBloc {
  ShareSelectAccountBloc() {
    addDisposable(subject: targetAccountsSubject);
  }

  BehaviorSubject<List<IAccount>> targetAccountsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<IAccount> get targetAccounts => targetAccountsSubject.value;

  @override
  Stream<List<IAccount>> get targetAccountsStream =>
      targetAccountsSubject.stream;

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
    targetAccountsSubject.add(targetAccounts);
  }
}
