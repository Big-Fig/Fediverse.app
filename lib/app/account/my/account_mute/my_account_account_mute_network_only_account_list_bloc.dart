import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountAccountMuteNetworkOnlyAccountListBloc
    implements IDisposable, IAccountNetworkOnlyListBloc {
  static IMyAccountAccountMuteNetworkOnlyAccountListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountAccountMuteNetworkOnlyAccountListBloc>(
        context,
        listen: listen,
      );

  Future<void> changeAccountMute({
    required IAccount? account,
    required bool notifications,
    required Duration? duration,
  });

  Future<void> removeAccountMute({required IAccount? account});

  Future<void> addAccountMute({required IAccount account});
}
