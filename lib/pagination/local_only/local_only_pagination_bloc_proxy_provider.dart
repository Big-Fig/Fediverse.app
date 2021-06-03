import 'package:fedi/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LocalOnlyPaginationBlocProxyProvider<TPage extends PaginationPage<TItem>,
    TItem> extends StatelessWidget {
  final Widget child;

  LocalOnlyPaginationBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<ILocalOnlyPaginationBloc<TPage, TItem>,
        IPaginationBloc<TPage, TItem>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<ILocalOnlyPaginationBloc<TPage, TItem>,
          IPaginationBloc<PaginationPage<TItem>, TItem>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ILocalOnlyPaginationBloc<TPage, TItem>,
            IPaginationBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      ),
    );
  }
}
