import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMultiSelectAccountBloc implements IDisposable {
  static IMultiSelectAccountBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMultiSelectAccountBloc>(context, listen: listen);

  List<IAccount> get selectedAccounts;

  Stream<List<IAccount>> get selectedAccountsStream;

  bool get isSomethingSelected;

  Stream<bool> get isSomethingSelectedStream;

  bool isAccountSelected(IAccount account);

  Stream<bool> isAccountSelectedStream(
    IAccount account,
  );

  void addAccountSelection(IAccount account);

  void removeAccountSelection(IAccount account);
}
