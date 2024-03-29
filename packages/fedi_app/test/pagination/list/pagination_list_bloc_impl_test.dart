// ignore_for_file: prefer_const_constructors

import 'package:fedi_app/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../cached/memory_cached_pagination_bloc_impl.dart';
import '../pagination_model_test_impl.dart';

const int storageSize = 30;
const int? maximumCachedPagesCount = null;
const int itemsCountPerPage = 5;
// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late IPaginationBloc<CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> paginationBloc;

  late IPaginationListBloc<CachedPaginationPage<PaginationItemTest>,
      PaginationItemTest> paginationListBloc;
  MemoryCachedPaginationBloc<PaginationItemTest> memoryPaginationBloc;

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
    expect(paginationListBloc.items, <PaginationItemTest>[]);

    List<PaginationItemTest>? listened;
    var subscription = paginationListBloc.itemsStream.listen((newValue) {
      listened = newValue;
    });
    await Future<void>.delayed(Duration(milliseconds: 1));
    expect(listened, <PaginationItemTest>[]);

    await paginationListBloc.refreshWithoutController();

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(paginationListBloc.items.length, itemsCountPerPage);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage - 1);

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(listened!.length, itemsCountPerPage);
    expect(listened!.first.index, 0);
    expect(listened!.last.index, itemsCountPerPage - 1);

    await paginationListBloc.loadMoreWithoutController();

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(paginationListBloc.items.length, itemsCountPerPage * 2);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage * 2 - 1);
    await Future<void>.delayed(Duration(milliseconds: 1));
    expect(listened!.length, itemsCountPerPage * 2);
    expect(listened!.first.index, 0);
    expect(listened!.last.index, itemsCountPerPage * 2 - 1);

    await paginationListBloc.loadMoreWithoutController();

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(paginationListBloc.items.length, itemsCountPerPage * 3);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage * 3 - 1);
    await Future<void>.delayed(Duration(milliseconds: 1));
    expect(listened!.length, itemsCountPerPage * 3);
    expect(listened!.first.index, 0);
    expect(listened!.last.index, itemsCountPerPage * 3 - 1);

    await paginationListBloc.refreshWithoutController();

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(paginationListBloc.items.length, itemsCountPerPage);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, itemsCountPerPage - 1);
    await Future<void>.delayed(Duration(milliseconds: 1));
    expect(listened!.length, itemsCountPerPage);
    expect(listened!.first.index, 0);
    expect(listened!.last.index, itemsCountPerPage - 1);

    var lastPageIndex = storageSize ~/ itemsCountPerPage;

    for (var i = 0; i < lastPageIndex; i++) {
      await paginationListBloc.loadMoreWithoutController();
    }

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(paginationListBloc.items.length, storageSize);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, storageSize - 1);
    await Future<void>.delayed(Duration(milliseconds: 1));
    expect(listened!.length, storageSize);
    expect(listened!.first.index, 0);
    expect(listened!.last.index, storageSize - 1);

    await paginationListBloc.loadMoreWithoutController();

    await Future<void>.delayed(Duration(milliseconds: 1));

    expect(paginationListBloc.items.length, storageSize);
    expect(paginationListBloc.items.first.index, 0);
    expect(paginationListBloc.items.last.index, storageSize - 1);
    await Future<void>.delayed(Duration(milliseconds: 1));
    expect(listened!.length, storageSize);
    expect(listened!.first.index, 0);
    expect(listened!.last.index, storageSize - 1);

    await subscription.cancel();
  });
}
