import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CachedPaginationListBlocProxyProvider<
    TPage extends CachedPaginationPage<TItem>, TItem> extends StatelessWidget {
  final Widget child;

  const CachedPaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ICachedPaginationListBloc<TPage, TItem>,
          IPaginationListBloc<TPage, TItem>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ICachedPaginationListBloc<TPage, TItem>,
            IPaginationListBloc<PaginationPage<TItem>, TItem>>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ICachedPaginationListBloc<TPage, TItem>,
              IPaginationListBloc>(
            update: (context, value, previous) => value,
            child: child,
          ),
        ),
      );
}
