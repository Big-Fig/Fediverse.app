import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusNetworkOnlyListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  StatusNetworkOnlyListBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IStatusNetworkOnlyListBloc,
        INetworkOnlyListBloc<IStatus?>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IStatusNetworkOnlyListBloc, IStatusListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
