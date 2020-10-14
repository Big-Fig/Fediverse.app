import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NetworkOnlyPaginationBlocProxyProvider<
    TPage extends PaginationPage<TItem>, TItem> extends StatelessWidget {
  final Widget child;

  NetworkOnlyPaginationBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<INetworkOnlyPaginationBloc<TPage, TItem>,
        IPaginationBloc<TPage, TItem>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<INetworkOnlyPaginationBloc<TPage, TItem>,
          IPaginationBloc<PaginationPage<TItem>, TItem>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<INetworkOnlyPaginationBloc<TPage, TItem>,
            IPaginationBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      ),
    );
  }
}
