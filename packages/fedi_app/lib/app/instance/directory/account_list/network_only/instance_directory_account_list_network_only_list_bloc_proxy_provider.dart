import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceDirectoryAccountListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const InstanceDirectoryAccountListNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

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
