import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class MemoryPaginationListWithNewItemsBloc<TPage extends PaginationPage<TItem>,
    TItem> extends PaginationListWithNewItemsBloc<TPage, TItem> {
  // ignore: close_sinks
  final StreamController<List<TItem>> newItemsStreamController =
      StreamController.broadcast();

  void addNewItems(List<TItem> newItems) =>
      newItemsStreamController.add(newItems);

  final int Function(TItem a, TItem b) comparator;
  final bool Function(TItem a, TItem b) equalTo;

  MemoryPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.comparator,
      @required this.equalTo,
      @required IPaginationBloc<TPage, TItem> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc) {
    addDisposable(disposable: CustomDisposable(() {
      newItemsStreamController.close();
    }));
  }

  @override
  Stream<List<TItem>> watchItemsNewerThanItem(TItem item) =>
      newItemsStreamController.stream;

  @override
  int compareItemsToSort(TItem a, TItem b) {
    return comparator(a, b);
  }

  @override
  bool isItemsEqual(TItem a, TItem b) => equalTo(a, b);
}
