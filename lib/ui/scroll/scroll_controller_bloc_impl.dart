import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("scroll_controller_bloc_impl.dart");

class ScrollControllerBloc extends DisposableOwner
    implements IScrollControllerBloc {
  static const longScrollMinimumDuration = Duration(seconds: 1);
  @override
  final ScrollController scrollController;


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


  DateTime lastDirectionSwitchDateTime;

  ScrollControllerBloc({@required this.scrollController})
      : scrollDirectionSubject = BehaviorSubject.seeded(null) {
    addDisposable(subject: scrollDirectionSubject);
    addDisposable(subject: longScrollDirectionSubject);
    var listener = () {
      _onScroll();
    };
    scrollController.addListener(listener);
    addDisposable(custom: () {
      try {
        scrollController.removeListener(listener);
      } catch (e) {
        _logger.warning(
            () => "cant dispose scroll controller listener");
      }
    });
  }

  void _onScroll() {
    var previousScrollDirection = scrollDirection;
    var currentScrollDirection = scrollController.position.userScrollDirection;

//    _logger.finest(() => "previous $previousScrollDirection "
//        "current $currentScrollDirection");

    if (currentScrollDirection != previousScrollDirection) {
      onScrollDirectionChanged(currentScrollDirection);
    } else {
      onScrollDirectionContinued(currentScrollDirection);
    }
  }

  void onScrollDirectionContinued(ScrollDirection currentScrollDirection) {
    bool longScroll = isLongScroll();
    if (longScroll) {
      longScrollDirectionSubject.add(currentScrollDirection);
    }
  }

  bool isLongScroll() {
    var now = DateTime.now();
    var differenceWithNow = now.difference(lastDirectionSwitchDateTime);
    var isLong = differenceWithNow.compareTo(longScrollMinimumDuration) > 0;
//    _logger.finest(() => "differenceWithNow $differenceWithNow isLong $isLong");
    return isLong;
  }

  void onScrollDirectionChanged(ScrollDirection currentScrollDirection) {
    var now = DateTime.now();
    lastDirectionSwitchDateTime = now;
    scrollDirectionSubject.add(currentScrollDirection);
    clearLongScrollDirection();
  }

  void clearLongScrollDirection() => longScrollDirectionSubject.add(null);

  @override
  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
