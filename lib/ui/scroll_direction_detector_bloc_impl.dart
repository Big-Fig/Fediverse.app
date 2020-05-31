import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ScrollDirectionDetector extends DisposableOwner
    implements IScrollDirectionDetector {
  @override
  final ScrollController scrollController;

  ScrollDirectionDetector({@required this.scrollController})
      : scrollDirectionSubject = BehaviorSubject.seeded(null) {
    addDisposable(subject: scrollDirectionSubject);
    var listener = () {
      scrollDirectionSubject.add(scrollController.position.userScrollDirection);
    };
    scrollController.addListener(listener);
    addDisposable(custom: () {
      try {

      scrollController.removeListener(listener);
      } catch(e) {

      }
    });
  }

  BehaviorSubject<ScrollDirection> scrollDirectionSubject;

  @override
  Stream<ScrollDirection> get scrollDirectionStream =>
      scrollDirectionSubject.stream;

  @override
  ScrollDirection get scrollDirection => scrollDirectionSubject.value;
}
