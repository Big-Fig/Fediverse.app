import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusNetworkOnlyPaginationBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const StatusNetworkOnlyPaginationBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IStatusNetworkOnlyPaginationBloc,
          INetworkOnlyPaginationBloc<PaginationPage<IStatus>, IStatus>>(
        update: (context, value, previous) => value,
        child: NetworkOnlyPaginationBlocProxyProvider<PaginationPage<IStatus>,
            IStatus>(
          child: child,
        ),
      );
}
