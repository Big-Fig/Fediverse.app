import 'package:fedi/refactored/app/home/home_bloc.dart';
import 'package:fedi/refactored/app/home/home_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("home_bloc_impl.dart");

class AppHomeBloc extends DisposableOwner implements IAppHomeBloc {
  // ignore: close_sinks
  final BehaviorSubject<AppHomeTab> _selectedTabSubject;

  @override
  Stream<AppHomeTab> get selectedTabStream => _selectedTabSubject.stream;

  @override
  AppHomeTab get selectedTab => _selectedTabSubject.value;

  AppHomeBloc({@required AppHomeTab startTab})
      : _selectedTabSubject = BehaviorSubject.seeded(startTab) {
    _logger.finest(() => "constructor");
    addDisposable(subject: _selectedTabSubject);
  }

  @override
  void selectTab(AppHomeTab tab) {
    _selectedTabSubject.add(tab);
  }
}
