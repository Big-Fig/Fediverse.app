import 'dart:async';

import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("home_bloc_impl.dart");

const List<HomeTab> _tabs = [
  HomeTab.timelines,
  HomeTab.notifications,
  HomeTab.messages,
  HomeTab.account,
];

class HomeBloc extends DisposableOwner implements IHomeBloc {
  // ignore: close_sinks
  final BehaviorSubject<HomeTab> _selectedTabSubject;
  final StreamController<HomeTab> _reselectedTabStreamController =
      StreamController.broadcast();

  @override
  Stream<HomeTab> get selectedTabStream => _selectedTabSubject.stream;

  @override
  HomeTab get selectedTab => _selectedTabSubject.value;

  final BehaviorSubject<bool> _isTimelinesUnreadSubject =
      BehaviorSubject.seeded(false);
  @override
  bool get isTimelinesUnread => _isTimelinesUnreadSubject.value;
  @override
  Stream<bool> get isTimelinesUnreadStream => _isTimelinesUnreadSubject.stream;

  HomeBloc({@required HomeTab startTab})
      : _selectedTabSubject = BehaviorSubject.seeded(startTab) {
    _logger.finest(() => "constructor");
    addDisposable(subject: _selectedTabSubject);
    addDisposable(subject: _isTimelinesUnreadSubject);
    addDisposable(streamController: _reselectedTabStreamController);
  }

  @override
  void selectTab(HomeTab tab) {

    _logger.finest(() => "selectTab $tab");
    if (selectedTab == tab) {
      _reselectedTabStreamController.add(tab);
    } else {
      _selectedTabSubject.add(tab);
    }
  }

  @override
  void updateTimelinesUnread(bool unread) {
    _isTimelinesUnreadSubject.add(unread);
  }

  @override
  List<HomeTab> get tabs => _tabs;

  @override
  Stream<HomeTab> get reselectedTabStream =>
      _reselectedTabStreamController.stream;

  @override
  Stream<bool> get selectedTabReselectedStream => Rx.combineLatest2(
      selectedTabStream,
      reselectedTabStream,
      (selectedTab, reselectedTab) => selectedTab == reselectedTab);
}
