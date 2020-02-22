import 'package:fedi/app/home/page/timelines/timelines_home_page_bloc.dart';
import 'package:fedi/app/home/page/timelines/timelines_home_page_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

var _startIndex = 0;

class TimelinesHomePageBloc extends DisposableOwner
    implements ITimelinesHomePageBloc {
  final TickerProvider tickerProvider;

  @override
  List<TimelinesHomePageTab> tabs = [
    TimelinesHomePageTab.all,
    TimelinesHomePageTab.local,
    TimelinesHomePageTab.home
  ];

  @override
  void selectTab(int index) {
    var tab = tabs[index];
    tabsController.index = index;
    selectedTabSubject.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<TimelinesHomePageTab> selectedTabSubject;

  @override
  TimelinesHomePageTab get selectedTab => selectedTabSubject.value;

  @override
  Stream<TimelinesHomePageTab> get selectedTabStream =>
      selectedTabSubject.stream;

  @override
  TabController tabsController;

  TimelinesHomePageBloc({@required this.tickerProvider}) {
    tabsController = TabController(
        length: tabs.length, vsync: tickerProvider, initialIndex: _startIndex);

    selectedTabSubject = BehaviorSubject.seeded(tabs[_startIndex]);

    addDisposable(subject: selectedTabSubject);
    addDisposable(disposable: CustomDisposable(() {
      tabsController.dispose();
    }));
  }
}
