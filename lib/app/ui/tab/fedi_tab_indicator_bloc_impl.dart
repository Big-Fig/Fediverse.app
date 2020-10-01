import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FediTabIndicatorBloc<T> extends DisposableOwner
    implements IFediTabIndicatorBloc<T> {
  @override
  final TabController tabController;
  @override
  final List<T> items;

  FediTabIndicatorBloc({
    @required this.tabController,
    @required this.items,
  }) : selectedIndexSubject = BehaviorSubject.seeded(tabController.index) {
    addDisposable(subject: selectedIndexSubject);

    var listener = () {
      selectedIndexSubject.add(tabController.index);
    };
    tabController.addListener(listener);

    addDisposable(custom: () {
      tabController.removeListener(listener);
    });
  }

  BehaviorSubject<int> selectedIndexSubject;

  @override
  T get selectedItem => items[selectedIndex];

  @override
  Stream<T> get selectedItemStream =>
      selectedIndexStream.map((selectedIndex) => items[selectedIndex]);

  @override
  int get selectedIndex => selectedIndexSubject.value;

  @override
  Stream<int> get selectedIndexStream => selectedIndexSubject.stream;

  @override
  void selectIndex(int index) {
    tabController.animateTo(index);
  }
}
