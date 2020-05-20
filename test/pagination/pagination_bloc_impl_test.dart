import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pagination_bloc_memory_impl.dart';
import 'pagination_model_helper.dart';

void main() {
  IPaginationBloc<CachedPaginationPage<TestPaginationItem>, TestPaginationItem>
      paginationBloc;
  MemoryPaginationBloc<TestPaginationItem> memoryPaginationBloc;
  int storageSize = 30;
  int maximumCachedPagesCount;
  int itemsCountPerPage = 4;

  setUp(() {
    memoryPaginationBloc = MemoryPaginationBloc.createTestWithSize(
        size: storageSize,
        maximumCachedPagesCount: maximumCachedPagesCount,
        itemsCountPerPage: itemsCountPerPage);

    paginationBloc = memoryPaginationBloc;
  });

  tearDown(() {
    paginationBloc.dispose();
  });

  test('loadedPagesMinimumIndex', () async {
    expect(paginationBloc.loadedPagesMinimumIndex,
        IPaginationBloc.undefinedPageIndex);

    var listened;
    var subscription =
        paginationBloc.loadedPagesMinimumIndexStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, IPaginationBloc.undefinedPageIndex);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 1);
    expect(paginationBloc.loadedPagesMinimumIndex, 1);

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(paginationBloc.loadedPagesMinimumIndex, 0);
    expect(listened, 0);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 0);
    expect(paginationBloc.loadedPagesMinimumIndex, 0);

    await subscription.cancel();
  });
  test('loadedPagesMaximumIndex', () async {
    expect(paginationBloc.loadedPagesMaximumIndex,
        IPaginationBloc.undefinedPageIndex);

    var listened;
    var subscription =
        paginationBloc.loadedPagesMaximumIndexStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, IPaginationBloc.undefinedPageIndex);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 1);
    expect(paginationBloc.loadedPagesMaximumIndex, 1);

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 1);
    expect(paginationBloc.loadedPagesMaximumIndex, 1);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 2);
    expect(paginationBloc.loadedPagesMaximumIndex, 2);

    await subscription.cancel();
  });

  test('isLoadedPagesInSequence', () async {
    expect(paginationBloc.isLoadedPagesInSequence, true);

    var listened;
    var subscription =
        paginationBloc.isLoadedPagesInSequenceStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, true);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, false);

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, true);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, true);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, true);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, true);

    await paginationBloc.requestPage(pageIndex: 4, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, false);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, false);

    await subscription.cancel();
  });

  test('loadedPageIndexesSortedByIndex', () async {
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 0);

    var listened;
    var subscription =
        paginationBloc.loadedPageIndexesSortedByIndexStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 1);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 1);
    expect(listened[0], 1);

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 2);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 0);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[1], 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 2);
    expect(listened[0], 0);
    expect(listened[1], 1);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 3);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 0);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[1], 1);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[2], 2);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 3);
    expect(listened[0], 0);
    expect(listened[1], 1);
    expect(listened[2], 2);

    await paginationBloc.requestPage(pageIndex: 4, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 4);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 0);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[1], 1);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[2], 2);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[3], 4);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 4);
    expect(listened[0], 0);
    expect(listened[1], 1);
    expect(listened[2], 2);
    expect(listened[3], 4);

    await subscription.cancel();
  });

  test('loadedPagesSortedByIndex', () async {
    expect(paginationBloc.loadedPagesSortedByIndex.length, 0);

    var listened;
    var subscription =
        paginationBloc.loadedPagesSortedByIndexStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    expect(paginationBloc.loadedPagesSortedByIndex.length, 1);
    expect(paginationBloc.loadedPagesSortedByIndex[0].pageIndex, 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 1);
    expect(listened[0].pageIndex, 1);

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(paginationBloc.loadedPagesSortedByIndex.length, 2);
    expect(paginationBloc.loadedPagesSortedByIndex[0].pageIndex, 0);
    expect(paginationBloc.loadedPagesSortedByIndex[1].pageIndex, 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 2);
    expect(listened[0].pageIndex, 0);
    expect(listened[1].pageIndex, 1);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    expect(paginationBloc.loadedPagesSortedByIndex.length, 3);
    expect(paginationBloc.loadedPagesSortedByIndex[0].pageIndex, 0);
    expect(paginationBloc.loadedPagesSortedByIndex[1].pageIndex, 1);
    expect(paginationBloc.loadedPagesSortedByIndex[2].pageIndex, 2);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 3);
    expect(listened[0].pageIndex, 0);
    expect(listened[1].pageIndex, 1);
    expect(listened[2].pageIndex, 2);

    await paginationBloc.requestPage(pageIndex: 4, forceToSkipCache: false);
    expect(paginationBloc.loadedPagesSortedByIndex.length, 4);
    expect(paginationBloc.loadedPagesSortedByIndex[0].pageIndex, 0);
    expect(paginationBloc.loadedPagesSortedByIndex[1].pageIndex, 1);
    expect(paginationBloc.loadedPagesSortedByIndex[2].pageIndex, 2);
    expect(paginationBloc.loadedPagesSortedByIndex[3].pageIndex, 4);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 4);
    expect(listened[0].pageIndex, 0);
    expect(listened[1].pageIndex, 1);
    expect(listened[2].pageIndex, 2);
    expect(listened[3].pageIndex, 4);

    await subscription.cancel();
  });

  test('itemsCountPerPage', () async {
    expect(paginationBloc.itemsCountPerPage, itemsCountPerPage);
  });

  test('refresh', () async {
    CachedPaginationPage<TestPaginationItem> page;
    page =
        await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(page.pageIndex, 0);
    expect(page.isActuallyRefreshedFromRemote, false);
    expect(page.items.length, itemsCountPerPage);
    expect(page.items[0].index, 0);

    page = await paginationBloc.refresh();

    expect(page.pageIndex, 0);
    expect(page.isActuallyRefreshedFromRemote, true);
    expect(page.items.length, itemsCountPerPage);
    expect(page.items[0].index, 0);
  });
  test('requestPage', () async {
    CachedPaginationPage<TestPaginationItem> page;
    page =
        await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(page.pageIndex, 0);
    expect(page.isActuallyRefreshedFromRemote, false);
    expect(page.items.length, itemsCountPerPage);
    expect(page.items[0].index, 0);

    page =
        await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: true);

    expect(page.pageIndex, 1);
    expect(page.isActuallyRefreshedFromRemote, true);
    expect(page.items.length, itemsCountPerPage);
    expect(page.items[0].index, itemsCountPerPage);

    page =
        await paginationBloc.requestPage(pageIndex: 3, forceToSkipCache: true);

    expect(page.pageIndex, 3);
    expect(page.isActuallyRefreshedFromRemote, true);
    expect(page.items.length, itemsCountPerPage);
    expect(page.items[0].index, itemsCountPerPage * 3);

    var lastPageIndex = storageSize ~/ itemsCountPerPage;
    var lastPageItemsLength = storageSize % itemsCountPerPage;

    page = await paginationBloc.requestPage(
        pageIndex: lastPageIndex, forceToSkipCache: true);

    expect(page.pageIndex, lastPageIndex);
    expect(page.isActuallyRefreshedFromRemote, true);
    expect(page.items.length, lastPageItemsLength);
    expect(page.items.last.index, storageSize - 1);

    page = await paginationBloc.requestPage(
        pageIndex: lastPageIndex + 1, forceToSkipCache: true);

    expect(page.pageIndex, lastPageIndex + 1);
    expect(page.isActuallyRefreshedFromRemote, true);
    expect(page.items.length, 0);
  });
}
