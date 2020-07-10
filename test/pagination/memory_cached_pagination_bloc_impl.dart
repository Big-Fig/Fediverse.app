import 'package:fedi/pagination/cached/cached_pagination_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/widgets.dart';

import 'pagination_model_helper.dart';

class MemoryCachedPaginationBloc<TItem>
    extends CachedPaginationBloc<CachedPaginationPage<TItem>, TItem> {
  final List<TItem> items;

  MemoryCachedPaginationBloc(
      {@required this.items,
      @required int maximumCachedPagesCount,
      @required int itemsCountPerPage})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  static MemoryCachedPaginationBloc<TestPaginationItem> createTestWithSize(
      {@required int size,
      @required int maximumCachedPagesCount,
      @required int itemsCountPerPage}) {
    return MemoryCachedPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        itemsCountPerPage: itemsCountPerPage,
        items: List.generate(size, (index) => TestPaginationItem(index)));
  }

  @override
  CachedPaginationPage<TItem> createPage(
          {int pageIndex, List<TItem> loadedItems, bool isActuallyRefreshed}) =>
      CachedPaginationPage<TItem>(
          isActuallyRefreshedFromRemote: isActuallyRefreshed,
          requestedLimitPerPage: itemsCountPerPage,
          values: loadedItems,
          pageIndex: pageIndex);

  @override
  bool get isPossibleToLoadFromNetwork => true;

  @override
  Future<List<TItem>> loadLocalItems(
      {int pageIndex,
      int itemsCountPerPage,
      CachedPaginationPage<TItem> olderPage,
      CachedPaginationPage<TItem> newerPage}) async {
    var requiredStartItemIndex = pageIndex * itemsCountPerPage;
    var requiredEndItemIndex = (pageIndex + 1) * itemsCountPerPage;
    List<TItem> values;

    if (requiredStartItemIndex >= items.length) {
      values = [];
    } else {
      if (requiredEndItemIndex > items.length) {
        requiredEndItemIndex = items.length;
      }
      values =
          items.sublist(requiredStartItemIndex, requiredEndItemIndex).toList();
    }
    return values;
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {int pageIndex,
      int itemsCountPerPage,
      CachedPaginationPage<TItem> olderPage,
      CachedPaginationPage<TItem> newerPage}) async {
    return true;
  }
}
