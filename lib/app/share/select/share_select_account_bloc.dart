import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareSelectAccountBloc extends Disposable {

  static IShareSelectAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareSelectAccountBloc>(context, listen: listen);

  List<IAccount> get targetAccounts;

  Stream<List<IAccount>> get targetAccountsStream;

  bool get isTargetAccountsNotEmpty;

  Stream<bool> get isTargetAccountsNotEmptyStream;

  void addAccountsToShare(List<IAccount> accounts);

  void removeAccountsToShare(List<IAccount> accounts);
}
