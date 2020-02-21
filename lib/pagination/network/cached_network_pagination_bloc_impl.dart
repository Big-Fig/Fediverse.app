import 'package:fedi/pagination/network/cached_network_pagination_bloc.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class CachedNetworkPaginationBloc<TPage extends CachedNetworkPaginationPage<TItem>, TItem>  extends PaginationBloc<TPage, TItem>
    implements ICachedNetworkPaginationBloc<TPage, TItem> {
  CachedNetworkPaginationBloc.notCachePages({@required int itemsPerPage})
      : super.notCachePages(itemsPerPage: itemsPerPage);

  CachedNetworkPaginationBloc.cachePages(
      {@required int cachedPagesCount, @required int itemsPerPage})
      : super.cachePages(
            cachedPagesCount: cachedPagesCount, itemsPerPage: itemsPerPage);

  @override
  Future<TPage> loadPage({@required int pageIndex}) {
    // TODO: implement loadPage
    throw UnimplementedError();
  }


  Future refreshData() async {
    clearCachePages();
  }

//  @override
//  Future<CachedNetworkPaginationPage<T>> loadPage({pageIndex}) {
//    // TODO: implement loadPage
//    throw UnimplementedError();
//  }
}
