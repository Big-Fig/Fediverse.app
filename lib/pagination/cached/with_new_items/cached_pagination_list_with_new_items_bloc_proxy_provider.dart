import 'package:fedi/pagination/cached/cached_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CachedPaginationListWithNewItemsBlocProxyProvider<
    TPage extends CachedPaginationPage<TItem>, TItem> extends StatelessWidget {
  final Widget child;

  CachedPaginationListWithNewItemsBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<ICachedPaginationListWithNewItemsBloc<TPage, TItem>,
        IPaginationListBloc<TPage, TItem>>(
      update: (context, value, previous) => value,
      child: CachedPaginationListBlocProxyProvider(child: child),
    );
  }
}
