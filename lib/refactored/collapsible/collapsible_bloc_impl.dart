import 'dart:async';

import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class CollapsibleBloc extends DisposableOwner implements ICollapsibleBloc {
  // ignore: close_sinks
  BehaviorSubject<ICollapsibleItem> _currentVisibleItemSubject =
      BehaviorSubject();

  // ignore: close_sinks
  BehaviorSubject<bool> _isCurrentVisibleItemCollapsedSubject =
      BehaviorSubject();

  CollapsibleBloc() {
    addDisposable(subject: _currentVisibleItemSubject);
    addDisposable(subject: _isCurrentVisibleItemCollapsedSubject);
  }

  @override
  ICollapsibleItem get currentVisibleItem => _currentVisibleItemSubject.value;

  @override
  Stream<ICollapsibleItem> get currentVisibleItemStream =>
      _currentVisibleItemSubject.stream;

  StreamSubscription _currentItemSubscription;

  @override
  changeCurrentVisibleItem(ICollapsibleItem item) {
    _currentVisibleItemSubject.add(item);
    _currentItemSubscription?.cancel();
    _currentItemSubscription =
        currentVisibleItem.isCollapsedStream.listen((isCollapsed) {
      _isCurrentVisibleItemCollapsedSubject.add(isCollapsed);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _currentItemSubscription?.cancel();
  }

  @override
  bool get isCurrentVisibleItemCollapsed =>
      _isCurrentVisibleItemCollapsedSubject.value;

  @override
  Stream<bool> get isCurrentVisibleItemCollapsedStream =>
      _isCurrentVisibleItemCollapsedSubject.stream;

  @override
  bool get isCurrentVisibleItemPossibleToCollapse =>
      currentVisibleItem?.isPossibleToCollapse;

  @override
  Stream<bool> get isCurrentVisibleItemPossibleToCollapseStream =>
      currentVisibleItemStream
          .map((currentVisibleItem) => currentVisibleItem.isPossibleToCollapse);

  @override
  toggleCollapse() => currentVisibleItem.toggleCollapse();

  static CollapsibleBloc createFromContext(BuildContext context) =>
      CollapsibleBloc();
}
