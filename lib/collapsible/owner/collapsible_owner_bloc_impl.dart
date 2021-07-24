import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/collapsible/item/collapsible_item_bloc.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('collapsible_owner_bloc_impl.dart');

class CollapsibleOwnerBloc extends DisposableOwner
    implements ICollapsibleOwnerBloc {
  // ignore: close_sinks
  BehaviorSubject<List<ICollapsibleItemBloc>?> visibleItemsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<ICollapsibleItemBloc>? get visibleItems =>
      visibleItemsSubject.valueOrNull;

  @override
  Stream<List<ICollapsibleItemBloc>?> get visibleItemsStream =>
      visibleItemsSubject.stream;

  Map<ICollapsibleItemBloc, StreamSubscription> itemCollapsibleSubscriptionMap =
      {};

  // ignore: close_sinks
  BehaviorSubject<bool> isAtLeastOneVisibleItemExpandedSubject =
      BehaviorSubject.seeded(false);

  @override
  bool? get isAtLeastOneVisibleItemExpanded =>
      isAtLeastOneVisibleItemExpandedSubject.valueOrNull;

  @override
  Stream<bool> get isAtLeastOneVisibleItemExpandedStream =>
      isAtLeastOneVisibleItemExpandedSubject.stream;

  CollapsibleOwnerBloc() {
    visibleItemsSubject.disposeWith(this);
    isAtLeastOneVisibleItemExpandedSubject.disposeWith(this);
    addCustomDisposable(
      () => itemCollapsibleSubscriptionMap.values.forEach(
        (subscription) => subscription.cancel(),
      ),
    );
  }

  @override
  // ignore: always_declare_return_types
  Future addVisibleItem(ICollapsibleItemBloc item) async {
    visibleItems!.add(item);
    itemCollapsibleSubscriptionMap[item] = item.isCollapsedStream.listen((_) {
      checkIsAtLeastOneVisibleItemExpanded();
    });
    onVisibleItemsChanged(visibleItems);
  }

  void onVisibleItemsChanged(List<ICollapsibleItemBloc>? newVisibleItems) {
    _logger.finest(() => 'onVisibleItemsChanged ${newVisibleItems!.length}');
    if (!visibleItemsSubject.isClosed) {
      visibleItemsSubject.add(newVisibleItems);
    }
  }

  @override
  Future removeVisibleItem(ICollapsibleItemBloc item) async {
    await itemCollapsibleSubscriptionMap.remove(item)?.cancel();
    visibleItems!.remove(item);
    onVisibleItemsChanged(visibleItems);
  }

  @override
  void collapseAllVisibleItems() {
    visibleItems!.forEach((item) => item.collapse());
  }

  static CollapsibleOwnerBloc createFromContext(BuildContext context) =>
      CollapsibleOwnerBloc();

  static bool calculateIsAtLeastOneVisibleItemExpanded(
    List<ICollapsibleItemBloc> visibleItems,
  ) =>
      visibleItems.fold(
        false,
        (previousValue, element) => previousValue || !element.isCollapsed!,
      );

  void checkIsAtLeastOneVisibleItemExpanded() {
    isAtLeastOneVisibleItemExpandedSubject
        .add(calculateIsAtLeastOneVisibleItemExpanded(visibleItems!));
  }
}
