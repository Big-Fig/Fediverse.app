import 'package:fedi/pagination/network/cached_network_pagination_bloc.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc_impl.dart';
import 'package:flutter/widgets.dart';

abstract class CachedNetworkPaginationBloc<
        TPage extends CachedNetworkPaginationPage<TItem>,
        TItem> extends PaginationBloc<TPage, TItem>
    implements ICachedNetworkPaginationBloc<TPage, TItem> {
  CachedNetworkPaginationBloc(
      {@required int itemsCountPerPage, @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  bool get isPossibleToLoadFromNetwork;

  @override
  Future<TPage> loadPage({
    @required int pageIndex,
    @required TPage previousPage,
    @required TPage nextPage,
  }) async {
    var isActuallyRefreshed;

    if (isPossibleToLoadFromNetwork) {
      isActuallyRefreshed = refreshItemsFromRemoteForPage(
          pageIndex: pageIndex,
          previousPage: previousPage,
          nextPage: nextPage,
          itemsCountPerPage: itemsCountPerPage);
    } else {
      isActuallyRefreshed = false;
    }

    List<TItem> loadedItems = await loadLocalItems(
        pageIndex: pageIndex,
        itemsCountPerPage: itemsCountPerPage,
        previousPage: previousPage,
        nextPage: nextPage);

    return createPage(
        pageIndex: pageIndex,
        loadedItems: loadedItems,
        isActuallyRefreshed: isActuallyRefreshed);
  }

  Future<bool> refreshItemsFromRemoteForPage({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required TPage previousPage,
    @required TPage nextPage,
  });

  Future<List<TItem>> loadLocalItems({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required TPage previousPage,
    @required TPage nextPage,
  });

  TPage createPage(
      {@required int pageIndex,
      @required List<TItem> loadedItems,
      @required bool isActuallyRefreshed});
}
