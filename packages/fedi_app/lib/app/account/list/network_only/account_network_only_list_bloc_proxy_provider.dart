import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountNetworkOnlyListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AccountNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAccountNetworkOnlyListBloc, INetworkOnlyListBloc<IAccount>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IAccountNetworkOnlyListBloc, IAccountListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
