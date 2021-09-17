import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../rxdart/rxdart_test_helper.dart';
import 'cached/memory_cached_pagination_bloc_impl.dart';
import 'pagination_model_test_impl.dart';

const int storageSize = 37;
const int? maximumCachedPagesCount = null;
const int itemsCountPerPage = 5;
// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late IPaginationBloc<CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> paginationBloc;
  MemoryCachedPaginationBloc<PaginationItemTest> memoryPaginationBloc;

  setUp(() {
    memoryPaginationBloc = MemoryCachedPaginationBloc.createTestWithSize(
      size: storageSize,
      maximumCachedPagesCount: maximumCachedPagesCount,
      paginationPageSize: PaginationPageSize.size5,
    );

    paginationBloc = memoryPaginationBloc;
  });

  tearDown(() {
    paginationBloc.dispose();
  });

  test('loadedPagesMinimumIndex', () async {
    expect(
      paginationBloc.loadedPagesMinimumIndex,
      null,
    );

    var listened;
    var subscription =
        paginationBloc.loadedPagesMinimumIndexStream.listen((newValue) {
      listened = newValue;
    });

    expect(listened, null);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, 1);
    expect(
      paginationBloc.loadedPagesMinimumIndex,
      1,
    );

    listened = false;

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(
      paginationBloc.loadedPagesMinimumIndex,
      0,
    );
    expect(listened, 0);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, 0);
    expect(
      paginationBloc.loadedPagesMinimumIndex,
      0,
    );

    await subscription.cancel();
  });
  test('loadedPagesMaximumIndex', () async {
    expect(
      paginationBloc.loadedPagesMaximumIndex,
      null,
    );

    var listened;
    var subscription =
        paginationBloc.loadedPagesMaximumIndexStream.listen((newValue) {
      listened = newValue;
    });

    expect(
      listened,
      null,
    );

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, 1);
    expect(paginationBloc.loadedPagesMaximumIndex, 1);

    listened = null;

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, 1);
    expect(paginationBloc.loadedPagesMaximumIndex, 1);

    listened = null;

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    await RxDartMockHelper.waitForData(() => listened);
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
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, true);

    listened = null;

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, false);

    listened = null;

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, true);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, true);

    listened = null;

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, true);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, true);

    listened = null;

    await paginationBloc.requestPage(pageIndex: 4, forceToSkipCache: false);
    expect(paginationBloc.isLoadedPagesInSequence, false);
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, false);

    listened = null;

    await subscription.cancel();
  });

  test('loadedPageIndexesSortedByIndex', () async {
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 0);

    var listened;
    var subscription =
        paginationBloc.loadedPageIndexesSortedByIndexStream.listen((newValue) {
      listened = newValue;
    });
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened.length, 0);

    await paginationBloc.requestPage(pageIndex: 1, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 1);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 1);
    listened = null;

    await RxDartMockHelper.waitForData(() => listened);
    expect(listened.length, 1);
    expect(listened[0], 1);

    await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 2);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 0);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[1], 1);

    listened = null;

    await RxDartMockHelper.waitForData(() => listened);

    expect(listened.length, 2);
    expect(listened[0], 0);
    expect(listened[1], 1);

    await paginationBloc.requestPage(pageIndex: 2, forceToSkipCache: false);
    expect(paginationBloc.loadedPageIndexesSortedByIndex.length, 3);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[0], 0);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[1], 1);
    expect(paginationBloc.loadedPageIndexesSortedByIndex[2], 2);

    listened = null;

    await RxDartMockHelper.waitForData(() => listened);
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

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened.length, 4);
    expect(listened[0], 0);
    expect(listened[1], 1);
    expect(listened[2], 2);
    expect(listened[3], 4);

    await subscription.cancel();
  });

  test('loadedPagesSortedByIndex', () async {
    expect(
      paginationBloc.loadedPagesSortedByIndex.length,
      0,
    );

    late var listened;
    var subscription =
        paginationBloc.loadedPagesSortedByIndexStream.listen((newValue) {
      listened = newValue;
    });
    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened.length, 0);

    await paginationBloc.requestPage(
      pageIndex: 1,
      forceToSkipCache: false,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex.length,
      1,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[0].pageIndex,
      1,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened.length,
      1,
    );
    expect(
      listened[0].pageIndex,
      1,
    );

    await paginationBloc.requestPage(
      pageIndex: 0,
      forceToSkipCache: false,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex.length,
      2,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[0].pageIndex,
      0,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[1].pageIndex,
      1,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened.length,
      2,
    );
    expect(
      listened[0].pageIndex,
      0,
    );
    expect(
      listened[1].pageIndex,
      1,
    );

    await paginationBloc.requestPage(
      pageIndex: 2,
      forceToSkipCache: false,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex.length,
      3,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[0].pageIndex,
      0,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[1].pageIndex,
      1,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[2].pageIndex,
      2,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened.length, 3);
    expect(
      listened[0].pageIndex,
      0,
    );
    expect(
      listened[1].pageIndex,
      1,
    );
    expect(
      listened[2].pageIndex,
      2,
    );

    await paginationBloc.requestPage(
      pageIndex: 4,
      forceToSkipCache: false,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex.length,
      4,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[0].pageIndex,
      0,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[1].pageIndex,
      1,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[2].pageIndex,
      2,
    );
    expect(
      paginationBloc.loadedPagesSortedByIndex[3].pageIndex,
      4,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened.length,
      4,
    );
    expect(
      listened[0].pageIndex,
      0,
    );
    expect(
      listened[1].pageIndex,
      1,
    );
    expect(
      listened[2].pageIndex,
      2,
    );
    expect(
      listened[3].pageIndex,
      4,
    );

    await subscription.cancel();
  });

  test('itemsCountPerPage', () async {
    expect(
      paginationBloc.itemsCountPerPage,
      itemsCountPerPage,
    );
  });

  test('refresh', () async {
    CachedPaginationPage<PaginationItemTest>? page;
    page = await paginationBloc.requestPage(
      pageIndex: 0,
      forceToSkipCache: false,
    );
    expect(
      page.pageIndex,
      0,
    );
    expect(
      page.isActuallyRefreshedFromRemote,
      false,
    );
    expect(
      page.items.length,
      itemsCountPerPage,
    );
    expect(
      page.items[0].index,
      0,
    );

    page = await paginationBloc.refreshWithoutController();

    expect(
      page.pageIndex,
      0,
    );
    expect(
      page.isActuallyRefreshedFromRemote,
      true,
    );
    expect(
      page.items.length,
      itemsCountPerPage,
    );
    expect(
      page.items[0].index,
      0,
    );
  });
  test('requestPage', () async {
    CachedPaginationPage<PaginationItemTest>? page;
    page =
        await paginationBloc.requestPage(pageIndex: 0, forceToSkipCache: false);
    expect(
      page.pageIndex,
      0,
    );
    expect(page.isActuallyRefreshedFromRemote, false);
    expect(
      page.items.length,
      itemsCountPerPage,
    );
    expect(
      page.items[0].index,
      0,
    );

    page = await paginationBloc.requestPage(
      pageIndex: 1,
      forceToSkipCache: true,
    );

    expect(
      page.pageIndex,
      1,
    );
    expect(
      page.isActuallyRefreshedFromRemote,
      true,
    );
    expect(
      page.items.length,
      itemsCountPerPage,
    );
    expect(
      page.items[0].index,
      itemsCountPerPage,
    );

    page = await paginationBloc.requestPage(
      pageIndex: 3,
      forceToSkipCache: true,
    );

    expect(
      page.pageIndex,
      3,
    );
    expect(
      page.isActuallyRefreshedFromRemote,
      true,
    );
    expect(
      page.items.length,
      itemsCountPerPage,
    );
    expect(
      page.items[0].index,
      itemsCountPerPage * 3,
    );

    var lastPageIndex = storageSize ~/ itemsCountPerPage;
    var lastPageItemsLength = storageSize % itemsCountPerPage;

    page = await paginationBloc.requestPage(
      pageIndex: lastPageIndex,
      forceToSkipCache: true,
    );

    expect(
      page.pageIndex,
      lastPageIndex,
    );
    expect(
      page.isActuallyRefreshedFromRemote,
      true,
    );
    expect(
      page.items.length,
      lastPageItemsLength,
    );
    expect(
      page.items.last.index,
      storageSize - 1,
    );

    page = await paginationBloc.requestPage(
      pageIndex: lastPageIndex + 1,
      forceToSkipCache: true,
    );

    expect(
      page.pageIndex,
      lastPageIndex + 1,
    );
    expect(
      page.isActuallyRefreshedFromRemote,
      true,
    );
    expect(
      page.items.length,
      0,
    );
  });
}
