import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountFollowRequestNetworkOnlyAccountListBloc
    implements IDisposable, IAccountNetworkOnlyListBloc {
  static IMyAccountFollowRequestNetworkOnlyAccountListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountFollowRequestNetworkOnlyAccountListBloc>(
        context,
        listen: listen,
      );

  Future<void> acceptFollowRequest({required IAccount account});

  Future<void> rejectFollowRequest({required IAccount account});
}
