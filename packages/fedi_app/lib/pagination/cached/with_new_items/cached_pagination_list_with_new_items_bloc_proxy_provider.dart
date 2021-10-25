import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CachedPaginationListWithNewItemsBlocProxyProvider<
    TPage extends CachedPaginationPage<TItem>, TItem> extends StatelessWidget {
  final Widget child;

  const CachedPaginationListWithNewItemsBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ICachedPaginationListWithNewItemsBloc<TPage, TItem>,
          ICachedPaginationListBloc<TPage, TItem>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<
            ICachedPaginationListWithNewItemsBloc<TPage, TItem>,
            ICachedPaginationListBloc<CachedPaginationPage<TItem>, TItem>>(
          update: (context, value, previous) => value,
          child: CachedPaginationListBlocProxyProvider<TPage, TItem>(
            child: ProxyProvider<
                ICachedPaginationListWithNewItemsBloc<TPage, TItem>,
                ICachedPaginationListWithNewItemsBloc>(
              update: (context, value, previous) => value,
              child: ProxyProvider<
                  ICachedPaginationListWithNewItemsBloc<TPage, TItem>,
                  ICachedPaginationListBloc>(
                update: (context, value, previous) => value,
                child: CachedPaginationListBlocProxyProvider<TPage, TItem>(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
}
