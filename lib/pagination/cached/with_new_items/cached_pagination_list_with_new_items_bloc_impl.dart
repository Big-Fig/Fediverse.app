import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('cached_pagination_list_with_new_items_bloc_impl.dart');

abstract class CachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<TItem>,
        TItem extends IEqualComparableObj<TItem>>
    extends CachedPaginationListBloc<TPage, TItem>
    implements ICachedPaginationListWithNewItemsBloc<TPage, TItem> {
  final BehaviorSubject<List<TItem>> updatedItemsSubject =
      BehaviorSubject.seeded([]);

  // ignore: avoid-late-keyword
  late BehaviorSubject<_CombinedItemsResult<TItem>> combinedItemsResultSubject;

  List<TItem> get updatedItems => updatedItemsSubject.value;

  Stream<List<TItem>> get updatedItemsStream => updatedItemsSubject.stream;

  @override
  List<TItem> get items => combinedItemsResultSubject.value.resultItems;

  @override
  Stream<List<TItem>> get itemsStream => combinedItemsResultSubject.stream.map(
        (result) => result.resultItems,
      );

  @override
  TItem? get newerItem => items.isNotEmpty ? items.first : null;

  @override
  Stream<TItem?> get newerItemStream =>
      itemsStream.map((items) => items.isNotEmpty ? items.first : null);

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
  final bool asyncCalculateNewItems;
  final bool asyncCalculateActuallyNew;

  // todo: refactor
  // ignore: long-method
  CachedPaginationListWithNewItemsBloc({
    required this.mergeNewItemsImmediately,
    this.mergeNewItemsImmediatelyWhenItemsIsEmpty = true,
    this.watchNewerItemsWhenLoadedPagesIsEmpty = false,
    this.asyncCalculateNewItems = false,
    this.asyncCalculateActuallyNew = true,
    required ICachedPaginationBloc<TPage, TItem> paginationBloc,
  }) : super(cachedPaginationBloc: paginationBloc) {
    combinedItemsResultSubject = BehaviorSubject.seeded(
      _CombinedItemsResult<TItem>(
        request: _CalculateNewItemsInputData<TItem>(
          superItems: null,
          mergedNewItems: null,
          updatedItems: [],
        ),
        resultItems: [],
      ),
    );

    mergedNewItemsSubject.disposeWith(this);
    unmergedNewItemsSubject.disposeWith(this);
    updatedItemsSubject.disposeWith(this);
    combinedItemsResultSubject.disposeWith(this);

    newerItemStream.listen(
      (TItem? newerItem) {
        checkWatchNewItemsSubscription(newerItem);
      },
    ).disposeWith(this);

    if (mergeNewItemsImmediately) {
      unmergedNewItemsStream.listen(
        (unmergedNewItems) {
          if (unmergedNewItems.isNotEmpty) {
            mergeNewItems();
          }
        },
      ).disposeWith(this);
    }

    super.itemsStream.listen(
      (superItems) async {
        var calculateNewItemsRequest = _CalculateNewItemsInputData<TItem>(
          superItems: superItems,
          mergedNewItems: mergedNewItems,
          updatedItems: updatedItems,
        );

        await _updateCombinedItemsResult(calculateNewItemsRequest);
      },
    ).disposeWith(this);
    mergedNewItemsStream.listen(
      (mergedNewItems) async {
        var calculateNewItemsRequest = _CalculateNewItemsInputData<TItem>(
          superItems: super.items,
          mergedNewItems: mergedNewItems,
          updatedItems: updatedItems,
        );

        await _updateCombinedItemsResult(calculateNewItemsRequest);
      },
    ).disposeWith(this);
    updatedItemsStream.listen(
      (updatedItems) async {
        var calculateNewItemsRequest = _CalculateNewItemsInputData<TItem>(
          superItems: super.items,
          mergedNewItems: mergedNewItems,
          updatedItems: updatedItems,
        );

        await _updateCombinedItemsResult(calculateNewItemsRequest);
      },
    ).disposeWith(this);
  }

  Future _updateCombinedItemsResult(
    _CalculateNewItemsInputData<TItem> calculateNewItemsInputData,
  ) async {
    var oldResult = combinedItemsResultSubject.value;
    var request = _CalculateNewItemsRequest<TItem>(
      inputData: calculateNewItemsInputData,
      result: oldResult,
    );

    _CombinedItemsResult<TItem> newResult;
    if (asyncCalculateNewItems) {
      newResult = await compute(
        _calculateNewItems,
        request,
      );
    } else {
      newResult = _calculateNewItems(
        request,
      );
    }

    if (newResult.resultItems != oldResult.resultItems) {
      combinedItemsResultSubject.add(newResult);
    }
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
  int get unmergedNewItemsCount => unmergedNewItems.length;

  @override
  Stream<int> get unmergedNewItemsCountStream =>
      unmergedNewItemsStream.map((unmergedNewItems) => unmergedNewItems.length);

  bool get isHaveMergedNewItems => mergedNewItemsCount > 0;

  Stream<bool> get isHaveMergedNewItemsStream => mergedNewItemsCountStream
      .map((isHaveMergedNewItems) => mergedNewItemsCount > 0);

  @override
  List<TItem> get mergedNewItems => mergedNewItemsSubject.value;

  @override
  Stream<List<TItem>> get mergedNewItemsStream => mergedNewItemsSubject.stream;

  @override
  int get mergedNewItemsCount => mergedNewItems.length;

  @override
  Stream<int> get mergedNewItemsCountStream =>
      mergedNewItemsStream.map((mergedNewItems) => mergedNewItems.length);

  @override
  void mergeNewItems() {
    mergedNewItemsSubject.add(
      [
        ...unmergedNewItems,
        ...mergedNewItems,
      ],
    );
    unmergedNewItemsSubject.add([]);
  }

  @override
  Future<FediListSmartRefresherLoadingState> refreshWithoutController() async {
    var state = await super.refreshWithoutController();
    if (state == FediListSmartRefresherLoadingState.loaded) {
      clearNewItems();
    }

    return state;
  }

  @override
  void onItemUpdated(TItem item) {
    updatedItems.removeWhere((listItem) => listItem.isEqualTo(item));
    updatedItems.add(item);
    updatedItemsSubject.add([...updatedItems]);
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
    // dont watch new items before we something actually loaded
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

    _logger.finest(() => 'newerItem $newerItem');
    newItemsSubscription?.cancel();

    newItemsSubscription = createWatchNewItemsSubscription(newerItem);

    newItemsSubscription!.disposeWith(this);
  }

  bool isNewItemsAsyncCheckInProgress = false;

  Future waitForNewerItemsAsyncCheck({
    Duration pollInterval = Duration.zero,
  }) async {
    if (isNewItemsAsyncCheckInProgress) {
      final completer = Completer();
      final timer = Timer.periodic(pollInterval, (timer) {
        if (!isNewItemsAsyncCheckInProgress) {
          completer.complete();
        }
      });

      await completer.future;

      timer.cancel();
    }
  }

  StreamSubscription<List<TItem>> createWatchNewItemsSubscription(newerItem) {
    return watchItemsNewerThanItem(newerItem)
        .skipWhile((newItems) => !newItems.isNotEmpty)
        .listen(
      (newItems) async {
        isNewItemsAsyncCheckInProgress = true;

        try {
          var currentItems = items;

          // changed during sql request execute time
          // we need to filter again to be sure that newerItem is no

          var actuallyNewRequest = _CalculateActuallyNewRequest<TItem>(
            newItems: newItems,
            newerItem: newerItem,
            currentItems: currentItems,
          );

          List<TItem> actuallyNew;
          if (asyncCalculateActuallyNew) {
            actuallyNew = await compute(
              _calculateActuallyNew,
              actuallyNewRequest,
            );
          } else {
            actuallyNew = _calculateActuallyNew(
              actuallyNewRequest,
            );
          }

          // if newerItem already changed we shouldn't apply calculated changes
          // because new changes coming
          if (this.newerItem == newerItem) {
            _logger.finest(() => 'watchItemsNewerThanItem '
                '\n'
                '\t newItems ${newItems.length} \n'
                '\t actuallyNew = ${actuallyNew.length}');

            if (actuallyNew.isNotEmpty) {
              if (!currentItems.isNotEmpty &&
                  mergeNewItemsImmediatelyWhenItemsIsEmpty) {
                // merge immediately
                if (!mergedNewItemsSubject.isClosed) {
                  mergedNewItemsSubject.add(actuallyNew);
                }
              } else {
                if (!unmergedNewItemsSubject.isClosed) {
                  unmergedNewItemsSubject.add(actuallyNew);
                }
              }
            }
          }
        } finally {
          isNewItemsAsyncCheckInProgress = false;
        }
      },
    );
  }
}

class _CalculateNewItemsRequest<TItem extends IEqualComparableObj<TItem>> {
  final _CalculateNewItemsInputData<TItem> inputData;
  final _CombinedItemsResult<TItem> result;

  _CalculateNewItemsRequest({
    required this.inputData,
    required this.result,
  });
}

class _CalculateNewItemsInputData<TItem extends IEqualComparableObj<TItem>> {
  final List<TItem>? superItems;
  final List<TItem>? mergedNewItems;
  final List<TItem> updatedItems;

  _CalculateNewItemsInputData({
    required this.superItems,
    required this.mergedNewItems,
    required this.updatedItems,
  });

  @override
  String toString() {
    return '_CalculateNewItemsRequest{'
        'superItems: $superItems, '
        'updatedItems: $updatedItems, '
        'mergedNewItems: $mergedNewItems'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CalculateNewItemsInputData &&
          runtimeType == other.runtimeType &&
          superItems == other.superItems &&
          mergedNewItems == other.mergedNewItems &&
          updatedItems == other.updatedItems;

  @override
  int get hashCode =>
      superItems.hashCode ^ mergedNewItems.hashCode ^ updatedItems.hashCode;
}

_CombinedItemsResult<TItem>
    _calculateNewItems<TItem extends IEqualComparableObj<TItem>>(
  _CalculateNewItemsRequest<TItem> request,
) {
  var inputData = request.inputData;
  var oldResult = request.result;

  if (oldResult.request == inputData) {
    return oldResult;
  }

  List<TItem> resultList;

  var items = inputData.superItems;
  var mergedNewItems = inputData.mergedNewItems;
  var updatedItems = inputData.updatedItems;

  if (items == null && mergedNewItems == null) {
    resultList = [];
  }
  if (items == null) {
    if (mergedNewItems?.isNotEmpty == true) {
      resultList = mergedNewItems!;
    } else {
      resultList = [];
    }
  } else {
    resultList = [
      ...(mergedNewItems ?? []),
      ...items,
    ];
  }

  _logger.finest(() => '_calculateNewItems'
      ' \n'
      '\t items = ${items?.length} \n'
      '\t mergedNewItems = ${mergedNewItems?.length} \n'
      '\t updatedItems = ${updatedItems.length} \n'
      '\t resultList = ${resultList.length}');

  if (updatedItems.isNotEmpty) {
    resultList = resultList.map((resultListItem) {
      var index = updatedItems.indexWhere(
        (updatedItem) => updatedItem.isEqualTo(resultListItem),
      );

      if (index >= 0) {
        return updatedItems[index];
      } else {
        return resultListItem;
      }
    }).toList();

    // -1 for inverse
    resultList.sort((a, b) => a.compareTo(b) * -1);
  }

  return _CombinedItemsResult(
    request: inputData,
    resultItems: resultList,
  );
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CalculateActuallyNewRequest &&
          runtimeType == other.runtimeType &&
          newerItem == other.newerItem &&
          listEquals(newItems, other.newItems) &&
          listEquals(currentItems, other.currentItems) &&
          listEquals(currentItems, other.currentItems);

  @override
  int get hashCode =>
      newerItem?.hashCode ?? 0 ^ listHash(newItems) ^ listHash(currentItems);

  @override
  String toString() => '_CalculateActuallyNewRequest{'
      'newerItem: $newerItem, '
      'newItems: $newItems, '
      'currentItems: $currentItems'
      '}';
}

List<TItem> _calculateActuallyNew<TItem extends IEqualComparableObj<TItem>>(
  _CalculateActuallyNewRequest<TItem> request,
) {
  var newItems = request.newItems;
  var currentItems = request.currentItems;
  var newerItem = request.newerItem;

  // changed during sql request execute time
  // we need to filter again to be sure that newerItem is no
  var actuallyNew = newItems.where(
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
      if (currentItems.isNotEmpty) {
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

class _CombinedItemsResult<TItem extends IEqualComparableObj<TItem>> {
  final _CalculateNewItemsInputData request;
  final List<TItem> resultItems;

  _CombinedItemsResult({
    required this.request,
    required this.resultItems,
  });
}
