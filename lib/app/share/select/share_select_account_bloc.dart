import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareSelectAccountBloc extends IDisposable {
  static IShareSelectAccountBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IShareSelectAccountBloc>(context, listen: listen);

  ISelectAccountListBloc get selectAccountListBloc;

  List<IAccount> get targetAccounts;

  Stream<List<IAccount>> get targetAccountsStream;

  int get targetAccountsCount;

  Stream<int> get targetAccountsCountStream;

  bool get isTargetAccountsNotEmpty;

  Stream<bool> get isTargetAccountsNotEmptyStream;

  void addAccountsToShare(List<IAccount> accounts);

  void removeAccountsToShare(List<IAccount> accounts);

  void changeAccounts(List<IAccount> accounts);
}
