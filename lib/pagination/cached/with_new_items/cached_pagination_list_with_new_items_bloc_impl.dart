import 'dart:async';

import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("cached_pagination_list_with_new_items_bloc_impl.dart");

abstract class CachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<TItem>,
        TItem> extends CachedPaginationListBloc<TPage, TItem>
    implements ICachedPaginationListWithNewItemsBloc<TPage, TItem> {
  @override
  TItem get newerItem => items?.isNotEmpty == true ? items.first : null;

  @override
  Stream<TItem> get newerItemStream => itemsStream
      .map((items) => items?.isNotEmpty == true ? items.first : null);

  Stream<List<TItem>> watchItemsNewerThanItem(TItem item);

  @override
  final bool mergeNewItemsImmediately;

  // ignore: close_sinks
  final BehaviorSubject<List<TItem>> mergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: close_sinks
  final BehaviorSubject<List<TItem>> unmergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: cancel_subscriptions
  StreamSubscription newItemsSubscription;

  final bool mergeNewItemsImmediatelyWhenItemsIsEmpty;

  CachedPaginationListWithNewItemsBloc({
    @required this.mergeNewItemsImmediately,
    this.mergeNewItemsImmediatelyWhenItemsIsEmpty = true,
    @required ICachedPaginationBloc<TPage, TItem> paginationBloc,
  }) : super(cachedPaginationBloc: paginationBloc) {
    addDisposable(subject: mergedNewItemsSubject);
    addDisposable(subject: unmergedNewItemsSubject);

    addDisposable(
        streamSubscription: newerItemStream.distinct().listen((newerItem) {
//          clearNewItems();
      _logger.finest(() => "newerItem $newerItem");
      newItemsSubscription?.cancel();

      newItemsSubscription = watchItemsNewerThanItem(newerItem)
          .skipWhile((newItems) => newItems?.isNotEmpty != true)
          .listen(
        (newItems) {
          // we need to filter again to be sure that newerItem is no
          // changed during sql request execute time
          List<TItem> actuallyNew = newItems
              .where((newItem) => compareItemsToSort(newItem, newerItem) > 0)
              .toList();

          // remove duplicates
          // sometimes local storage sqlite returns duplicated items
          // sometimes item is newer but already exist
          // for example chat updateAt updated
          actuallyNew = removeDuplicatesAndUpdate(actuallyNew);

          _logger.finest(() => "watchItemsNewerThanItem "
              "\n"
              "\t newItems ${newItems.length} \n"
              "\t actuallyNew = ${actuallyNew.length}");

          if (actuallyNew?.isNotEmpty == true) {
            if (items?.isNotEmpty != true &&
                mergeNewItemsImmediatelyWhenItemsIsEmpty) {
              // merge immediately
              mergedNewItemsSubject.add(actuallyNew);
            } else {
              unmergedNewItemsSubject.add(actuallyNew);
            }
          }
        },
      );

      addDisposable(streamSubscription: newItemsSubscription);
    }));

    if (mergeNewItemsImmediately) {
      addDisposable(
        streamSubscription: unmergedNewItemsStream.listen(
          (unmergedNewItems) {
            if (unmergedNewItems?.isNotEmpty == true) {
              mergeNewItems();
            }
          },
        ),
      );
    }
  }

  List<TItem> removeDuplicatesAndUpdate(List<TItem> actuallyNew) =>
      actuallyNew.where(
        (newItem) {
          bool isAlreadyExist;
          if (items?.isNotEmpty == true) {
            var found = items.firstWhere(
              (oldItem) => isItemsEqual(newItem, oldItem),
              orElse: () => null,
            );

            isAlreadyExist = found != null;
          } else {
            isAlreadyExist = false;
          }
          var isNeedToAdd = !isAlreadyExist;
          return isNeedToAdd;
        },
      ).toList();

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

    _logger.finest(() => "_calculateNewItems"
        // " \n"
        // "\t items = ${items?.length} \n"
        // "\t mergedNewItems = ${mergedNewItems.length} \n"
        // "\t result = ${result?.length}"
        );

    return result;
  }

  bool get isHaveUnmergedNewItems => unmergedNewItemsCount > 0;

  Stream<bool> get isHaveUnmergedNewItemsStream => unmergedNewItemsCountStream
      .map((isHaveUnmergedNewItems) => unmergedNewItemsCount > 0);

  @override
  List<TItem> get unmergedNewItems => unmergedNewItemsSubject.value;

  @override
  Stream<List<TItem>> get unmergedNewItemsStream =>
      unmergedNewItemsSubject.stream;

  @override
  int get unmergedNewItemsCount => unmergedNewItems?.length ?? 0;

  @override
  Stream<int> get unmergedNewItemsCountStream => unmergedNewItemsStream
      .map((unmergedNewItems) => unmergedNewItems?.length ?? 0);

  bool get isHaveMergedNewItems => mergedNewItemsCount > 0;

  Stream<bool> get isHaveMergedNewItemsStream => mergedNewItemsCountStream
      .map((isHaveMergedNewItems) => mergedNewItemsCount > 0);

  @override
  List<TItem> get mergedNewItems => mergedNewItemsSubject.value;

  @override
  Stream<List<TItem>> get mergedNewItemsStream => mergedNewItemsSubject.stream;

  @override
  int get mergedNewItemsCount => mergedNewItems?.length ?? 0;

  @override
  Stream<int> get mergedNewItemsCountStream =>
      mergedNewItemsStream.map((mergedNewItems) => mergedNewItems?.length ?? 0);

  @override
  void mergeNewItems() {
    _logger.finest(() => "mergeNewItems \n"
        "\t unmergedNewItems = ${unmergedNewItems.length}\n"
        "\t mergedNewItems = ${mergedNewItems.length}\n");
    var lastMergedItems = unmergedNewItems;
    mergedNewItemsSubject.add([...unmergedNewItems, ...mergedNewItems]);
    unmergedNewItemsSubject.add([]);

    onNewItemsMerged(lastMergedItems);
    _logger.finest(() => "mergeNewItems after "
        "\t unmergedNewItems = ${unmergedNewItems.length}\n"
        "\t mergedNewItems = ${mergedNewItems.length}\n");
  }

  @override
  Future<FediListSmartRefresherLoadingState> refreshWithoutController() async {
    var state = await super.refreshWithoutController();
    if (state == FediListSmartRefresherLoadingState.loaded) {
      clearNewItems();
    }
    return state;
  }

  void clearNewItems() {
    if (!mergedNewItemsSubject.isClosed) {
      mergedNewItemsSubject.add([]);
    }
    if (!unmergedNewItemsSubject.isClosed) {
      unmergedNewItemsSubject.add([]);
    }
  }

  int compareItemsToSort(TItem a, TItem b);

  bool isItemsEqual(TItem a, TItem b);

  void onNewItemsMerged(List<TItem> unmergedNewItems) {
    // nothing by default
  }
}
