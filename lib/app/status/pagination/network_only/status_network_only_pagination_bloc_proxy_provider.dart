import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusNetworkOnlyPaginationBlocProxyProvider extends StatelessWidget {
  final Widget child;

  StatusNetworkOnlyPaginationBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IStatusNetworkOnlyPaginationBloc,
        INetworkOnlyPaginationBloc<PaginationPage<IStatus>, IStatus>>(
      update: (context, value, previous) => value,
      child: NetworkOnlyPaginationBlocProxyProvider(
        child: child,
      ),
    );
  }
}
