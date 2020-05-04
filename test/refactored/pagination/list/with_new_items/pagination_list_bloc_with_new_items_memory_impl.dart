import 'dart:async';

import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class MemoryPaginationListWithNewItemsBloc<TPage extends PaginationPage<TItem>,
    TItem> extends PaginationListWithNewItemsBloc<TPage, TItem> {
  // ignore: close_sinks
  final StreamController<List<TItem>> newItemsStreamController =
      StreamController.broadcast();

  addNewItems(List<TItem> newItems) => newItemsStreamController.add(newItems);

  final int Function(TItem a, TItem b) comparator;

  MemoryPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.comparator,
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
  int compareItems(TItem a, TItem b) {
    return comparator(a, b);
  }

}
