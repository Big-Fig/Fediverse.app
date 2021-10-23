import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountAccountBlockNetworkOnlyAccountListBloc
    implements IDisposable, IAccountNetworkOnlyListBloc {
  static IMyAccountAccountBlockNetworkOnlyAccountListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountAccountBlockNetworkOnlyAccountListBloc>(
        context,
        listen: listen,
      );

  Future<void> addAccountBlock({
    required IAccount account,
  });

  Future<void> removeAccountBlock({
    required IAccount account,
  });
}
