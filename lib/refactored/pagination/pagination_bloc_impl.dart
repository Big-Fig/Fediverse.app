import 'dart:async';
import 'dart:math';

import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("pagination_bloc_impl.dart");

abstract class PaginationBloc<TPage extends PaginationPage<TItem>, TItem>
    extends DisposableOwner implements IPaginationBloc<TPage, TItem> {

  final int maximumCachedPagesCount;

  bool get isPageCacheEnabled =>
      maximumCachedPagesCount == null || maximumCachedPagesCount > 0;

  bool get isMaximumPagesInCacheReached {
    if (maximumCachedPagesCount != null) {
      return cachedPagesCount >= maximumCachedPagesCount;
    } else {
      return false;
    }
  }

  int get cachedPagesCount => indexToCachedPageMap.length;
  final int itemsCountPerPage;
  final Map<int, TPage> indexToCachedPageMap = {};

  // ignore: close_sinks
  final BehaviorSubject<List<TPage>> pagesSubject = BehaviorSubject.seeded([]);

  Stream<bool> get isLoadedPagesInSequenceStream =>
      loadedPagesSortedByIndexStream
          .map((pages) => mapIsLoadedPagesInSequence(pages));

  bool get isLoadedPagesInSequence =>
      mapIsLoadedPagesInSequence(loadedPagesSortedByIndex);

  @override
  int get loadedPagesMaximumIndex =>
      loadedPageIndexesSortedByIndex.fold(IPaginationBloc.undefinedPageIndex, max);

  @override
  Stream<int> get loadedPagesMaximumIndexStream => loadedPageIndexesSortedByIndexStream
      .map((list) => list.fold(IPaginationBloc.undefinedPageIndex, max));

  @override
  int get loadedPagesMinimumIndex =>
      loadedPageIndexesSortedByIndex.fold(null, (a, b) => min(a ?? b + 1, b)) ??
      IPaginationBloc.undefinedPageIndex;

  @override
  Stream<int> get loadedPagesMinimumIndexStream =>
      loadedPageIndexesSortedByIndexStream.map((list) =>
          list.fold(null, (a, b) => min(a ?? b + 1, b)) ??
          IPaginationBloc.undefinedPageIndex);

  @override
  List<int> get loadedPageIndexesSortedByIndex =>
      pagesSubject.value.map((page) => page.pageIndex).toList();

  @override
  Stream<List<int>> get loadedPageIndexesSortedByIndexStream => pagesSubject.stream
      .map((list) => list.map(((page) => page.pageIndex)).toList());

  @override
  List<TPage> get loadedPagesSortedByIndex => pagesSubject.value;

  @override
  Stream<List<TPage>> get loadedPagesSortedByIndexStream => pagesSubject.stream;

  PaginationBloc(
      {@required this.maximumCachedPagesCount,
      @required this.itemsCountPerPage}) {
    assert(itemsCountPerPage != null && itemsCountPerPage > 0);
    addDisposable(subject: pagesSubject);
    _logger.finest(() => "constructor");
  }

  @override
  void dispose() {
    super.dispose();
    _logger.finest(() => "dispose");
  }

  @override
  Future<TPage> requestPage(
      {@required int pageIndex, @required bool forceToSkipCache}) async {
    _logger.finest(() =>
        "requestPage $pageIndex, forceToUpdateFromNetwork $forceToSkipCache");

    TPage page;
    if (isPageCacheEnabled) {
      if (indexToCachedPageMap.containsKey(pageIndex)) {
        page = indexToCachedPageMap[pageIndex];
      } else {
        var previousPage;
        var nextPage;
        var previousIndex = pageIndex - 1;
        var nextIndex = pageIndex + 1;
        if (indexToCachedPageMap.containsKey(previousIndex)) {
          previousPage = indexToCachedPageMap[previousIndex];
        }
        if (indexToCachedPageMap.containsKey(nextIndex)) {
          nextPage = indexToCachedPageMap[nextIndex];
        }
        page = await loadPage(
            forceToSkipCache: forceToSkipCache,
            pageIndex: pageIndex,
            previousPage: previousPage,
            nextPage: nextPage);
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

          var pages = indexToCachedPageMap.values.toList();
          onPagesChanged(pages);
        }
      }
    } else {
      page = await loadPage(
          forceToSkipCache: forceToSkipCache,
          pageIndex: pageIndex,
          previousPage: null,
          nextPage: null);
    }

    return page;
  }

  void onPagesChanged(List<TPage> pages) {
    _logger.finer(() => "onPagesChanged pages ${pages.length}");
    pages.sort((a, b) => a.pageIndex.compareTo(b.pageIndex));
    _logger.finest(() =>
        "onPagesChanged pagesSubject.isClosed = ${pagesSubject.isClosed}");
    if (!pagesSubject.isClosed) {
      pagesSubject.add(pages);
    }
  }

  @override
  Future<TPage> refresh() async {

    indexToCachedPageMap.clear();
    pagesSubject.value.clear();
//    onPagesChanged([newFirstPage]);

    var newFirstPage = await requestPage(pageIndex: 0, forceToSkipCache: true);

    return newFirstPage;
  }

  Future<TPage> loadPage({
    @required bool forceToSkipCache,
    @required int pageIndex,
    @required TPage previousPage,
    @required TPage nextPage,
  });

  bool mapIsLoadedPagesInSequence(List<TPage> loadedPagesSortedByIndex) {
    var isLoadedInSequence = true;

    if (loadedPagesSortedByIndex?.isNotEmpty == true) {
      var firstIndex = loadedPagesSortedByIndex.first.pageIndex;

      if (firstIndex != 0) {
        isLoadedInSequence = false;
      } else {
        var previousIndex = firstIndex - 1;
        for (var page in loadedPagesSortedByIndex) {
          var currentIndex = page.pageIndex;

          if (currentIndex != previousIndex + 1) {
            isLoadedInSequence = false;
            break;
          }

          previousIndex = currentIndex;
        }
      }
    }

    return isLoadedInSequence;
  }
}
