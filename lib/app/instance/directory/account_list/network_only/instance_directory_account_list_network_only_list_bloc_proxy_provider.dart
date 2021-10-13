import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceDirectoryAccountListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  InstanceDirectoryAccountListNetworkOnlyListBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IInstanceDirectoryAccountListNetworkOnlyListBloc,
          INetworkOnlyListBloc<IAccount>>(
        update: (context, value, previous) => value,
        child: AccountPaginationListBlocProxyProvider(
          child: child,
        ),
      );
}
