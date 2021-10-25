import 'package:fedi_app/app/account/account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareToAccountBloc {
  static IShareToAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareToAccountBloc>(context, listen: listen);

  Future<bool> shareToAccount(IAccount account);

  List<IAccount>? get alreadySharedToAccounts;

  Stream<List<IAccount>?> get alreadySharedToAccountsStream;

  bool isAlreadySharedToAccount(IAccount account);

  Stream<bool> isAlreadySharedToAccountStream(IAccount account);
}
