import 'dart:async';
import 'dart:collection';

import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("pagination_list_with_new_items_bloc_impl.dart");

abstract class PaginationListWithNewItemsBloc<
        TPage extends PaginationPage<TItem>,
        TItem> extends PaginationListBloc<TPage, TItem>
    implements IPaginationListWithNewItemsBloc<TPage, TItem> {
  TItem get newerItem => items?.isNotEmpty == true ? items.first : null;

  Stream<TItem> get newerItemStream => itemsStream
      .map((items) => items?.isNotEmpty == true ? items.first : null);

  Stream<List<TItem>> watchItemsNewerThanItem(TItem item);

  @override
  final bool mergeNewItemsImmediately;

  // ignore: close_sinks
  BehaviorSubject<List<TItem>> _mergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: close_sinks
  BehaviorSubject<List<TItem>> _unmergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: cancel_subscriptions
  StreamSubscription newItemsSubscription;

  PaginationListWithNewItemsBloc(
      {@required this.mergeNewItemsImmediately,
      @required IPaginationBloc<TPage, TItem> paginationBloc})
      : super(paginationBloc: paginationBloc) {
    addDisposable(subject: _mergedNewItemsSubject);
    addDisposable(subject: _unmergedNewItemsSubject);

    addDisposable(
        streamSubscription: newerItemStream.distinct().listen((newerItem) {
      _logger.finest(() => "newerItem $newerItem");
      newItemsSubscription?.cancel();

      newItemsSubscription = watchItemsNewerThanItem(newerItem)
          .skipWhile((newItems) => newItems?.isNotEmpty != true)
          .listen((newItems) {
        // we need to filter again to be sure that newerItem is no
        // changed during sql request execute time
        List<TItem> actuallyNew = newItems
            .where((newItem) => compareItems(newItem, newerItem) > 0)
            .toList();
        _logger.finest(() => "watchItemsNewerThanItem \n"
            "\t newItems ${newItems.length} \n"
            "\t actuallyNew = ${actuallyNew.length}");

        _unmergedNewItemsSubject.add(actuallyNew);
      });

      addDisposable(streamSubscription: newItemsSubscription);
    }));

    if (mergeNewItemsImmediately) {
      addDisposable(
          streamSubscription: unmergedNewItemsStream.listen((unmergedNewItems) {
        if (unmergedNewItems?.isNotEmpty == true) {
          mergeNewItems();
        }
      }));
    }
  }

  @override
  List<TItem> get items => _calculateNewItems(super.items, mergedNewItems);

  @override
  Stream<List<TItem>> get itemsStream =>
      Rx.combineLatest2(mergedNewItemsStream, super.itemsStream,
          (mergedNewItems, items) {
        return _calculateNewItems(items, mergedNewItems);
      });

  List<TItem> _calculateNewItems(
      List<TItem> items, List<TItem> mergedNewItems) {
    List<TItem> result;

    if (items == null && mergedNewItems == null) {
      result = null;
    }
    if (items == null) {
      if (mergedNewItems?.isNotEmpty == true) {
        result = mergedNewItems;
      } else {
        result = null;
      }
    } else {
      result = [...(mergedNewItems ?? []), ...items];
    }

    _logger.finest(() => "_calculateNewItems \n"
        "\t items = ${items?.length} \n"
        "\t mergedNewItems = ${mergedNewItems.length} \n"
        "\t result = ${result?.length}");

    return result;
  }

  bool get isHaveUnmergedNewItems => unmergedNewItemsCount > 0;

  Stream<bool> get isHaveUnmergedNewItemsStream => unmergedNewItemsCountStream
      .map((isHaveUnmergedNewItems) => unmergedNewItemsCount > 0);

  @override
  List<TItem> get unmergedNewItems => _unmergedNewItemsSubject.value;

  @override
  Stream<List<TItem>> get unmergedNewItemsStream =>
      _unmergedNewItemsSubject.stream;

  @override
  int get unmergedNewItemsCount => unmergedNewItems?.length ?? 0;

  @override
  Stream<int> get unmergedNewItemsCountStream => unmergedNewItemsStream
      .map((unmergedNewItems) => unmergedNewItems?.length ?? 0);

  bool get isHaveMergedNewItems => mergedNewItemsCount > 0;

  Stream<bool> get isHaveMergedNewItemsStream => mergedNewItemsCountStream
      .map((isHaveMergedNewItems) => mergedNewItemsCount > 0);

  List<TItem> get mergedNewItems => _mergedNewItemsSubject.value;

  Stream<List<TItem>> get mergedNewItemsStream => _mergedNewItemsSubject.stream;

  int get mergedNewItemsCount => mergedNewItems?.length ?? 0;

  Stream<int> get mergedNewItemsCountStream =>
      mergedNewItemsStream.map((mergedNewItems) => mergedNewItems?.length ?? 0);

  @override
  mergeNewItems() {
    _logger.finest(() => "mergeNewItems \n"
        "\t unmergedNewItems = ${unmergedNewItems.length}\n"
        "\t mergedNewItems = ${mergedNewItems.length}\n");
    _mergedNewItemsSubject.add([...unmergedNewItems, ...mergedNewItems]);
    _unmergedNewItemsSubject.add([]);
    _logger.finest(() => "mergeNewItems after "
        "\t unmergedNewItems = ${unmergedNewItems.length}\n"
        "\t mergedNewItems = ${mergedNewItems.length}\n");
  }

  @override
  Future<bool> refresh() {
    clearNewItems();
    return super.refresh();
  }

  void clearNewItems() {
    _mergedNewItemsSubject.add([]);
    _unmergedNewItemsSubject.add([]);
  }

  int compareItems(TItem a, TItem b);
}
