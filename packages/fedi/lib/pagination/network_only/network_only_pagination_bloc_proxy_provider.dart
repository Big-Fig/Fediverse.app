import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NetworkOnlyPaginationBlocProxyProvider<
    TPage extends PaginationPage<TItem>, TItem> extends StatelessWidget {
  final Widget child;

  const NetworkOnlyPaginationBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          INetworkOnlyPaginationBloc<TPage, TItem>,
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
