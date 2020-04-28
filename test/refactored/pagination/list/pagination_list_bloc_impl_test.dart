import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../pagination_bloc_memory_impl.dart';
import '../pagination_model_helper.dart';

void main() {
  IPaginationBloc<CachedPaginationPage<TestPaginationItem>, TestPaginationItem>
      paginationBloc;

  IPaginationListBloc<CachedPaginationPage<TestPaginationItem>,
      TestPaginationItem> paginationListBloc;
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

    paginationListBloc = PaginationListBloc(paginationBloc: paginationBloc);
  });

  tearDown(() {
    paginationBloc.dispose();
    paginationListBloc.dispose();
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

    subscription.cancel();
  });
}
