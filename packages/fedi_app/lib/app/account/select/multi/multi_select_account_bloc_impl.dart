import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/select/multi/multi_select_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('multi_select_account_page.dart');

class MultiSelectAccountBloc extends DisposableOwner
    implements IMultiSelectAccountBloc {
  final BehaviorSubject<List<IAccount>> selectedAccountsSubject =
      BehaviorSubject.seeded([]);

  MultiSelectAccountBloc() {
    selectedAccountsSubject.disposeWith(this);
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
  bool get isSomethingSelected => selectedAccounts.isNotEmpty;

  @override
  Stream<bool> get isSomethingSelectedStream => selectedAccountsStream
      .map((selectedAccounts) => selectedAccounts.isNotEmpty);

  @override
  List<IAccount> get selectedAccounts => selectedAccountsSubject.value;

  @override
  Stream<List<IAccount>> get selectedAccountsStream =>
      selectedAccountsSubject.stream;

  static MultiSelectAccountBloc createFromContext(
    BuildContext context, {
    AccountsListCallback? accountsListSelectedCallback,
  }) {
    var multiSelectAccountBloc = MultiSelectAccountBloc();

    if (accountsListSelectedCallback != null) {
      multiSelectAccountBloc.selectedAccountsStream.listen(
        (selectedAccounts) {
          accountsListSelectedCallback(context, selectedAccounts);
        },
      ).disposeWith(multiSelectAccountBloc);
    }

    return multiSelectAccountBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    AccountsListCallback? accountsListSelectedCallback,
  }) =>
      DisposableProvider<IMultiSelectAccountBloc>(
        create: (context) => MultiSelectAccountBloc.createFromContext(
          context,
          accountsListSelectedCallback: accountsListSelectedCallback,
        ),
        child: child,
      );

  bool _calculateIsAccountSelected(
    List<IAccount>? selectedAccounts,
    IAccount account,
  ) =>
      selectedAccounts?.firstWhereOrNull(
        (currentAccount) => account.remoteId == currentAccount.remoteId,
      ) !=
      null;

  @override
  void addAccountSelection(IAccount account) {
    selectedAccounts.add(account);

    _logger.finest(() => 'addAccountSelection $account');
    onSelectionChanged();
  }

  void onSelectionChanged() {
    selectedAccountsSubject.add(selectedAccounts);
    _logger.finest(
      () => 'onSelectionChanged ${selectedAccounts.length} $selectedAccounts',
    );
  }

  @override
  void removeAccountSelection(IAccount account) {
    _logger.finest(() => 'removeAccountSelection $account');
    selectedAccounts
        .removeWhere((currentAccount) => account.remoteId == account.remoteId);
    onSelectionChanged();
  }
}
