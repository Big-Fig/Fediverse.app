import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pagination_bloc_memory_impl.dart';
import '../../pagination_model_helper.dart';
import 'pagination_list_bloc_with_new_items_memory_impl.dart';

void main() {
  IPaginationBloc<CachedPaginationPage<TestPaginationItem>, TestPaginationItem>
      paginationBloc;

  IPaginationListBloc<CachedPaginationPage<TestPaginationItem>,
      TestPaginationItem> paginationListBloc;
  IPaginationListWithNewItemsBloc<CachedPaginationPage<TestPaginationItem>,
      TestPaginationItem> paginationListWithNewItemsBloc;
  MemoryPaginationListWithNewItemsBloc<CachedPaginationPage<TestPaginationItem>,
      TestPaginationItem> memoryPaginationListWithNewItemsBloc;
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

    memoryPaginationListWithNewItemsBloc = MemoryPaginationListWithNewItemsBloc(
      paginationBloc: paginationBloc,
      mergeNewItemsImmediately: false,
      comparator: TestPaginationItem.compareItems,
      equalTo: TestPaginationItem.equalItems,
    );
    paginationListWithNewItemsBloc = memoryPaginationListWithNewItemsBloc;
    paginationListBloc = paginationListWithNewItemsBloc;
  });

  tearDown(() {
    paginationBloc.dispose();
    memoryPaginationListWithNewItemsBloc.dispose();
  });

  test('itemsCountPerPage', () async {
    expect(paginationListBloc.itemsCountPerPage, itemsCountPerPage);
  });

  test('isRefreshedAtLeastOnce', () async {
    expect(paginationListBloc.isRefreshedAtLeastOnce, false);
    await paginationListBloc.refresh();
    expect(paginationListBloc.isRefreshedAtLeastOnce, true);
  });

  test('items', () async {
    expect(paginationListBloc.items, null);

    var listened;
    var subscription = paginationListBloc.itemsStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, null);

    await paginationListBloc.refresh();

    expect(paginationListBloc.items.length, itemsCountPerPage);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage - 1);

    await paginationListBloc.loadMore();

    expect(paginationListBloc.items.length, itemsCountPerPage * 2);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage * 2 - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage * 2);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage * 2 - 1);

    await paginationListBloc.loadMore();

    expect(paginationListBloc.items.length, itemsCountPerPage * 3);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage * 3 - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage * 3);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage * 3 - 1);

    await paginationListBloc.refresh();

    expect(paginationListBloc.items.length, itemsCountPerPage);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage - 1);

    var lastPageIndex = storageSize ~/ itemsCountPerPage;

    for (int i = 0; i < lastPageIndex; i++) {
      await paginationListBloc.loadMore();
    }

    expect(paginationListBloc.items.length, storageSize);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, storageSize - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, storageSize);
    expect(listened.first.index, 0);
    expect(listened.last.index, storageSize - 1);

    await paginationListBloc.loadMore();

    expect(paginationListBloc.items.length, storageSize);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, storageSize - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, storageSize);
    expect(listened.first.index, 0);
    expect(listened.last.index, storageSize - 1);

    await subscription.cancel();
  });

  test('newerItem', () async {
    expect(paginationListWithNewItemsBloc.newerItem, null);

    var listened;
    var subscription =
        paginationListWithNewItemsBloc.newerItemStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, null);

    await paginationListWithNewItemsBloc.refresh();
    expect(paginationListWithNewItemsBloc.newerItem.index, 0);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.index, 0);

    await paginationListWithNewItemsBloc.loadMore();
    expect(paginationListWithNewItemsBloc.newerItem.index, 0);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.index, 0);

    await subscription.cancel();
  });

  test('unmergedNewItems', () async {
    var testPaginationItem1 = TestPaginationItem(100);
    var testPaginationItem2 = TestPaginationItem(200);
    var testPaginationItem3 = TestPaginationItem(300);

    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 0);
    expect(paginationListWithNewItemsBloc.items, null);

    var listened;
    var subscription = paginationListWithNewItemsBloc.unmergedNewItemsStream
        .listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items, null);
    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 1);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 1);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem1);

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items, null);
    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[1],
        testPaginationItem3);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[1],
        testPaginationItem3);

    await subscription.cancel();
  });

  test('unmergedNewItemsCount', () async {
    var testPaginationItem1 = TestPaginationItem(100);
    var testPaginationItem2 = TestPaginationItem(200);
    var testPaginationItem3 = TestPaginationItem(300);

    expect(paginationListWithNewItemsBloc.unmergedNewItemsCount, 0);
    expect(paginationListWithNewItemsBloc.items, null);

    var listened;
    var subscription = paginationListWithNewItemsBloc
        .unmergedNewItemsCountStream
        .listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 0);

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items, null);
    expect(paginationListWithNewItemsBloc.unmergedNewItemsCount, 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 1);

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items, null);
    expect(paginationListWithNewItemsBloc.unmergedNewItemsCount, 2);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 2);

    await subscription.cancel();
  });

  test('unmergedNewItems', () async {
    var testPaginationItem1 = TestPaginationItem(100);
    var testPaginationItem2 = TestPaginationItem(200);
    var testPaginationItem3 = TestPaginationItem(300);

    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 0);
    expect(paginationListWithNewItemsBloc.items, null);

    var listened;
    var subscription = paginationListWithNewItemsBloc.unmergedNewItemsStream
        .listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items, null);
    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 1);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 1);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem1);

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items, null);
    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[1],
        testPaginationItem3);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[0],
        testPaginationItem2);
    expect(paginationListWithNewItemsBloc.unmergedNewItems[1],
        testPaginationItem3);

    memoryPaginationListWithNewItemsBloc.mergeNewItems();
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.unmergedNewItems.length, 0);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    await subscription.cancel();
  });

  test('mergedNewItems', () async {
    var testPaginationItem1 = TestPaginationItem(-1);
    var testPaginationItem2 = TestPaginationItem(-2);
    var testPaginationItem3 = TestPaginationItem(-3);

    expect(paginationListWithNewItemsBloc.mergedNewItems.length, 0);
    expect(paginationListWithNewItemsBloc.items, null);

    var listened;
    var subscription =
        paginationListWithNewItemsBloc.mergedNewItemsStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 0);

    memoryPaginationListWithNewItemsBloc.mergeNewItems();
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items.length, 1);

    expect(paginationListWithNewItemsBloc.mergedNewItems.length, 1);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[0], testPaginationItem1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 1);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[0], testPaginationItem1);

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await Future.delayed(Duration(milliseconds: 1));

    memoryPaginationListWithNewItemsBloc.mergeNewItems();
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items.length, 3);
    expect(paginationListWithNewItemsBloc.mergedNewItems.length, 3);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[0], testPaginationItem2);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[1], testPaginationItem3);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[2], testPaginationItem1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, 3);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[0], testPaginationItem2);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[1], testPaginationItem3);
    expect(
        paginationListWithNewItemsBloc.mergedNewItems[2], testPaginationItem1);

    await subscription.cancel();
  });

  test('mergedNewItems', () async {
    var testPaginationItem1 = TestPaginationItem(-1);
    var testPaginationItem2 = TestPaginationItem(-2);
    var testPaginationItem3 = TestPaginationItem(-3);

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 0);
    expect(paginationListWithNewItemsBloc.items, null);

    var listened;
    var subscription = paginationListWithNewItemsBloc.mergedNewItemsCountStream
        .listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 0);

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 0);

    memoryPaginationListWithNewItemsBloc.mergeNewItems();
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items.length, 1);

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 1);

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await Future.delayed(Duration(milliseconds: 1));

    memoryPaginationListWithNewItemsBloc.mergeNewItems();
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items.length, 3);
    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 3);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 3);

    await subscription.cancel();
  });

  test('mergeNewItemsImmediately', () async {
    memoryPaginationListWithNewItemsBloc = MemoryPaginationListWithNewItemsBloc(
      paginationBloc: paginationBloc,
      mergeNewItemsImmediately: true,
      comparator: TestPaginationItem.compareItems,
      equalTo: TestPaginationItem.equalItems,
    );
    paginationListWithNewItemsBloc = memoryPaginationListWithNewItemsBloc;
    paginationListBloc = paginationListWithNewItemsBloc;

    var testPaginationItem1 = TestPaginationItem(-1);
    var testPaginationItem2 = TestPaginationItem(-2);
    var testPaginationItem3 = TestPaginationItem(-3);

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 0);
    expect(paginationListWithNewItemsBloc.items, null);

    var listened;
    var subscription = paginationListWithNewItemsBloc.mergedNewItemsCountStream
        .listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 0);

    memoryPaginationListWithNewItemsBloc.addNewItems([testPaginationItem1]);

    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items.length, 1);

    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 1);

    memoryPaginationListWithNewItemsBloc
        .addNewItems([testPaginationItem2, testPaginationItem3]);
    await Future.delayed(Duration(milliseconds: 1));

    expect(paginationListWithNewItemsBloc.items.length, 3);
    expect(paginationListWithNewItemsBloc.mergedNewItemsCount, 3);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, 3);

    await subscription.cancel();
  });
}
