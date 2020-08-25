import 'dart:async';

import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("collapsible_bloc_impl.dart");

class CollapsibleBloc extends DisposableOwner implements ICollapsibleBloc {
  // ignore: close_sinks
  BehaviorSubject<List<ICollapsibleItem>> visibleItemsSubject =
      BehaviorSubject.seeded([]);
  @override
  List<ICollapsibleItem> get visibleItems => visibleItemsSubject.value;
  @override
  Stream<List<ICollapsibleItem>> get visibleItemsStream =>
      visibleItemsSubject.stream;

  Map<ICollapsibleItem, StreamSubscription> itemCollapsibleSubscriptionMap = {};

  // ignore: close_sinks
  BehaviorSubject<bool> isAtLeastOneVisibleItemExpandedSubject =
      BehaviorSubject.seeded(false);

  @override
  bool get isAtLeastOneVisibleItemExpanded =>
      isAtLeastOneVisibleItemExpandedSubject.value;

  @override
  Stream<bool> get isAtLeastOneVisibleItemExpandedStream =>
      isAtLeastOneVisibleItemExpandedSubject.stream;

  CollapsibleBloc() {
    addDisposable(subject: visibleItemsSubject);
    addDisposable(subject: isAtLeastOneVisibleItemExpandedSubject);
    addDisposable(disposable: CustomDisposable(() {
      itemCollapsibleSubscriptionMap.values
          .forEach((subscription) => subscription.cancel());
    }));
  }

  @override
  // ignore: always_declare_return_types
  void addVisibleItem(ICollapsibleItem item) {
    visibleItems.add(item);
    itemCollapsibleSubscriptionMap[item] = item.isCollapsedStream.listen((_) {
      checkIsAtLeastOneVisibleItemExpanded();
    });
    onVisibleItemsChanged(visibleItems);
  }

  void onVisibleItemsChanged(List<ICollapsibleItem> newVisibleItems) {
    _logger.finest(() => "onVisibleItemsChanged ${newVisibleItems.length}");
    visibleItemsSubject.add(newVisibleItems);
  }

  @override
  void removeVisibleItem(ICollapsibleItem item) {
    itemCollapsibleSubscriptionMap.remove(item)?.cancel();
    visibleItems.remove(item);
    onVisibleItemsChanged(visibleItems);
  }

  @override
  void collapseAllVisibleItems() {
    visibleItems.forEach((item) => item.collapse());
  }

  static CollapsibleBloc createFromContext(BuildContext context) =>
      CollapsibleBloc();

  static bool calculateIsAtLeastOneVisibleItemExpanded(
          List<ICollapsibleItem> visibleItems) =>
      visibleItems.fold(false,
          (previousValue, element) => previousValue || !element.isCollapsed);

  void checkIsAtLeastOneVisibleItemExpanded() {
    isAtLeastOneVisibleItemExpandedSubject
        .add(calculateIsAtLeastOneVisibleItemExpanded(visibleItems));
  }
}
