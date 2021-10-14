import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceDirectoryBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const InstanceDirectoryBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IInstanceDirectoryBloc, IInstanceBloc>(
        update: (context, bloc, previous) => bloc,
        child: ProxyProvider<IInstanceDirectoryBloc,
            IInstanceDirectoryAccountListNetworkOnlyListBloc>(
          update: (context, bloc, previous) =>
              bloc.instanceDirectoryAccountListNetworkOnlyListBloc,
          child: ProxyProvider<IInstanceDirectoryBloc, IAccountListBloc>(
            update: (context, bloc, previous) =>
                bloc.instanceDirectoryAccountListNetworkOnlyListBloc,
            child: ProxyProvider<IInstanceDirectoryBloc,
                IAccountNetworkOnlyPaginationBloc>(
              update: (context, bloc, previous) =>
                  bloc.instanceDirectoryAccountListNetworkOnlyPaginationBloc,
              child: ProxyProvider<IInstanceDirectoryBloc,
                  IAccountPaginationListBloc>(
                update: (context, bloc, previous) =>
                    bloc.accountPaginationListBloc,
                child: child,
              ),
            ),
          ),
        ),
      );
}
