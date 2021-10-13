import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../cached/memory_cached_pagination_bloc_impl.dart';
import '../../pagination_model_test_impl.dart';
import 'pagination_list_bloc_with_new_items_memory_impl.dart';

const int storageSize = 30;
const int? maximumCachedPagesCount = null;
const int itemsCountPerPage = 5;
// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late ICachedPaginationBloc<CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> paginationBloc;

  late IPaginationListBloc<CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> paginationListBloc;
  late ICachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> paginationListWithNewItemsBloc;
  late MemoryCachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> memoryPaginationListWithNewItemsBloc;
  late MemoryCachedPaginationBloc<PaginationItemTest> memoryPaginationBloc;

  setUp(() {
    memoryPaginationBloc = MemoryCachedPaginationBloc.createTestWithSize(
      size: storageSize,
      maximumCachedPagesCount: maximumCachedPagesCount,
      paginationPageSize: PaginationPageSize.size5,
    );

    paginationBloc = memoryPaginationBloc;

    memoryPaginationListWithNewItemsBloc =
        MemoryCachedPaginationListWithNewItemsBloc(
      paginationBloc: paginationBloc,
      mergeNewItemsImmediately: false,
      // todo: write tests when watchNewerItemsWhenLoadedPagesIsEmpty: false
      watchNewerItemsWhenLoadedPagesIsEmpty: true,
      comparator: PaginationItemTest.compareItems,
      equalTo: PaginationItemTest.equalItems,
      mergeNewItemsImmediatelyWhenItemsIsEmpty: false,
    );
    paginationListWithNewItemsBloc = memoryPaginationListWithNewItemsBloc;
    paginationListBloc = paginationListWithNewItemsBloc;
  });

  tearDown(() {
    paginationBloc.dispose();
    memoryPaginationListWithNewItemsBloc.dispose();
  });

  test('itemsCountPerPage', () async {
    expect(
      paginationListBloc.itemsCountPerPage,
      itemsCountPerPage,
    );
  });

  test('items', () async {
    expect(
      paginationListBloc.items,
      <PaginationItemTest>[],
    );

    await expectLater(
      paginationListBloc.itemsStream,
      emits(
        <PaginationItemTest>[],
      ),
    );

    await paginationListBloc.refreshWithoutController();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    await expectLater(
      paginationListBloc.itemsCountStream,
      emits(itemsCountPerPage),
    );

    expect(
      paginationListBloc.items.length,
      itemsCountPerPage,
    );
    expect(
      paginationListBloc.items.first.index,
      0,
    );
    expect(
      paginationListBloc.items.last.index,
      itemsCountPerPage - 1,
    );

    await paginationListBloc.loadMoreWithoutController();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    await expectLater(
      // hack to skip old value
      paginationListBloc.itemsCountStream
          .skipWhile((value) => value == itemsCountPerPage),
      emits(itemsCountPerPage * 2),
    );

    expect(
      paginationListBloc.items.length,
      itemsCountPerPage * 2,
    );
    expect(
      paginationListBloc.items.first.index,
      0,
    );
    expect(
      paginationListBloc.items.last.index,
      itemsCountPerPage * 2 - 1,
    );

    await paginationListBloc.loadMoreWithoutController();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    await expectLater(
      paginationListBloc.itemsCountStream
          .skipWhile((value) => value == itemsCountPerPage * 2),
      emits(itemsCountPerPage * 3),
    );

    expect(
      paginationListBloc.items.length,
      itemsCountPerPage * 3,
    );
    expect(
      paginationListBloc.items.first.index,
      0,
    );
    expect(
      paginationListBloc.items.last.index,
      itemsCountPerPage * 3 - 1,
    );

    await paginationListBloc.refreshWithoutController();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    await expectLater(
      paginationListBloc.itemsCountStream,
      emits(itemsCountPerPage),
    );

    expect(
      paginationListBloc.items.length,
      itemsCountPerPage,
    );
    expect(
      paginationListBloc.items.first.index,
      0,
    );
    expect(
      paginationListBloc.items.last.index,
      itemsCountPerPage - 1,
    );

    var lastPageIndex = storageSize ~/ itemsCountPerPage;

    for (var i = 0; i < lastPageIndex; i++) {
      await paginationListBloc.loadMoreWithoutController();
      await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();
    }

    await expectLater(
      paginationListBloc.itemsCountStream,
      emits(storageSize),
    );

    expect(
      paginationListBloc.items.length,
      storageSize,
    );
    expect(
      paginationListBloc.items.first.index,
      0,
    );
    expect(
      paginationListBloc.items.last.index,
      storageSize - 1,
    );

    await paginationListBloc.loadMoreWithoutController();

    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    await expectLater(
      paginationListBloc.itemsCountStream,
      emits(storageSize),
    );

    expect(
      paginationListBloc.items.length,
      storageSize,
    );
    expect(
      paginationListBloc.items.first.index,
      0,
    );
    expect(
      paginationListBloc.items.last.index,
      storageSize - 1,
    );
  });

  test('newerItem', () async {
    expect(
      paginationListWithNewItemsBloc.newerItem,
      null,
    );

    await paginationListWithNewItemsBloc.refreshWithoutController();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.newerItem!.index,
      0,
    );
    await expectLater(
      paginationListWithNewItemsBloc.newerItemStream
          .map((newerItem) => newerItem?.index),
      emits(0),
    );

    await paginationListWithNewItemsBloc.loadMoreWithoutController();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.newerItem!.index,
      0,
    );
    await expectLater(
      paginationListWithNewItemsBloc.newerItemStream
          .map((newerItem) => newerItem!.index),
      emits(0),
    );
  });

  test('unmergedNewItems', () async {
    var testPaginationItem1 = PaginationItemTest(100);
    var testPaginationItem2 = PaginationItemTest(200);
    var testPaginationItem3 = PaginationItemTest(500);

    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      0,
    );
    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsStream,
      emits(<PaginationItemTest>[]),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      1,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[0],
      testPaginationItem1,
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(1),
    );

    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[0],
      testPaginationItem1,
    );

    memoryPaginationListWithNewItemsBloc.addNewItems(
      [
        testPaginationItem2,
        testPaginationItem3,
      ],
    );
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      2,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[0],
      testPaginationItem2,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[1],
      testPaginationItem3,
    );
  });

  test('unmergedNewItemsCount', () async {
    var testPaginationItem1 = PaginationItemTest(100);
    var testPaginationItem2 = PaginationItemTest(200);
    var testPaginationItem3 = PaginationItemTest(500);

    expect(
      paginationListWithNewItemsBloc.unmergedNewItemsCount,
      0,
    );
    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItemsCount,
      1,
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(1),
    );

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItemsCount,
      2,
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(2),
    );
  });

  test('unmergedNewItems', () async {
    var testPaginationItem1 = PaginationItemTest(100);
    var testPaginationItem2 = PaginationItemTest(200);
    var testPaginationItem3 = PaginationItemTest(500);

    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      0,
    );
    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      1,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[0],
      testPaginationItem1,
    );

    memoryPaginationListWithNewItemsBloc.addNewItems(
      [testPaginationItem2, testPaginationItem3],
    );
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      2,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[0],
      testPaginationItem2,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[1],
      testPaginationItem3,
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(2),
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[0],
      testPaginationItem2,
    );
    expect(
      paginationListWithNewItemsBloc.unmergedNewItems[1],
      testPaginationItem3,
    );

    memoryPaginationListWithNewItemsBloc.mergeNewItems();

    expect(
      paginationListWithNewItemsBloc.unmergedNewItems.length,
      0,
    );

    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(0),
    );
  });

  test('mergedNewItems', () async {
    var testPaginationItem1 = PaginationItemTest(-1);
    var testPaginationItem2 = PaginationItemTest(-2);
    var testPaginationItem3 = PaginationItemTest(-3);

    expect(
      paginationListWithNewItemsBloc.mergedNewItems.length,
      0,
    );
    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );

    expect(paginationListWithNewItemsBloc.itemsCount, 0);
    await expectLater(
      paginationListWithNewItemsBloc.itemsCountStream,
      emits(0),
    );

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 0);
    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);

    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(paginationListWithNewItemsBloc.unmergedNewItemsCount, 1);
    await expectLater(
      paginationListWithNewItemsBloc.unmergedNewItemsCountStream,
      emits(1),
    );

    expect(paginationListWithNewItemsBloc.itemsCount, 0);
    await expectLater(
      paginationListWithNewItemsBloc.itemsCountStream,
      emits(0),
    );

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 0);
    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.mergeNewItems();

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 1);
    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(1),
    );

    expect(paginationListWithNewItemsBloc.itemsCount, 1);
    await expectLater(
      paginationListWithNewItemsBloc.itemsCountStream,
      emits(1),
    );

    expect(paginationListWithNewItemsBloc.mergedNewItems.length, 1);
    expect(
      paginationListWithNewItemsBloc.mergedNewItems[0],
      testPaginationItem1,
    );

    memoryPaginationListWithNewItemsBloc.addNewItems(
      [testPaginationItem2, testPaginationItem3],
    );

    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(paginationListWithNewItemsBloc.itemsCount, 1);
    await expectLater(
      paginationListWithNewItemsBloc.itemsCountStream,
      emits(1),
    );

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 1);
    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(1),
    );

    memoryPaginationListWithNewItemsBloc.mergeNewItems();

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 3);
    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(3),
    );

    expect(paginationListWithNewItemsBloc.itemsCount, 3);
    await expectLater(
      paginationListWithNewItemsBloc.itemsCountStream,
      emits(3),
    );

    expect(
      paginationListWithNewItemsBloc.mergedNewItems[0],
      testPaginationItem2,
    );
    expect(
      paginationListWithNewItemsBloc.mergedNewItems[1],
      testPaginationItem3,
    );
    expect(
      paginationListWithNewItemsBloc.mergedNewItems[2],
      testPaginationItem1,
    );
  });

  test('mergedNewItems', () async {
    var testPaginationItem1 = PaginationItemTest(-1);
    var testPaginationItem2 = PaginationItemTest(-2);
    var testPaginationItem3 = PaginationItemTest(-3);

    expect(
      paginationListWithNewItemsBloc.mergedNewItemsCount,
      0,
    );
    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.mergeNewItems();
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items.length,
      1,
    );

    expect(
      paginationListWithNewItemsBloc.mergedNewItemsCount,
      1,
    );

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(1),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems(
      [
        testPaginationItem2,
        testPaginationItem3,
      ],
    );
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    memoryPaginationListWithNewItemsBloc.mergeNewItems();

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(3),
    );

    expect(
      paginationListWithNewItemsBloc.items.length,
      3,
    );
    expect(
      paginationListWithNewItemsBloc.mergedNewItemsCount,
      3,
    );
  });

  test('mergeNewItemsImmediately', () async {
    memoryPaginationListWithNewItemsBloc =
        MemoryCachedPaginationListWithNewItemsBloc(
      paginationBloc: paginationBloc,
      mergeNewItemsImmediately: true,
      watchNewerItemsWhenLoadedPagesIsEmpty: true,
      comparator: PaginationItemTest.compareItems,
      equalTo: PaginationItemTest.equalItems,
      mergeNewItemsImmediatelyWhenItemsIsEmpty: false,
    );
    paginationListWithNewItemsBloc = memoryPaginationListWithNewItemsBloc;
    paginationListBloc = paginationListWithNewItemsBloc;

    var testPaginationItem1 = PaginationItemTest(-1);
    var testPaginationItem2 = PaginationItemTest(-2);
    var testPaginationItem3 = PaginationItemTest(-3);

    expect(
      paginationListWithNewItemsBloc.mergedNewItemsCount,
      0,
    );
    expect(
      paginationListWithNewItemsBloc.items,
      <PaginationItemTest>[],
    );

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(0),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);

    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items.length,
      1,
    );

    expect(
      paginationListWithNewItemsBloc.mergedNewItemsCount,
      1,
    );

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(1),
    );

    memoryPaginationListWithNewItemsBloc.addNewItems(
      [testPaginationItem2, testPaginationItem3],
    );
    await memoryPaginationListWithNewItemsBloc.waitForNewerItemsAsyncCheck();

    expect(
      paginationListWithNewItemsBloc.items.length,
      3,
    );
    expect(
      paginationListWithNewItemsBloc.mergedNewItemsCount,
      3,
    );

    await expectLater(
      paginationListWithNewItemsBloc.mergedNewItemsCountStream,
      emits(3),
    );
  });
}
