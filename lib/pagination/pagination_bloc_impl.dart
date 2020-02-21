import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class PaginationBloc<TPage extends PaginationPage<TItem>, TItem> extends DisposableOwner
    implements IPaginationBloc<TPage, TItem> {
  final int maximumCachedPagesCount;
  bool get isCacheEnabled =>
      maximumCachedPagesCount != null && maximumCachedPagesCount > 0;
  bool get isMaximumPagesInCacheReached =>
      cachedPagesCount >= maximumCachedPagesCount;
  int get cachedPagesCount => indexToCachedPageMap.length;
  final int itemsPerPage;
  final Map<int, TPage> indexToCachedPageMap = {};

  // ignore: close_sinks
  StreamController<bool> dataInvalidatedStreamController = StreamController();
  Stream<bool> get dataInvalidatedStream => dataInvalidatedStreamController.stream;

  PaginationBloc._private(
      {@required this.maximumCachedPagesCount, @required this.itemsPerPage}) {
    assert(itemsPerPage != null && itemsPerPage > 0);
    addDisposable(disposable: CustomDisposable(() {
      dataInvalidatedStreamController.close();
    }));
  }

  PaginationBloc.cachePages(
      {@required int cachedPagesCount, @required int itemsPerPage})
      : this._private(
            maximumCachedPagesCount: cachedPagesCount,
            itemsPerPage: itemsPerPage);

  PaginationBloc.notCachePages({@required int itemsPerPage})
      : this._private(
            maximumCachedPagesCount: null, itemsPerPage: itemsPerPage);

  @override
  Future<TPage> getPage({@required pageIndex}) async {
    TPage page;
    if (isCacheEnabled) {
      if (indexToCachedPageMap.containsKey(pageIndex)) {
        page = indexToCachedPageMap[pageIndex];
      } else {
        page = await loadPage(pageIndex: pageIndex);
        if (page != null) {
          if (isMaximumPagesInCacheReached && cachedPagesCount > 0) {
            var keys = indexToCachedPageMap.keys;
            var farIndex = keys.first;

            keys.forEach((index) {
              var diffWithCurrent = (pageIndex - index).abs();
              var diffWithFar = (pageIndex - farIndex).abs();

              if (diffWithCurrent > diffWithFar) {
                farIndex = index;
              }
            });

            indexToCachedPageMap.remove(farIndex);
          }

          indexToCachedPageMap[pageIndex] = page;
        }
      }
    } else {
      page = await loadPage(pageIndex: pageIndex);
    }

    return page;
  }

  void clearCachePages() {
    indexToCachedPageMap.clear();
    dataInvalidatedStreamController.add(true);
  }

  Future<TPage> loadPage({@required int pageIndex});
}
