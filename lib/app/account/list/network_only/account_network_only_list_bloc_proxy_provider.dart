import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountNetworkOnlyListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  AccountNetworkOnlyListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountNetworkOnlyListBloc,
        INetworkOnlyListBloc<IAccount>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IAccountNetworkOnlyListBloc, IAccountListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
