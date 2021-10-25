import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusNetworkOnlyListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const StatusNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IStatusNetworkOnlyListBloc, INetworkOnlyListBloc<IStatus>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IStatusNetworkOnlyListBloc, IStatusListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
