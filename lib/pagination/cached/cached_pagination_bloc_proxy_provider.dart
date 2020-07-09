import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CachedPaginationBlocProxyProvider<
    TPage extends CachedPaginationPage<TItem>, TItem> extends StatelessWidget {
  final Widget child;

  CachedPaginationBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<ICachedPaginationBloc<TPage, TItem>,
        IPaginationBloc<TPage, TItem>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<ICachedPaginationBloc<TPage, TItem>,
          IPaginationBloc<PaginationPage<TItem>, TItem>>(
        update: (context, value, previous) => value,
        child:
            ProxyProvider<ICachedPaginationBloc<TPage, TItem>, IPaginationBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      ),
    );
  }
}
