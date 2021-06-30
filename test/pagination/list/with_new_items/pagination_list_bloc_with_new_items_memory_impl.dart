import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';

class MemoryCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<TItem>,
        TItem extends IEqualComparableObj<TItem>>
    extends CachedPaginationListWithNewItemsBloc<TPage, TItem> {
  // ignore: close_sinks
  final StreamController<List<TItem>> newItemsStreamController =
      StreamController.broadcast();

  void addNewItems(List<TItem> newItems) =>
      newItemsStreamController.add(newItems);

  final int Function(TItem a, TItem b) comparator;
  final bool Function(TItem a, TItem b) equalTo;

  MemoryCachedPaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required bool mergeNewItemsImmediatelyWhenItemsIsEmpty,
    required this.comparator,
    required this.equalTo,
    required bool watchNewerItemsWhenLoadedPagesIsEmpty,
    required ICachedPaginationBloc<TPage, TItem> paginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          mergeNewItemsImmediatelyWhenItemsIsEmpty:
              mergeNewItemsImmediatelyWhenItemsIsEmpty,
          paginationBloc: paginationBloc,
          watchNewerItemsWhenLoadedPagesIsEmpty:
              watchNewerItemsWhenLoadedPagesIsEmpty,
        ) {
    newItemsStreamController.disposeWith(this);
  }

  @override
  Stream<List<TItem>> watchItemsNewerThanItem(TItem? item) =>
      newItemsStreamController.stream;
}
