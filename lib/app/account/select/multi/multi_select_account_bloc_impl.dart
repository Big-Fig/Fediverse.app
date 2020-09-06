import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class MultiSelectAccountBloc extends DisposableOwner
    implements IMultiSelectAccountBloc {
  final BehaviorSubject<List<IAccount>> selectedAccountsSubject =
      BehaviorSubject.seeded([]);

  MultiSelectAccountBloc() {
    addDisposable(subject: selectedAccountsSubject);
  }

  @override
  bool isAccountSelected(IAccount account) => _calculateIsAccountSelected(
        selectedAccounts,
        account,
      );

  @override
  Stream<bool> isAccountSelectedStream(IAccount account) =>
      selectedAccountsStream.map(
        (selectedAccounts) => _calculateIsAccountSelected(
          selectedAccounts,
          account,
        ),
      );

  @override
  bool get isSomethingSelected => selectedAccounts?.isNotEmpty == true;

  @override
  Stream<bool> get isSomethingSelectedStream => selectedAccountsStream
      .map((selectedAccounts) => selectedAccounts?.isNotEmpty == true);

  @override
  List<IAccount> get selectedAccounts => selectedAccountsSubject.value;

  @override
  Stream<List<IAccount>> get selectedAccountsStream =>
      selectedAccountsSubject.stream;

  static MultiSelectAccountBloc createFromContext(BuildContext context) =>
      MultiSelectAccountBloc();

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<IMultiSelectAccountBloc>(
      create: (context) => MultiSelectAccountBloc.createFromContext(context),
      child: child,
    );
  }

  bool _calculateIsAccountSelected(
    List<IAccount> selectedAccounts,
    IAccount account,
  ) =>
      selectedAccounts?.firstWhere(
          (currentAccount) => account.remoteId == currentAccount.remoteId,
          orElse: () => null) !=
      null;

  @override
  void addAccountSelection(IAccount account) {
    selectedAccounts.add(account);
    selectedAccountsSubject.add(selectedAccounts);
  }

  @override
  void removeAccountSelection(IAccount account) {
    selectedAccounts.removeWhere((currentAccount) => account.remoteId ==
        account.remoteId);
    selectedAccountsSubject.add(selectedAccounts);
  }

}
