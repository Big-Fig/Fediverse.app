import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FediTabIndicatorBloc<T> extends DisposableOwner
    implements IFediTabIndicatorBloc<T> {
  @override
  final TabController tabController;
  @override
  final List<T> items;

  FediTabIndicatorBloc({
    required this.tabController,
    required this.items,
  }) : selectedIndexSubject = BehaviorSubject.seeded(tabController.index) {
    selectedIndexSubject.disposeWith(this);

    var listener = () {
      selectedIndexSubject.add(tabController.index);
    };
    tabController.addListener(listener);

    addCustomDisposable(
      () => tabController.removeListener(listener),
    );
  }

  BehaviorSubject<int> selectedIndexSubject;

  @override
  T get selectedItem => items[selectedIndex!];

  @override
  Stream<T> get selectedItemStream =>
      selectedIndexStream.map((selectedIndex) => items[selectedIndex]);

  @override
  int? get selectedIndex => selectedIndexSubject.value;

  @override
  Stream<int> get selectedIndexStream => selectedIndexSubject.stream;

  @override
  void selectIndex(int index) {
    tabController.animateTo(index);
  }
}
