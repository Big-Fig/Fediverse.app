import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("cached_pagination_list_with_new_items_bloc_impl.dart");

abstract class CachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<TItem>,
        TItem extends IEqualComparableObj<TItem>>
    extends CachedPaginationListBloc<TPage, TItem>
    implements ICachedPaginationListWithNewItemsBloc<TPage, TItem> {
  late BehaviorSubject<List<TItem>> superItemsWithNewItemsSubject;

  @override
  List<TItem> get items => superItemsWithNewItemsSubject.value!;

  @override
  Stream<List<TItem>> get itemsStream => superItemsWithNewItemsSubject.stream;

  @override
  TItem? get newerItem => items.isNotEmpty == true ? items.first : null;

  @override
  Stream<TItem?> get newerItemStream =>
      itemsStream.map((items) => items.isNotEmpty == true ? items.first : null);

  Stream<List<TItem>> watchItemsNewerThanItem(TItem? item);

  @override
  final bool mergeNewItemsImmediately;

  // ignore: close_sinks
  final BehaviorSubject<List<TItem>> mergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: close_sinks
  final BehaviorSubject<List<TItem>> unmergedNewItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: cancel_subscriptions
  StreamSubscription? newItemsSubscription;

  final bool mergeNewItemsImmediatelyWhenItemsIsEmpty;

  TItem? previousNeverItem;

  final bool watchNewerItemsWhenLoadedPagesIsEmpty;

  CachedPaginationListWithNewItemsBloc({
    required this.mergeNewItemsImmediately,
    this.mergeNewItemsImmediatelyWhenItemsIsEmpty = true,
    this.watchNewerItemsWhenLoadedPagesIsEmpty = false,
    required ICachedPaginationBloc<TPage, TItem> paginationBloc,
  }) : super(cachedPaginationBloc: paginationBloc) {
    superItemsWithNewItemsSubject = BehaviorSubject.seeded(
      super.items,
    );

    addDisposable(subject: mergedNewItemsSubject);
    addDisposable(subject: unmergedNewItemsSubject);
    addDisposable(subject: superItemsWithNewItemsSubject);

    addDisposable(
      streamSubscription: newerItemStream.listen(
        (TItem? newerItem) {
          checkWatchNewItemsSubscription(newerItem);
        },
      ),
    );

    if (mergeNewItemsImmediately) {
      addDisposable(
        streamSubscription: unmergedNewItemsStream.listen(
          (unmergedNewItems) {
            if (unmergedNewItems.isNotEmpty == true) {
              mergeNewItems();
            }
          },
        ),
      );
    }

    addDisposable(
      streamSubscription: super.itemsStream.listen(
        (superItems) async {
          var calculateNewItemsRequest = _CalculateNewItemsRequest<TItem>(
            superItems: superItems,
            mergedNewItems: mergedNewItems,
          );

          var newItems = _calculateNewItems(calculateNewItemsRequest);

          superItemsWithNewItemsSubject.add(newItems);
        },
      ),
    );
    addDisposable(
      streamSubscription: mergedNewItemsStream.listen(
        (mergedNewItems) async {
          var calculateNewItemsRequest = _CalculateNewItemsRequest<TItem>(
            superItems: super.items,
            mergedNewItems: mergedNewItems,
          );

          var newItems = _calculateNewItems(calculateNewItemsRequest);
          superItemsWithNewItemsSubject.add(newItems);
        },
      ),
    );
  }

  bool get isHaveUnmergedNewItems => unmergedNewItemsCount > 0;

  Stream<bool> get isHaveUnmergedNewItemsStream => unmergedNewItemsCountStream
      .map((isHaveUnmergedNewItems) => unmergedNewItemsCount > 0);

  @override
  List<TItem> get unmergedNewItems => unmergedNewItemsSubject.value!;

  @override
  Stream<List<TItem>> get unmergedNewItemsStream =>
      unmergedNewItemsSubject.stream;

  @override
  int get unmergedNewItemsCount => unmergedNewItems.length;

  @override
  Stream<int> get unmergedNewItemsCountStream =>
      unmergedNewItemsStream.map((unmergedNewItems) => unmergedNewItems.length);

  bool get isHaveMergedNewItems => mergedNewItemsCount > 0;

  Stream<bool> get isHaveMergedNewItemsStream => mergedNewItemsCountStream
      .map((isHaveMergedNewItems) => mergedNewItemsCount > 0);

  @override
  List<TItem> get mergedNewItems => mergedNewItemsSubject.value!;

  @override
  Stream<List<TItem>> get mergedNewItemsStream => mergedNewItemsSubject.stream;

  @override
  int get mergedNewItemsCount => mergedNewItems.length;

  @override
  Stream<int> get mergedNewItemsCountStream =>
      mergedNewItemsStream.map((mergedNewItems) => mergedNewItems.length);

  @override
  void mergeNewItems() {
    _logger.finest(() => "mergeNewItems \n"
        "\t unmergedNewItems = ${unmergedNewItems.length}\n"
        "\t mergedNewItems = ${mergedNewItems.length}\n");
    mergedNewItemsSubject.add(
      [
        ...unmergedNewItems,
        ...mergedNewItems,
      ],
    );
    unmergedNewItemsSubject.add([]);

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

  void checkWatchNewItemsSubscription(TItem? newerItem) {
    // don't watch new items before we something actually loaded
    if (paginationBloc.loadedPagesCount == 0 &&
        !watchNewerItemsWhenLoadedPagesIsEmpty) {
      return;
    }

    var bothItemsIsNull = previousNeverItem == null && newerItem == null;
    var newItemsSubscriptionAlreadyExist = newItemsSubscription != null;
    if (bothItemsIsNull && newItemsSubscriptionAlreadyExist) {
      return;
    }

    var bothItemsNotNull = previousNeverItem != null && newerItem != null;
    if (bothItemsNotNull) {
      var isEqual = previousNeverItem!.isEqualTo(newerItem!);
      if (isEqual) {
        return;
      }
    }

    _logger.finest(() => "newerItem $newerItem");
    newItemsSubscription?.cancel();

    newItemsSubscription = createWatchNewItemsSubscription(newerItem);

    addDisposable(streamSubscription: newItemsSubscription);
  }

  StreamSubscription<List<TItem>> createWatchNewItemsSubscription(newerItem) {
    return watchItemsNewerThanItem(newerItem)
        .skipWhile((newItems) => newItems.isNotEmpty != true)
        .listen(
      (newItems) async {
        var currentItems = items;

        // changed during sql request execute time
        // we need to filter again to be sure that newerItem is no

        var actuallyNewRequest = _CalculateActuallyNewRequest<TItem>(
          newItems: newItems,
          newerItem: newerItem,
          currentItems: currentItems,
        );
        List<TItem> actuallyNew = await compute(
          _calculateActuallyNew,
          actuallyNewRequest,
        );

        _logger.finest(() => "watchItemsNewerThanItem "
            "\n"
            "\t newItems ${newItems.length} \n"
            "\t actuallyNew = ${actuallyNew.length}");

        if (actuallyNew.isNotEmpty == true) {
          if (currentItems.isNotEmpty != true &&
              mergeNewItemsImmediatelyWhenItemsIsEmpty) {
            // merge immediately
            mergedNewItemsSubject.add(actuallyNew);
          } else {
            unmergedNewItemsSubject.add(actuallyNew);
          }
        }
      },
    );
  }
}

class _CalculateNewItemsRequest<TItem> {
  final List<TItem>? superItems;
  final List<TItem>? mergedNewItems;

  _CalculateNewItemsRequest({
    required this.superItems,
    required this.mergedNewItems,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CalculateNewItemsRequest &&
          runtimeType == other.runtimeType &&
          superItems == other.superItems &&
          mergedNewItems == other.mergedNewItems;

  @override
  int get hashCode => superItems.hashCode ^ mergedNewItems.hashCode;

  @override
  String toString() {
    return '_CalculateNewItemsRequest{'
        'superItems: $superItems, '
        'mergedNewItems: $mergedNewItems'
        '}';
  }
}

List<TItem> _calculateNewItems<TItem>(
  _CalculateNewItemsRequest<TItem> request,
) {
  List<TItem>? result;

  var items = request.superItems;
  var mergedNewItems = request.mergedNewItems;

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
    result = [
      ...(mergedNewItems ?? []),
      ...items,
    ];
  }

  _logger.finest(() => "_calculateNewItems"
      " \n"
      "\t items = ${items?.length} \n"
      "\t mergedNewItems = ${mergedNewItems!.length} \n"
      "\t result = ${result?.length}");

  return result!;
}

class _CalculateActuallyNewRequest<TItem> {
  final TItem? newerItem;
  final List<TItem> newItems;
  final List<TItem> currentItems;

  _CalculateActuallyNewRequest({
    required this.newItems,
    required this.currentItems,
    required this.newerItem,
  });
}

List<TItem> _calculateActuallyNew<TItem extends IEqualComparableObj<TItem>>(
  _CalculateActuallyNewRequest<TItem> request,
) {
  var newItems = request.newItems;
  var currentItems = request.currentItems;
  var newerItem = request.newerItem;

  // changed during sql request execute time
  // we need to filter again to be sure that newerItem is no
  List<TItem> actuallyNew = newItems.where(
    (newItem) {
      if (newerItem != null) {
        return newItem.compareTo(newerItem) > 0;
      } else {
        return true;
      }
    },
  ).toList();

  // remove duplicates
  // sometimes local storage sqlite returns duplicated items
  // sometimes item is newer but already exist
  // for example chat updateAt updated
  actuallyNew = actuallyNew.where(
    (newItem) {
      bool isAlreadyExist;
      if (currentItems.isNotEmpty == true) {
        var found = currentItems.firstWhereOrNull(
          (oldItem) => newItem.isEqualTo(oldItem),
        );

        isAlreadyExist = found != null;
      } else {
        isAlreadyExist = false;
      }
      var isNeedToAdd = !isAlreadyExist;
      return isNeedToAdd;
    },
  ).toList();
  return actuallyNew;
}
