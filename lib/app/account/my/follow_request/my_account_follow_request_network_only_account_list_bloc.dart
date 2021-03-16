import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountFollowRequestNetworkOnlyAccountListBloc
    implements IDisposable, IAccountNetworkOnlyListBloc {
  static IMyAccountFollowRequestNetworkOnlyAccountListBloc of(
          BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountFollowRequestNetworkOnlyAccountListBloc>(context,
          listen: listen);

  Future acceptFollowRequest({required IAccount account});

  Future rejectFollowRequest({required IAccount account});
}
