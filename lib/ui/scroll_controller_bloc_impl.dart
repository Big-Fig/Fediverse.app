import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("scroll_controller_bloc_impl.dart");

class ScrollControllerBloc extends DisposableOwner
    implements IScrollControllerBloc {
  @override
  final ScrollController scrollController;

  DateTime lastDirectionSwitchDateTime;

  ScrollControllerBloc({@required this.scrollController})
      : scrollDirectionSubject = BehaviorSubject.seeded(null) {
    addDisposable(subject: scrollDirectionSubject);
    var listener = () {
      var previousScrollDirection = scrollDirection;
      var currentScrollDirection =
          scrollController.position.userScrollDirection;

      _logger.finest(() => "previous $previousScrollDirection "
          "current $currentScrollDirection");
      var now = DateTime.now();
      if (currentScrollDirection != previousScrollDirection) {
        lastDirectionSwitchDateTime = now;
        scrollDirectionSubject.add(currentScrollDirection);
        longScrollDirectionSubject.add(null);
      } else {
        var difference = now.difference(lastDirectionSwitchDateTime);
        var isLong = difference.inMilliseconds > 1000;
        _logger
            .finest(() => "difference $difference isLong $isLong");
        if (isLong) {
          longScrollDirectionSubject.add(currentScrollDirection);
        }
      }
    };
    scrollController.addListener(listener);
    addDisposable(custom: () {
      try {
        scrollController.removeListener(listener);
      } catch (e) {}
    });
  }

  BehaviorSubject<ScrollDirection> scrollDirectionSubject;

  @override
  Stream<ScrollDirection> get scrollDirectionStream =>
      scrollDirectionSubject.stream;

  @override
  ScrollDirection get scrollDirection => scrollDirectionSubject.value;
  BehaviorSubject<ScrollDirection> longScrollDirectionSubject =
      BehaviorSubject.seeded(null);

  @override
  Stream<ScrollDirection> get longScrollDirectionStream =>
      longScrollDirectionSubject.stream;

  @override
  ScrollDirection get longScrollDirection => longScrollDirectionSubject.value;

  @override
  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
