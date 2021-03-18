import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../memory_cached_pagination_bloc_impl.dart';
import '../pagination_model_helper.dart';

void main() {
  late IPaginationBloc<CachedPaginationPage<TestPaginationItem>,
      TestPaginationItem> paginationBloc;

  late IPaginationListBloc<CachedPaginationPage<TestPaginationItem>?,
      TestPaginationItem> paginationListBloc;
  MemoryCachedPaginationBloc<TestPaginationItem> memoryPaginationBloc;
  int storageSize = 30;
  int? maximumCachedPagesCount;
  int itemsCountPerPage = 5;

  setUp(() {
    memoryPaginationBloc = MemoryCachedPaginationBloc.createTestWithSize(
      size: storageSize,
      maximumCachedPagesCount: maximumCachedPagesCount,
      paginationPageSize: PaginationPageSize.size5,
    );

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

  test('items', () async {
    expect(paginationListBloc.items, []);

    var listened;
    var subscription = paginationListBloc.itemsStream.listen((newValue) {
      listened = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, []);

    await paginationListBloc.refreshWithoutController();

    expect(paginationListBloc.items.length, itemsCountPerPage);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage - 1);

    await paginationListBloc.loadMoreWithoutController();

    expect(paginationListBloc.items.length, itemsCountPerPage * 2);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage * 2 - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage * 2);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage * 2 - 1);

    await paginationListBloc.loadMoreWithoutController();

    expect(paginationListBloc.items.length, itemsCountPerPage * 3);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage * 3 - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage * 3);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage * 3 - 1);

    await paginationListBloc.refreshWithoutController();

    expect(paginationListBloc.items.length, itemsCountPerPage);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, itemsCountPerPage);
    expect(listened.first.index, 0);
    expect(listened.last.index, itemsCountPerPage - 1);

    var lastPageIndex = storageSize ~/ itemsCountPerPage;

    for (int i = 0; i < lastPageIndex; i++) {
      await paginationListBloc.loadMoreWithoutController();
    }

    expect(paginationListBloc.items.length, storageSize);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, storageSize - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, storageSize);
    expect(listened.first.index, 0);
    expect(listened.last.index, storageSize - 1);

    await paginationListBloc.loadMoreWithoutController();

    expect(paginationListBloc.items.length, storageSize);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, storageSize - 1);
    await Future.delayed(Duration(milliseconds: 1));
    expect(listened.length, storageSize);
    expect(listened.first.index, 0);
    expect(listened.last.index, storageSize - 1);

    await subscription.cancel();
  });
}
